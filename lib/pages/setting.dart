import 'package:flutter/material.dart';
import 'package:guitar_helper/pages/designs/setting_view.dart';
import 'package:guitar_helper/pages/settings/privacy_policy.dart';
import 'package:guitar_helper/pages/settings/terms_of_service.dart';
import 'package:guitar_helper/pages/settings/contact_us.dart';
import 'package:guitar_helper/main.dart'; // themeNotifier 접근을 위해 import

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final String _appVersion = "1.0.0";

  // 페이지 이동 내비게이션 함수
  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  // 준비 중인 기능 팝업
  void _showComingSoonDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('알림'),
          content: const Text('준비 중인 기능입니다.'),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // 알림 설정 페이지 구현 하기
  void _onNotificationTap() {
    _showComingSoonDialog();
  }

  // 프로필 설정 페이지 구현 하기
  void _onProfileTap() {
    _showComingSoonDialog();
  }

  // 튜너 설정 페이지 구현 하기
  void _onTunerPreferencesTap() {
    _showComingSoonDialog();
  }

  // TOS 페이지 이동
  void _onTermsTap() {
    _navigateTo(TosView(
      onBack: () => Navigator.of(context).pop(),
    ));
  }

  // PP 페이지 이동
  void _onPrivacyPolicyTap() {
    _navigateTo(PrivacyPolicyView(
      onBack: () => Navigator.of(context).pop(),
    ));
  }

  // CU 페이지 이동
  void _onContactTap() {
    _navigateTo(ContactUsView(
      onBack: () => Navigator.of(context).pop(),
    ));
  }

  // 다크모드 변경
  void _onDarkModeChanged() {
    themeNotifier.value = themeNotifier.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    // 현재 앱의 테마 상태를 확인하여 토글 값 결정
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SettingsView(
      onBack: () => Navigator.of(context).pop(),
      onNotificationTap: _onNotificationTap,
      onProfileTap: _onProfileTap,
      onTunerPreferencesTap: _onTunerPreferencesTap,
      onTermsTap: _onTermsTap,
      onPrivacyPolicyTap: _onPrivacyPolicyTap,
      onContactTap: _onContactTap,
      isDarkMode: isDarkMode,
      onDarkModeChanged: _onDarkModeChanged,
      appVersion: _appVersion,
    );
  }
}
