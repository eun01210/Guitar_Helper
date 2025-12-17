import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/fretboard.dart';
import 'package:guitar_helper/widgets/note.dart';

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
    _transformationController.addListener(clampFretboardPosition);
  }

  // 컨트롤러 해제
  @override
  void dispose() {
    _transformationController.removeListener(clampFretboardPosition);
    _transformationController.dispose();
    super.dispose();
  }

  // Matrix4는 (0, 0) -> X 배율, (1, 1) -> Y 배율,
  // (0, 3) -> X 위치, (1, 3) -> Y 위치 를 계산

  // 현재 배율 얻어오는 getter
  double get currentZoomScale => _transformationController.value.entry(0, 0);

  // 화면을 벗어난 경우 바로잡아주는 함수
  void clampFretboardPosition() {
    final Matrix4 currentMatrix = Matrix4.copy(_transformationController.value);
    final double currentTranslationX = currentMatrix.entry(0, 3);
    final double currentTranslationY = currentMatrix.entry(1, 3);

    final double liveScale = currentZoomScale; // 현재 배율

    // 확대가 돼서 화면보다 커진 경우 y좌표가 -가 될 수 있음
    final double topBoundary = (_viewerHeight > _fretHeight * liveScale)
        ? 0
        : _viewerHeight - _fretHeight * liveScale;

    // 화면에 빈 공간이 생기지 않는 y좌표 설정
    double clampedY =
        (currentTranslationY < topBoundary) ? topBoundary : currentTranslationY;
    clampedY = (clampedY > 0) ? 0 : clampedY;
    // 확대가 충분히 되지 않은 경우 가운데에 표시
    if (topBoundary >= 0) {
      clampedY = (_viewerHeight - _fretHeight * liveScale) / 2;
    }

    // 확대가 돼서 화면보다 커진 경우 x좌표가 -가 될 수 있음
    final double leftBoundary = (_viewerWidth > _fretWidth * liveScale)
        ? 0
        : _viewerWidth - _fretWidth * liveScale;

    // 화면에 빈 공간이 생기지 않게 x좌표 조절
    double clampedX = (currentTranslationX < leftBoundary)
        ? leftBoundary
        : currentTranslationX;
    // 화면 왼쪽에 여백이 생긴 경우 제거
    clampedX = (clampedX > 0) ? 0 : clampedX;

    // 좌표 설정
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

        // 초기 프렛 배율 설정
        if (!_initialScaleSet && _viewerWidth > 0) {
          _initialScaleSet = true;

          // 최소로 축소가능한 배율에 맞게 프렛 크기 설정
          _fretHeight = _fretHeight * (_viewerWidth / _fretWidth);
          _fretWidth = _viewerWidth;
          // 프렛보드 세로에 딱맞는 배율 설정
          final double scaleY = _viewerHeight / _fretHeight;

          // 프렛보드 세로 크기에 맞도록 초기 배율 설정
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              final Matrix4 matrix =
                  Matrix4.copy(_transformationController.value)
                    ..setEntry(0, 0, scaleY)
                    ..setEntry(1, 1, scaleY)
                    // 초기 위치를 (0,0)으로 설정
                    ..setEntry(0, 3, 0)
                    ..setEntry(1, 3, 0);
              _transformationController.value = matrix;
              setState(() => _currentScaleDisplay = scaleY);
            }
          });
        }

        return InteractiveViewer(
          transformationController: _transformationController,
          onInteractionEnd: (details) {
            setState(() => _currentScaleDisplay = currentZoomScale);
          },
          boundaryMargin: EdgeInsets.zero,
          minScale: 1.0, // 초기 크기를 화면에 맞게 설정하고 FIttedBox로 조절하므로 더 축소할 필요가 없음
          maxScale: 10.0, // 임의의 값
          panEnabled: _currentScaleDisplay > 1.0,
          // 충분히 확대되지 않은 경우 가로로만 드래그 가능
          panAxis: (_viewerHeight > 0 &&
                  _currentScaleDisplay <= _viewerHeight / _fretHeight)
              ? PanAxis.horizontal
              : PanAxis.free,
          child: FittedBox(
            // 화면 가로 크기에 맞게 확대/축소
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            child: GuitarFretboard(fretboardData: widget.fretboardData),
          ),
        );
      },
    );
  }
}
