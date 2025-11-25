import 'package:flutter/material.dart';
import 'package:my_app/pages/designs/setting_view.dart';

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

  void _onNotificationTap() {
    // TODO: 알림 설정 페이지 이동 로직 구현
    print("Notification Settings Tapped");
  }

  void _onProfileTap() {
    // TODO: 프로필 설정 페이지 이동 로직 구현
    print("Profile Settings Tapped");
  }

  void _onTunerPreferencesTap() {
    // TODO: 튜너 설정 페이지 이동 로직 구현
    print("Tuner Preferences Tapped");
  }

  void _onTermsTap() {
    // TODO: 이용약관 페이지 이동 로직 구현
    print("Terms of Service Tapped");
  }

  void _onPrivacyPolicyTap() {
    // TODO: 개인정보 처리방침 페이지 이동 로직 구현
    print("Privacy Policy Tapped");
  }

  void _onContactTap() {
    // TODO: 문의하기 페이지 이동 로직 구현
    print("Contact Us Tapped");
  }

  void _onDarkModeChanged(bool value) {
    // TODO: 다크 모드 상태 변경 로직 구현
    setState(() {
      _isDarkMode = value;
    });
    print("Dark Mode changed to: $value");
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
