import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/pages/designs/title_view.dart';
import 'package:my_app/pages/chord.dart';
import 'package:my_app/pages/scale.dart';
import 'package:my_app/pages/tuner.dart';
import 'package:my_app/pages/metronome.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  void initState() {
    super.initState();
    // 세로 모드로 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 각 메뉴 탭 시 실행될 내비게이션 함수
    void navigateTo(Widget page) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }

    // 설정 버튼 탭 시 (현재는 기능 없음)
    void openSettings() {
      // TODO: 설정 페이지 로직 구현
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Settings Tapped!')));
    }

    return TitleView(
      onChordTap: () => navigateTo(const ChordPage()),
      onScaleTap: () => navigateTo(const ScalePage()),
      onTunerTap: () => navigateTo(const TunerPage()),
      onMetronomeTap: () => navigateTo(const MetronomePage()),
      onSettingsTap: openSettings,
    );
  }
}
