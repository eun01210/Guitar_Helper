import 'package:flutter/material.dart';
import 'package:my_app/pages/designs/title_view.dart';
import 'package:my_app/pages/chord.dart';
import 'package:my_app/pages/scale.dart';
import 'package:my_app/pages/tuner.dart';
import 'package:my_app/pages/metronome.dart';
import 'package:my_app/pages/setting.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
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
