import 'package:flutter/material.dart';

ThemeData lightColor() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFF3F4F6), // 라이트모드 배경색
    primaryColor: const Color(0xFF38BDF8), // 메인 브랜드 컬러
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF13C8EC),
      primaryContainer: Color(0xFF5F5F66),
      surface: Color(0xFFFFFFFF), // 카드 배경색
      onSurface: Color(0xFF18181B), // 기본 글자색
      onSurfaceVariant: Color(0xFF71717A), // 보조 글자색

      secondary: Color(0xFFFFFFFF), // Chord 카드 배경
      secondaryContainer: Color(0xFFF1F1F1), // Chord 버튼 배경
      tertiary: Color(0xFFF6F8F8), // Chord 배경
      outline: Color(0xFF27272A), // Chord 버튼 텍스트
      outlineVariant: Color(0xFFE4E4E7), // Chord 토글 선택 배경
    ),
  );
}

ThemeData darkColor() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212), // 다크모드 배경색
    primaryColor: const Color(0xFF13C8EC), // 메인 브랜드 컬러
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF13C8EC),
      primaryContainer: Color(0xFFE5E5E5),
      surface: Color(0xFF1E1E1E), // 카드 배경색
      onSurface: Color(0xFFE5E5E5), // 기본 글자색
      onSurfaceVariant: Color(0xFFA8A29E), // 보조 글자색

      secondary: Color(0xFF171717), // Chord 카드 배경
      secondaryContainer: Color(0xFF27272A), // Chord 버튼 배경
      tertiary: Color(0xFF101F22), // Chord 배경
      outline: Color(0xFFD4D4D8), // Chord 버튼 텍스트
      outlineVariant: Color(0xFF3F3F46), // Chord 토글 선택 배경
    ),
  );
}
