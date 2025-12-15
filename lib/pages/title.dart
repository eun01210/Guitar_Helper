import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guitar_helper/pages/designs/title_view.dart';
import 'package:guitar_helper/pages/chord.dart';
import 'package:guitar_helper/pages/scale.dart';
import 'package:guitar_helper/pages/tuner.dart';
import 'package:guitar_helper/pages/metronome.dart';
import 'package:guitar_helper/pages/setting.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  void initState() {
    super.initState();
    // 위젯이 빌드된 후 시스템 UI 설정을 적용합니다.
    _setSystemUIPreferences();
  }

  void _setSystemUIPreferences() {
    // 앱 전체를 세로 모드로 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // 시스템 UI를 몰입 모드(Immersive Mode)로 설정
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 각 메뉴 탭 시 실행될 내비게이션 함수
    void navigateTo(Widget page) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }

    return TitleView(
      onChordTap: () => navigateTo(const ChordPage()),
      onScaleTap: () => navigateTo(const ScalePage()),
      onTunerTap: () => navigateTo(const TunerPage()),
      onMetronomeTap: () => navigateTo(const MetronomePage()),
      onSettingsTap: () => navigateTo(const SettingsPage()),
    );
  }
}
