import 'package:flutter/material.dart';

ThemeData darkColor() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212), // 타이틀 배경 컬러
    primaryColor: const Color(0xFF13C8EC), // 메이저 컬러
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF13C8EC), // 메이저 컬러
      primaryContainer: Color(0xFFE5E5E5), // 프렛 점, 선 컬러
      onPrimary: Color(0x331F2937), // 세팅 카드 배경 컬러
      onPrimaryContainer: Color(0xFF6B7280), // 세팅 부제 글씨 컬러
      secondary: Color(0xFF171717), // 코드/스케일 카드, 버튼 컬러
      secondaryContainer: Color(0xFF27272A), // 메트로놈 버튼, 셀렉트 박스 컬러
      onSurface: Color(0xFFE5E5E5), // 기본 텍스트 컬러
      surfaceContainer: Color(0x80374151), // 세팅 구분선, 튜너 미터기 컬러
      onSurfaceVariant: Color(0xFFA8A29E), // 서브 텍스트 컬러
      tertiary: Color(0xFF101F22), // 기본 배경 컬러
      outline: Color(0xFFD4D4D8), // 버튼 텍스트 컬러
      outlineVariant: Color(0xFF3F3F46), // 손/도 토글 배경, 메트로놈 버튼 컬러
    ),
  );
}

ThemeData lightColor() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFF3F4F6),
    primaryColor: const Color(0xFF38BDF8),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF13C8EC),
      primaryContainer: Color(0xFF5F5F66),
      onPrimary: Color(0x33FFFFFF),
      onPrimaryContainer: Color(0xFF6B7280),
      secondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFFFFFFF),
      onSurface: Color(0xFF18181B),
      surfaceContainer: Color(0x8097A1B1),
      onSurfaceVariant: Color(0xFF71717A),
      tertiary: Color(0xFFF6F8F8),
      outline: Color(0xFF27272A),
      outlineVariant: Color(0xFFE4E4E7),
    ),
  );
}
