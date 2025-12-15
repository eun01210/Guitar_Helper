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

  void _onBack() {
    Navigator.of(context).pop();
  }

  // ((onBack 콜백을 받는 위젯)을 생성하는 함수)를 인자로 받음
  void _onNavigate(
    Widget Function({required VoidCallback onBack}) pageBuilder,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // 페이지 위젯을 생성, onBack 콜백 제공
        builder: (context) => pageBuilder(
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

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

  void _onNotificationTap() {
    // TODO: 알림 설정 페이지 이동 로직 구현
    _showComingSoonDialog();
  }

  void _onProfileTap() {
    // TODO: 프로필 설정 페이지 이동 로직 구현
    _showComingSoonDialog();
  }

  void _onTunerPreferencesTap() {
    // TODO: 튜너 설정 페이지 이동 로직 구현
    _showComingSoonDialog();
  }

  void _onTermsTap() {
    _onNavigate(TosView.new);
  }

  void _onPrivacyPolicyTap() {
    _onNavigate(PrivacyPolicyView.new);
  }

  void _onContactTap() {
    _onNavigate(ContactUsView.new);
  }

  void _onDarkModeChanged() {
    themeNotifier.value = themeNotifier.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    // 현재 앱의 테마 상태를 확인하여 스위치 값 결정
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SettingsView(
      onBack: _onBack,
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
