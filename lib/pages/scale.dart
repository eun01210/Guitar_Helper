import 'package:flutter/material.dart';
import 'package:my_app/widgets/select.dart';
import 'package:my_app/widgets/check.dart';
import 'package:my_app/widgets/fretboard.dart';
import 'package:my_app/util/createscale.dart';

class ScalePage extends StatefulWidget {
  const ScalePage({super.key});

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  String? _selChord = 'C'; // 코드 초기값
  String? _selScale = 'Penta Major'; // 스케일 초기값
  bool _isSharp = false; // # 온오프
  bool _isFlat = false; // b 온오프

  // 여기부터는 확대/축소 관리용 controller 설정
  late final TransformationController _transformationController; // 컨트롤러 선언
  double _currentScaleDisplay = 1.0; // 현재 확대 값
  double _viewerWidth = 0.0; // InteractiveViewer의 너비를 저장할 변수
  double _viewerHeight = 0.0; // InteractiveViewer의 높이를 저장할 변수
  bool _initialScaleSet = false; // 초기 배율 설정 여부 플래그

  // Controller 초기화
  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _transformationController.addListener(_onTransformationChanged);
  }

  // Controller 해제
  @override
  void dispose() {
    _transformationController.removeListener(_onTransformationChanged);
    _transformationController.dispose();
    super.dispose();
  }

  void _onTransformationChanged() {
    clampFretboardPosition();
    /* 주석처리를 해제하면 상호작용 중일때는 작동하지 않음.
    if (!_transformationController.value.isIdentity()) {
    }*/
  }

  // 확대 배율 가져오기
  double get currentZoomScale {
    // Matrix4의 (0, 0) 인덱스에서 X축 스케일 값을 반환
    return _transformationController.value.entry(0, 0);
  }

  // 프렛보드가 화면 밖으로 벗어나지 않도록 위치를 보정하는 메서드
  void clampFretboardPosition() {
    final Matrix4 currentMatrix = Matrix4.copy(_transformationController.value);
    final double currentTranslationX = currentMatrix.entry(0, 3);
    final double currentTranslationY = currentMatrix.entry(1, 3);

    // --- Y축 경계 처리 ---
    // 상단 경계 (더 위로 못 올라가게)
    final double liveScale = currentZoomScale; // 실시간 배율 가져오기
    final double topBoundary =
        (_viewerHeight > 150 * liveScale) ? 0 : _viewerHeight - 150 * liveScale;
    double clampedY =
        (currentTranslationY < topBoundary) ? topBoundary : currentTranslationY;
    // 하단 경계 (더 아래로 못 내려가게)
    clampedY = (clampedY > 0) ? 0 : clampedY;

    // --- X축 경계 처리 ---
    // 왼쪽 경계 (더 왼쪽으로 못 가게)
    final double leftBoundary =
        (_viewerWidth > 758.0 * liveScale)
            ? 0
            : _viewerWidth - 758.0 * liveScale;
    double clampedX =
        (currentTranslationX < leftBoundary)
            ? leftBoundary
            : currentTranslationX;
    // 오른쪽 경계 (더 오른쪽으로 못 가게)
    clampedX = (clampedX > 0) ? 0 : clampedX;

    currentMatrix.setEntry(0, 3, clampedX); // 보정된 X축 값 설정
    currentMatrix.setEntry(1, 3, clampedY); // 보정된 Y축 값 설정
    _transformationController.value = currentMatrix;
  }

  // 여기까지가 controller 설정

  // #과 b의 체크박스 관리. 하나가 활성화되면 하나를 제거
  void _handleAccidentalChange(bool? value, bool accidental) {
    // accidental이 true면 #, false면 b
    if (value == true) {
      setState(() {
        _isSharp = (accidental) ? true : false;
        _isFlat = (accidental) ? false : true;
      });
    } else {
      setState(() {
        _isSharp = (accidental) ? false : _isSharp;
        _isFlat = (accidental) ? _isFlat : false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 현재 기기 방향을 감지
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Scale Diagram',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            ChordSelectBox(
              selectedItem: _selChord,
              onChanged: (newValue) {
                setState(() {
                  _selChord = newValue;
                });
              },
              items: ['C', 'D', 'E', 'F', 'G', 'A', 'B'],
            ),
            const SizedBox(width: 10),
            Check(
              isChecked: _isSharp,
              text: "#",
              onChanged: (newValue) {
                _handleAccidentalChange(newValue, true);
              },
            ),
            Check(
              isChecked: _isFlat,
              text: "b",
              onChanged: (newValue) {
                _handleAccidentalChange(newValue, false);
              },
            ),
            const SizedBox(width: 10),
            ChordSelectBox(
              selectedItem: _selScale,
              onChanged: (newValue) {
                setState(() {
                  _selScale = newValue;
                });
              },
              items: scales.keys.toList(),
            ),
          ],
        ),
        // 뒤로가기 버튼은 Appbar에서 자동 생성
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child:
            orientation == Orientation.portrait
                ? _buildPortraitLayout(chordMap(_selChord)) // 세로 모드일 때
                : _buildLandscapeLayout(chordMap(_selChord)), // 가로 모드일 때
      ),
    );
  }

  // 가로 모드 UI를 빌드하는 메서드
  Widget _buildLandscapeLayout(int chord) {
    return Row(
      children: [
        // 기타 지판 위젯을 Expanded로 감싸서 남은 공간을 모두 차지하게 함
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // LayoutBuilder를 통해 얻은 최대 높이를 상태에 저장
              _viewerWidth = constraints.maxWidth;
              _viewerHeight = constraints.maxHeight;

              // 위젯이 빌드된 후, 딱 한 번만 실행하여 초기 배율을 설정
              if (!_initialScaleSet && _viewerWidth > 0) {
                _initialScaleSet = true;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    final double minScale = _viewerWidth / 758.0;
                    final Matrix4 matrix =
                        Matrix4.copy(_transformationController.value)
                          ..setEntry(0, 0, minScale)
                          ..setEntry(1, 1, minScale);
                    _transformationController.value = matrix;
                    setState(() {
                      _currentScaleDisplay = minScale;
                    });
                  }
                });
              }

              final double minScale =
                  (_viewerWidth > 0) ? _viewerWidth / 758.0 : 1.0;

              return InteractiveViewer(
                transformationController: _transformationController,

                // 상호작용(스크롤)이 끝나면 현재 배율을 저장
                onInteractionEnd: (details) {
                  setState(() {
                    _currentScaleDisplay = currentZoomScale;
                  });
                },

                boundaryMargin: EdgeInsets.zero,
                // 화면 너비보다 작게 축소되지 않도록 minScale 설정 (758.0은 프렛보드 전체 너비)
                minScale: minScale,
                maxScale: 3.0, // 최대 확대 배율
                panEnabled:
                    _currentScaleDisplay > minScale, // 최소 배율보다 클 때만 스크롤 활성화
                panAxis:
                    (_viewerHeight > 0 &&
                            _currentScaleDisplay <= _viewerHeight / 150)
                        ? PanAxis
                            .horizontal // 세로가 화면에 맞을 때 수평 스크롤만
                        : PanAxis.free, // 자유 스크롤

                child: GuitarFretboard(
                  chord: chord + accidental(_isSharp, _isFlat),
                  scale:
                      scales[_selScale]!, // 선택된 스케일 이름으로 ScaleDefinition 객체를 찾아 전달
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 세로 모드 UI를 빌드하는 메서드
  Widget _buildPortraitLayout(int chord) {
    return Row(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              _viewerWidth = constraints.maxWidth;
              _viewerHeight = constraints.maxHeight;

              // 위젯이 빌드된 후, 딱 한 번만 실행하여 초기 배율을 설정
              if (!_initialScaleSet && _viewerWidth > 0) {
                _initialScaleSet = true;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    final double minScale = _viewerWidth / 758.0;
                    final Matrix4 matrix =
                        Matrix4.copy(_transformationController.value)
                          ..setEntry(0, 0, minScale)
                          ..setEntry(1, 1, minScale);
                    _transformationController.value = matrix;
                    setState(() {
                      _currentScaleDisplay = minScale;
                    });
                  }
                });
              }

              final double minScale =
                  (_viewerWidth > 0) ? _viewerWidth / 758.0 : 1.0;

              return InteractiveViewer(
                transformationController: _transformationController,
                onInteractionEnd: (details) {
                  setState(() {
                    _currentScaleDisplay = currentZoomScale;
                  });
                },
                boundaryMargin: EdgeInsets.zero,
                minScale: minScale,
                maxScale: 3.0,
                panEnabled:
                    _currentScaleDisplay > minScale, // 최소 배율보다 클 때만 스크롤 활성화
                panAxis:
                    (_viewerHeight > 0 &&
                            _currentScaleDisplay <= _viewerHeight / 150)
                        ? PanAxis
                            .horizontal // 세로가 화면에 맞을 때 수평 스크롤만
                        : PanAxis.free, // 자유 스크롤
                child: GuitarFretboard(
                  chord: chord + accidental(_isSharp, _isFlat),
                  scale:
                      scales[_selScale]!, // 선택된 스케일 이름으로 ScaleDefinition 객체를 찾아 전달
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
