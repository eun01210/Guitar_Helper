import 'package:flutter/material.dart';
import 'package:my_app/pages/title.dart';
import 'package:flutter/services.dart';

void main() {
  // 위젯 바인딩 초기화 보장
  WidgetsFlutterBinding.ensureInitialized();

  // 시스템 UI를 몰입 모드(Immersive Mode)로 설정
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky, // 시스템 바를 숨기고, 스와이프해도 바로 사라짐
    overlays: [], // 표시할 UI를 넣으면 나타남
  );

  // 화면 방향을 가로모드로 강제 고정
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, // 왼쪽으로 기울인 가로
    DeviceOrientation.landscapeRight, // 오른쪽으로 기울인 가로
  ]).then((value) => runApp(const MyApp())); // 방향 설정이 완료된 후 앱을 실행
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guitar Chord',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const TitleScreen(),
    );
  }
}
