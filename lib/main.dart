import 'package:flutter/material.dart';
import 'package:guitar_helper/pages/title.dart';
import 'package:guitar_helper/util/theme_color.dart';

// 테마 상태 관리자 (앱 전체에서 접근, 기본값: 다크)
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Guitar Helper',
          themeMode: currentMode, // 현재 테마 적용 (light/dark)
          theme: lightColor(),
          darkTheme: darkColor(),
          home: TitleScreen(),
        );
      },
    );
  }
}
