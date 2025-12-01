import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar.dart';

class TitleView extends StatelessWidget {
  final VoidCallback onChordTap;
  final VoidCallback onScaleTap;
  final VoidCallback onTunerTap;
  final VoidCallback onMetronomeTap;
  final VoidCallback onSettingsTap;

  const TitleView({
    super.key,
    required this.onChordTap,
    required this.onScaleTap,
    required this.onTunerTap,
    required this.onMetronomeTap,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF121212);
    const Color mainTextColor = Color(0xFFE5E5E5);
    const Color secondaryTextColor = Color(0xFFA8A29E);
    // 화면 너비에 따른 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.5);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Guitar Helper',
        onSettings: onSettingsTap,
        textColor: mainTextColor,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            // 웹과 같은 넓은 화면에서 최대 너비 제한
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                Expanded(
                  child: _buildGrid(
                    context,
                    mainTextColor,
                    secondaryTextColor,
                    scaleFactor,
                  ),
                ),
                _buildFooter(secondaryTextColor, scaleFactor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 메뉴 -> 기능이 있는 버튼 표시
  Widget _buildGrid(
    BuildContext context,
    Color mainTextColor,
    Color secondaryTextColor,
    double scaleFactor,
  ) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16 * scaleFactor,
      mainAxisSpacing: 16 * scaleFactor,
      padding: EdgeInsets.all(20 * scaleFactor),
      children: [
        _MenuCard(
          icon: Icons.music_note,
          title: 'Chord',
          subtitle: 'Find any chord',
          onTap: onChordTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
          scaleFactor: scaleFactor,
        ),
        _MenuCard(
          icon: Icons.show_chart,
          title: 'Scale',
          subtitle: 'Practice scales',
          onTap: onScaleTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
          scaleFactor: scaleFactor,
        ),
        _MenuCard(
          icon: Icons.graphic_eq,
          title: 'Tuner',
          subtitle: 'Tune your guitar',
          onTap: onTunerTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
          scaleFactor: scaleFactor,
        ),
        _MenuCard(
          icon: Icons.timer,
          title: 'Metronome',
          subtitle: 'Keep the rhythm',
          onTap: onMetronomeTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
          scaleFactor: scaleFactor,
        ),
      ],
    );
  }

  // 푸터 -> 저작권 표시
  Widget _buildFooter(Color secondaryTextColor, double scaleFactor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0 * scaleFactor),
      child: Text(
        '© 2025. Eun, Hwangbo. All Rights Reserved.',
        style: TextStyle(fontSize: 12 * scaleFactor, color: secondaryTextColor),
      ),
    );
  }
}

// 메뉴 버튼 레이아웃
class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color mainTextColor;
  final Color secondaryTextColor;
  final double scaleFactor;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.mainTextColor,
    required this.secondaryTextColor,
    required this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardColor = Color(0xFF1E1E1E);
    const Color primaryColor = Color(0xFF13C8EC);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(13, 0, 0, 0),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: primaryColor, size: 32 * scaleFactor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18 * scaleFactor,
                    fontWeight: FontWeight.bold,
                  ).copyWith(color: mainTextColor),
                ),
                const SizedBox(height: 4),
                // 공간이 모자라면 크기가 줄어듦
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14 * scaleFactor,
                      color: secondaryTextColor,
                    ),
                    maxLines: 1, // 한 줄로 표시
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
