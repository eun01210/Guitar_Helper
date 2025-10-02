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

  @override
  void initState() {
    super.initState();
    // Controller 초기화
    _transformationController = TransformationController();
    _transformationController.addListener(_onTransformationChanged);
  }

  @override
  void dispose() {
    // Controller 해제
    _transformationController.removeListener(_onTransformationChanged);
    _transformationController.dispose();
    super.dispose();
  }

  void _onTransformationChanged() {
    centerFretboardVertically();
    /*    만약 상호작용 중에도 실시간으로 적용하고 싶다면 이 분기는 제거합니다.
    if (!_transformationController.value.isIdentity()) {
    }*/
  }

  // 확대 배율 가져오기
  double get currentZoomScale {
    // Matrix4의 (0, 0) 인덱스에서 X축 스케일 값을 반환
    return _transformationController.value.entry(0, 0);
  }

  // 프렛이 화면을 벗어나지 않게 확대/드래그 가능
  void centerFretboardVertically() {
    // 현재 x, y값을 가져오며, x값은 유지
    final Matrix4 currentMatrix = Matrix4.copy(_transformationController.value);
    final double currentTranslationX = currentMatrix.entry(0, 3);
    final double currentTranslationY = currentMatrix.entry(1, 3);
    currentMatrix.setEntry(0, 3, currentTranslationX); // X축 값 유지

    // 250(expanding 범위) - 150(프렛 높이) * 비율로 위로 드래그 할 수 있는 기준 설정 %%%(명확한 범위 설정 필요.)
    final double outRange = 250 - 150 * _currentScaleDisplay;
    final double standardY = (outRange > 0) ? 0 : outRange;
    // 범위를 벗어나면 기준으로 설정, 아니면 그대로
    final double valueY =
        (standardY > currentTranslationY) ? standardY : currentTranslationY;

    currentMatrix.setEntry(1, 3, valueY); // Y축 값 덮어씌우기
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
            const SizedBox(width: 10), // 제목과 콤보박스 사이 간격
            ChordSelectBox(
              selectedItem: _selChord, // 현재 값 전달
              onChanged: (newValue) {
                // 콜백을 통해 받은 새 값을 setState로 업데이트
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
            const SizedBox(width: 10), // 체크 박스 간격
            ChordSelectBox(
              selectedItem: _selScale, // 현재 값 전달
              onChanged: (newValue) {
                // 콜백을 통해 받은 새 값을 setState로 업데이트
                setState(() {
                  _selScale = newValue;
                });
              },
              items: scales.keys.toList(),
            ),
          ],
        ),
        // 뒤로가기 버튼은 자동으로 생성됩니다.
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
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
          child: InteractiveViewer(
            transformationController: _transformationController,

            onInteractionEnd: (details) {
              // 2. setState를 호출하여 화면을 다시 그립니다.
              setState(() {
                // 3. ✨ 이때 TransformationController의 최신 값을 가져와 상태 변수를 업데이트합니다.
                _currentScaleDisplay = currentZoomScale;
              });
            },

            boundaryMargin: EdgeInsets.zero,
            minScale: 1.0, // 최소 축소 배율 (원래 크기의 30%)
            maxScale: 3.0, // 최대 확대 배율 (원래 크기의 300%)

            panAxis:
                (_currentScaleDisplay < 1.6) // %%%명확한 배율 기준 필요
                    ? PanAxis.horizontal
                    : PanAxis.free,

            child: GuitarFretboard(
              chord: chord + accidental(_isSharp, _isFlat),
              scale: scaleMap(_selScale),
            ),
          ),
        ),
      ],
    );
  }

  // 세로 모드 UI를 빌드하는 메서드 (@수정 안 함)
  Widget _buildPortraitLayout(int chord) {
    return Column(
      /*
      children: [
        const SizedBox(height: 20), // 위쪽 여백
        SizedBox(
          height: 240, // 원하는 높이를 지정하세요
          child: GuitarFretboard(chord: chord),
        ),
      ],*/
    );
  }
}

/* 이걸 기준으로 확대 만들기? 아니면 현재 비율을 기준으로 고정하기?
return LayoutBuilder(
    builder: (context, constraints) {
      final double screenWidth = constraints.maxWidth;
      // 지판 전체 너비: 24프렛 + 0번프렛 + 좌측 여백 = 1300.0px 가정
      const double fretboardFullWidth = 1300.0; 
      
      // 화면 너비에 딱 맞게 축소될 비율을 계산합니다.
      final double scaleFactor = screenWidth / fretboardFullWidth;
      
      return Column(
        children: [
          // 프렛보드가 차지할 공간에 대한 제약
          SizedBox(
            // 높이는 고정값, 너비는 화면 전체를 사용합니다.
            height: 250, // GuitarFretboard의 실제 높이보다 약간 크게 설정
            width: screenWidth, 
            child: Transform.scale(
              scale: scaleFactor, 
              // ✨ 좌측 상단(0,0) 기준으로 축소되도록 설정
              alignment: Alignment.topLeft, 
              
              child: SizedBox(
                // 축소 후 원래 크기를 유지하여 내용물이 잘리지 않게 합니다.
                width: fretboardFullWidth,
                height: 250 / scaleFactor, // 비율에 맞춰 높이 확장
                
                child: GuitarFretboard(
                  chord: chord + accidental(_isSharp, _isFlat),
                  scale: scaleMap(_selScale),
                ),
              ),
            ),
          ),
          // 나머지 공간을 Spacer로 채워 아래쪽 여백 제거
          const Spacer(),
        ],
      );
    },
  );
  */
