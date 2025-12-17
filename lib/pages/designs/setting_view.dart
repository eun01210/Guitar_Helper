import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/appbar.dart';

class SettingsView extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;
  final VoidCallback onTunerPreferencesTap;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyPolicyTap;
  final VoidCallback onContactTap;
  final VoidCallback onDarkModeChanged;

  final bool isDarkMode;
  final String appVersion;

  const SettingsView({
    super.key,
    required this.onBack,
    required this.onNotificationTap,
    required this.onProfileTap,
    required this.onTunerPreferencesTap,
    required this.onTermsTap,
    required this.onPrivacyPolicyTap,
    required this.onContactTap,
    required this.isDarkMode,
    required this.onDarkModeChanged,
    required this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color primaryColor = colorScheme.primary;
    final Color backgroundColor = colorScheme.tertiary;
    final Color textColor = colorScheme.onSurface;
    final Color subTextColor = colorScheme.onSurfaceVariant;
    final Color subHeaderColor = colorScheme.onPrimaryContainer;
    final Color cardBgColor = colorScheme.onPrimary;
    final Color dividerColor = colorScheme.surfaceContainer;
    final Color switchBgColor = colorScheme.outlineVariant;

    // 화면 너비에 따른 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 1.5);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Settings',
        onBack: onBack,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0 * scaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 알림 설정 (현재 구현 X)
            _buildSectionHeader('Notifications', subHeaderColor, scaleFactor),
            _buildCard(cardBgColor, scaleFactor, [
              _buildSettingsItem(
                icon: Icons.notifications,
                text: 'Notifications',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                scaleFactor: scaleFactor,
                onTap: onNotificationTap,
                enabled: false,
              ),
            ]),
            SizedBox(height: 32 * scaleFactor),

            _buildSectionHeader('General', subHeaderColor, scaleFactor),
            _buildCard(cardBgColor, scaleFactor, [
              // 프로필 설정 (현재 구현 X)
              _buildSettingsItem(
                icon: Icons.person,
                text: 'Profile Settings',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                scaleFactor: scaleFactor,
                onTap: onProfileTap,
                enabled: false,
              ),
              _Divider(color: dividerColor, scaleFactor: scaleFactor),
              // 다크모드 설정
              _buildSettingsItem(
                icon: Icons.dark_mode,
                text: 'Dark Mode',
                primaryColor: primaryColor,
                textColor: textColor,
                scaleFactor: scaleFactor,
                trailing: IgnorePointer(
                  child: _buildToggleSwitch(
                    isActive: isDarkMode,
                    onChanged: (_) {}, // 빈 함수를 넣어 활성화된 디자인 유지
                    activeColor: primaryColor,
                    inactiveColor: switchBgColor,
                    scaleFactor: scaleFactor,
                  ),
                ),
                onTap: onDarkModeChanged,
                enabled: true,
              ),
              _Divider(color: dividerColor, scaleFactor: scaleFactor),
              // 튜너 설정 (현재 구현 X)
              _buildSettingsItem(
                icon: Icons.tune,
                text: 'Tuner Preferences',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                scaleFactor: scaleFactor,
                trailing: Row(
                  children: [
                    Text(
                      'Standard',
                      style: TextStyle(
                        fontSize: 14 * scaleFactor,
                        color: subTextColor,
                      ),
                    ),
                    SizedBox(width: 8 * scaleFactor),
                    Icon(
                      Icons.chevron_right,
                      color: subTextColor,
                      size: 24 * scaleFactor,
                    ),
                  ],
                ),
                onTap: onTunerPreferencesTap,
                enabled: false,
              ),
            ]),
            SizedBox(height: 32 * scaleFactor),

            // 정보 탭
            _buildSectionHeader('Information', subHeaderColor, scaleFactor),
            _buildCard(cardBgColor, scaleFactor, [
              // TOS
              _buildSettingsItem(
                icon: Icons.gavel,
                text: 'Terms of Service',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                scaleFactor: scaleFactor,
                onTap: onTermsTap,
              ),
              _Divider(color: dividerColor, scaleFactor: scaleFactor),
              // PP
              _buildSettingsItem(
                icon: Icons.shield,
                text: 'Privacy Policy',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                scaleFactor: scaleFactor,
                onTap: onPrivacyPolicyTap,
              ),
              _Divider(color: dividerColor, scaleFactor: scaleFactor),
              // CU
              _buildSettingsItem(
                icon: Icons.email,
                text: 'Contact Us',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                scaleFactor: scaleFactor,
                onTap: onContactTap,
              ),
            ]),
            SizedBox(height: 32 * scaleFactor),

            // Footer
            Center(
              child: Text(
                'App Version $appVersion',
                style: TextStyle(
                  fontSize: 14 * scaleFactor,
                  color: subHeaderColor,
                ),
              ),
            ),
            SizedBox(height: 16 * scaleFactor),
          ],
        ),
      ),
    );
  }

  // 섹션 헤더 (일반, 정보 등)
  Widget _buildSectionHeader(String title, Color color, double scaleFactor) {
    return Padding(
      padding: EdgeInsets.only(left: 16 * scaleFactor, bottom: 8 * scaleFactor),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14 * scaleFactor,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  // 섹션 카드
  Widget _buildCard(Color bgColor, double scaleFactor, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12 * scaleFactor),
      ),
      child: Column(children: children),
    );
  }

  // 섹션별 메뉴 버튼
  Widget _buildSettingsItem({
    required IconData icon,
    required String text,
    required Color primaryColor,
    required Color textColor,
    Color subTextColor = Colors.grey,
    required double scaleFactor,
    Widget? trailing,
    VoidCallback? onTap,
    bool enabled = true,
  }) {
    final Color iconColor = enabled ? primaryColor : subTextColor;
    final Color itemTextColor = enabled ? textColor : subTextColor;
    final Color iconBgColor =
        enabled ? primaryColor.withAlpha(51) : subTextColor.withAlpha(51);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * scaleFactor,
          vertical: 12 * scaleFactor,
        ),
        child: Row(
          children: [
            Container(
              width: 40 * scaleFactor,
              height: 40 * scaleFactor,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 24 * scaleFactor),
            ),
            SizedBox(width: 16 * scaleFactor),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16 * scaleFactor,
                  fontWeight: FontWeight.w500,
                  color: itemTextColor,
                ),
              ),
            ),
            trailing ??
                (onTap != null && enabled
                    ? Icon(
                        Icons.chevron_right,
                        color: subTextColor,
                        size: 24 * scaleFactor,
                      )
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  // 다크모드 토글
  Widget _buildToggleSwitch({
    required bool isActive,
    required ValueChanged<bool>? onChanged,
    required Color activeColor,
    required Color inactiveColor,
    required double scaleFactor,
  }) {
    return Transform.scale(
      scale: scaleFactor,
      child: Switch(
        value: isActive,
        onChanged: onChanged,
        activeThumbColor: Colors.white,
        activeTrackColor: activeColor,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: inactiveColor,
        trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
        trackOutlineWidth: WidgetStatePropertyAll(0),
      ),
    );
  }
}

// 디바이더 (구분선)
class _Divider extends StatelessWidget {
  final Color color;
  final double scaleFactor;
  const _Divider({required this.color, required this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color,
      margin: EdgeInsets.symmetric(horizontal: 16 * scaleFactor),
    );
  }
}
