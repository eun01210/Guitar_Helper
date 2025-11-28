import 'package:flutter/material.dart';
import 'package:my_app/pages/designs/setting_view.dart';
import 'package:my_app/pages/settings/privacy_policy.dart';
import 'package:my_app/pages/settings/terms_of_service.dart';
import 'package:my_app/pages/settings/contact_us.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = true; // 현재는 다크모드 UI만 있으므로 true로 고정
  final String _appVersion = "1.0.0";

  void _onBack() {
    Navigator.of(context).pop();
  }

  // `onBack` 콜백을 받는 위젯을 생성하는 함수를 인자로 받습니다.
  void _onNavigate(
    Widget Function({required VoidCallback onBack}) pageBuilder,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // 전달받은 함수를 사용하여 페이지 위젯을 생성하고 onBack 콜백을 제공합니다.
        builder:
            (context) => pageBuilder(
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

  void _onDarkModeChanged(bool value) {
    // TODO: 다크 모드 상태 변경 로직 구현
    _showComingSoonDialog();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsView(
      onBack: _onBack,
      onNotificationTap: _onNotificationTap,
      onProfileTap: _onProfileTap,
      onTunerPreferencesTap: _onTunerPreferencesTap,
      onTermsTap: _onTermsTap,
      onPrivacyPolicyTap: _onPrivacyPolicyTap,
      onContactTap: _onContactTap,
      isDarkMode: _isDarkMode,
      onDarkModeChanged: _onDarkModeChanged,
      appVersion: _appVersion,
    );
  }
}
