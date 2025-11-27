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

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: CustomAppBar(
        title: 'Settings',
        onBack: onBack,
        textColor: textColor,
        backgroundColor: const Color(0xCC101F22),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Section
            _buildSectionHeader('Notifications', subHeaderColor),
            _buildCard(cardBgColor, [
              _buildSettingsItem(
                icon: Icons.notifications,
                text: 'Notifications',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                onTap: onNotificationTap,
              ),
            ]),
            const SizedBox(height: 32),

            // General Settings Section
            _buildSectionHeader('General', subHeaderColor),
            _buildCard(cardBgColor, [
              _buildSettingsItem(
                icon: Icons.person,
                text: 'Profile Settings',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                onTap: onProfileTap,
              ),
              const _Divider(color: dividerColor),
              _buildSettingsItem(
                icon: Icons.dark_mode,
                text: 'Dark Mode',
                primaryColor: primaryColor,
                textColor: textColor,
                trailing: _buildToggleSwitch(
                  isActive: isDarkMode,
                  onChanged: onDarkModeChanged,
                  activeColor: primaryColor,
                  inactiveColor: switchBgColor,
                ),
              ),
              const _Divider(color: dividerColor),
              _buildSettingsItem(
                icon: Icons.tune,
                text: 'Tuner Preferences',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                trailing: Row(
                  children: [
                    const Text(
                      'Standard',
                      style: TextStyle(fontSize: 14, color: subTextColor),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.chevron_right, color: subTextColor, size: 24),
                  ],
                ),
                onTap: onTunerPreferencesTap,
              ),
            ]),
            const SizedBox(height: 32),

            // Information Section
            _buildSectionHeader('Information', subHeaderColor),
            _buildCard(cardBgColor, [
              _buildSettingsItem(
                icon: Icons.gavel,
                text: 'Terms of Service',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                onTap: onTermsTap,
              ),
              const _Divider(color: dividerColor),
              _buildSettingsItem(
                icon: Icons.shield,
                text: 'Privacy Policy',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                onTap: onPrivacyPolicyTap,
              ),
              const _Divider(color: dividerColor),
              _buildSettingsItem(
                icon: Icons.email,
                text: 'Contact Us',
                primaryColor: primaryColor,
                textColor: textColor,
                subTextColor: subTextColor,
                onTap: onContactTap,
              ),
            ]),
            const SizedBox(height: 32),

            // Footer
            Center(
              child: Text(
                'App Version $appVersion',
                style: const TextStyle(fontSize: 14, color: subHeaderColor),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildCard(Color bgColor, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String text,
    required Color primaryColor,
    required Color textColor,
    Color? subTextColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            trailing ??
                (onTap != null
                    ? Icon(Icons.chevron_right, color: subTextColor, size: 24)
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleSwitch({
    required bool isActive,
    required ValueChanged<bool> onChanged,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return Switch(
      value: isActive,
      onChanged: onChanged,
      activeColor: Colors.white,
      activeTrackColor: activeColor,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: inactiveColor,
    );
  }
}

class _Divider extends StatelessWidget {
  final Color color;
  const _Divider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
