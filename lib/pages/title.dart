import 'package:flutter/material.dart';
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
