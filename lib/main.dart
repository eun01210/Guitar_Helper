import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guitar_helper/pages/title.dart';
import 'package:guitar_helper/util/theme_color.dart';

// 테마 상태 관리자 (앱 전체에서 접근, 기본값: 다크)
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 저장된 테마 불러오기
  final prefs = await SharedPreferences.getInstance();
  final String? savedTheme = prefs.getString('themeMode');

  // 테마가 light인 경우 변경 (기본값은 dark)
  if (savedTheme == 'light') {
    themeNotifier.value = ThemeMode.light;
  }

  // 테마 값 변경 시 저장
  themeNotifier.addListener(() {
    prefs.setString(
        'themeMode', themeNotifier.value == ThemeMode.light ? 'light' : 'dark');
  });

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
