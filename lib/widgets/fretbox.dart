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
  double _viewerWidth = 0.0; // 기기 가로 길이
  double _viewerHeight = 0.0; // 기기 세로 길이
  bool _initialScaleSet = false; // 초기 길이 설정 여부

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
        (_viewerHeight > 150 * liveScale) ? 0 : _viewerHeight - 150 * liveScale;
    double clampedY =
        (currentTranslationY < topBoundary) ? topBoundary : currentTranslationY;
    clampedY = (clampedY > 0) ? 0 : clampedY;

    final double leftBoundary =
        (_viewerWidth > 758.0 * liveScale)
            ? 0
            : _viewerWidth - 758.0 * liveScale;
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
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              final double minScale = _viewerWidth / 758.0; // 758은 프렛 총 길이
              final Matrix4 matrix =
                  Matrix4.copy(_transformationController.value)
                    ..setEntry(0, 0, minScale)
                    ..setEntry(1, 1, minScale);
              _transformationController.value = matrix;
              setState(() => _currentScaleDisplay = minScale);
            }
          });
        }

        // 최소 배율 제한
        final double minScale = (_viewerWidth > 0) ? _viewerWidth / 758.0 : 1.0;

        return InteractiveViewer(
          transformationController: _transformationController,
          onInteractionEnd: (details) {
            setState(() => _currentScaleDisplay = currentZoomScale);
          },
          boundaryMargin: EdgeInsets.zero,
          minScale: minScale,
          maxScale: 3.0,
          panEnabled: _currentScaleDisplay > minScale,
          panAxis:
              (_viewerHeight > 0 &&
                      _currentScaleDisplay <= _viewerHeight / 150) // 150은 프렛 높이
                  ? PanAxis.horizontal
                  : PanAxis.free,
          child: GuitarFretboard(fretboardData: widget.fretboardData),
        );
      },
    );
  }
}
