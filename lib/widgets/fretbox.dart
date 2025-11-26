import 'package:flutter/material.dart';
import 'package:my_app/widgets/fretboard.dart';
import 'package:my_app/widgets/note.dart';

// 스크롤이 가능한 박스 위젯
class GuitarFretBox extends StatefulWidget {
  final List<List<NoteData?>> fretboardData;

  const GuitarFretBox({super.key, required this.fretboardData});

  @override
  State<GuitarFretBox> createState() => _InteractiveFretboardState();
}

class _InteractiveFretboardState extends State<GuitarFretBox> {
  late final TransformationController
  _transformationController; // 컨트롤러(배율, 위치 등)
  double _currentScaleDisplay = 1.0; // 현재 배율 관리
  double _viewerWidth = 0.0; // 부모 가로 길이
  double _viewerHeight = 0.0; // 부모 세로 길이
  bool _initialScaleSet = false; // 초기 길이 설정 여부

  // 프렛보드 widget기준 크기, 실제로는 fitted로 달라짐
  double _fretWidth = 708.0; // 프렛보드 너비, 실제 값은 다름
  double _fretHeight = 150.0; // 프렛 세로 길이, 실제 값은 다름

  // 컨트롤러 사용
  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _transformationController.addListener(_onTransformationChanged);
  }

  // 컨트롤러 해제
  @override
  void dispose() {
    _transformationController.removeListener(_onTransformationChanged);
    _transformationController.dispose();
    super.dispose();
  }

  // 항상 프렛보드가 화면을 벗어나는지 확인
  void _onTransformationChanged() {
    clampFretboardPosition();
  }

  // 현재 배율 얻어오는 getter
  double get currentZoomScale => _transformationController.value.entry(0, 0);

  // 화면을 벗어난 경우 바로잡아주는 함수
  void clampFretboardPosition() {
    final Matrix4 currentMatrix = Matrix4.copy(_transformationController.value);
    final double currentTranslationX = currentMatrix.entry(0, 3);
    final double currentTranslationY = currentMatrix.entry(1, 3);

    final double liveScale = currentZoomScale;

    final double topBoundary =
        (_viewerHeight > _fretHeight * liveScale)
            ? 0
            : _viewerHeight - _fretHeight * liveScale;
    double clampedY =
        (currentTranslationY < topBoundary) ? topBoundary : currentTranslationY;
    clampedY = (clampedY > 0) ? 0 : clampedY;

    final double leftBoundary =
        (_viewerWidth > _fretWidth * liveScale)
            ? 0
            : _viewerWidth - _fretWidth * liveScale;
    double clampedX =
        (currentTranslationX < leftBoundary)
            ? leftBoundary
            : currentTranslationX;

    clampedX = (clampedX > 0) ? 0 : clampedX;

    currentMatrix.setEntry(0, 3, clampedX);
    currentMatrix.setEntry(1, 3, clampedY);
    _transformationController.value = currentMatrix;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewerWidth = constraints.maxWidth;
        _viewerHeight = constraints.maxHeight;

        // 초기 프렛 배율 설정 (최소 배율 설정)
        if (!_initialScaleSet && _viewerWidth > 0) {
          _initialScaleSet = true;

          _fretHeight = _fretHeight * (_viewerWidth / _fretWidth);
          _fretWidth = _viewerWidth;
          print(
            'vH: $_viewerHeight, vW: $_viewerWidth, fH: $_fretHeight, fW: $_fretWidth',
          );
          // 프렛보드 세로에 맞는 배율 설정
          final double scaleY = _viewerHeight / _fretHeight;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              // Matrix4는 (0, 0) -> X 배율, (1, 1) -> Y 배율,
              // (0, 3) -> X 위치, (1, 3) -> Y 위치 를 계산
              final Matrix4 matrix =
                  Matrix4.copy(_transformationController.value)
                    ..setEntry(0, 0, scaleY)
                    ..setEntry(1, 1, scaleY)
                    ..setEntry(0, 3, 0) // 초기 위치를 (0,0)으로 설정
                    ..setEntry(1, 3, 0);
              _transformationController.value = matrix;
              setState(() => _currentScaleDisplay = scaleY);
            }
          });
        }
        /* 
        // 최소 배율 제한 -> fittedBox를 사용함으로써 제거
        final double scaleX =
            (_viewerWidth > 0) ? _viewerWidth / _fretWidth : 1.0;
        final double scaleY =
            (_viewerHeight > 0) ? _viewerHeight / _fretHeight : 1.0;
        final double minScale = (scaleX < scaleY ? scaleX : scaleY);
        */

        return InteractiveViewer(
          transformationController: _transformationController,
          onInteractionEnd: (details) {
            setState(() => _currentScaleDisplay = currentZoomScale);
          },
          boundaryMargin: EdgeInsets.zero,
          minScale: 1.0, // minScale -> 1.0
          maxScale: 10.0,
          panEnabled: _currentScaleDisplay > 1.0, // minScale -> 1.0
          panAxis:
              (_viewerHeight > 0 &&
                      _currentScaleDisplay <= _viewerHeight / _fretHeight)
                  ? PanAxis.horizontal
                  : PanAxis.free,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.topLeft,
            child: GuitarFretboard(fretboardData: widget.fretboardData),
          ),
        );
      },
    );
  }
}
