import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar.dart';

class SettingsView extends StatelessWidget {
  // Callbacks for interactions
  final VoidCallback onBack;
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;
  final VoidCallback onTunerPreferencesTap;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyPolicyTap;
  final VoidCallback onContactTap;

  // Data for UI state
  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeChanged;
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
    // Design colors from HTML (dark mode)
    const Color primaryColor = Color(0xFF13C8EC);
    const Color backgroundDark = Color(0xFF101F22);
    const Color textColor = Color(0xFFE5E7EB); // text-gray-200
    const Color subTextColor = Color(0xFF9CA3AF); // text-gray-400
    const Color subHeaderColor = Color(0xFF6B7280); // text-gray-500
    const Color cardBgColor = Color(0x331F2937); // bg-gray-800/20
    const Color dividerColor = Color(0x80374151); // bg-gray-700/50
    const Color switchBgColor = Color(0xFF374151); // bg-gray-700

    // 화면 너비에 따른 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 1.5);

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: CustomAppBar(
        title: 'Settings',
        onBack: onBack,
        textColor: textColor,
        backgroundColor: const Color(0xCC101F22),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0 * scaleFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Section
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

            // General Settings Section
            _buildSectionHeader('General', subHeaderColor, scaleFactor),
            _buildCard(cardBgColor, scaleFactor, [
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
              _buildSettingsItem(
                icon: Icons.dark_mode,
                text: 'Dark Mode',
                primaryColor: primaryColor,
                textColor: textColor,
                scaleFactor: scaleFactor,
                trailing: _buildToggleSwitch(
                  isActive: isDarkMode, // 현재 상태는 유지
                  onChanged: null, // 비활성화
                  activeColor: primaryColor, // 활성 색상
                  inactiveColor: switchBgColor, // 비활성 색상
                  scaleFactor: scaleFactor, // 스케일
                ),
                onTap: null, // 탭 비활성화
                enabled: false, // 비활성화 상태로 설정
              ),
              _Divider(color: dividerColor, scaleFactor: scaleFactor),
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

            // Information Section
            _buildSectionHeader('Information', subHeaderColor, scaleFactor),
            _buildCard(cardBgColor, scaleFactor, [
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

  Widget _buildCard(Color bgColor, double scaleFactor, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12 * scaleFactor),
      ),
      child: Column(children: children),
    );
  }

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
        activeTrackColor: Colors.grey, // activeColor, 현재는 비활성화
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: inactiveColor,
      ),
    );
  }
}

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
