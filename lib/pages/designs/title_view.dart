import 'package:flutter/material.dart';

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
    // HTML의 다크 모드 디자인 색상을 고정적으로 사용
    const Color backgroundColor = Color(0xFF121212);
    const Color mainTextColor = Color(0xFFE5E5E5);
    const Color secondaryTextColor = Color(0xFFA8A29E);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context, mainTextColor),
            // Main Content (Grid)
            Expanded(
              child: _buildGrid(context, mainTextColor, secondaryTextColor),
            ),
            // Footer
            _buildFooter(secondaryTextColor),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color mainTextColor) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: const Alignment(-0.4, 0), // 정중앙(0.0)에서 왼쪽으로 살짝 이동
            child: Text(
              'Guitar Helper',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: mainTextColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 28,
              onPressed: onSettingsTap,
              color: mainTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    Color mainTextColor,
    Color secondaryTextColor,
  ) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      padding: const EdgeInsets.all(20),
      children: [
        _MenuCard(
          icon: Icons.music_note,
          title: 'Chord',
          subtitle: 'Find any chord',
          onTap: onChordTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
        ),
        _MenuCard(
          icon: Icons.show_chart,
          title: 'Scale',
          subtitle: 'Practice scales',
          onTap: onScaleTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
        ),
        _MenuCard(
          icon: Icons.graphic_eq,
          title: 'Tuner',
          subtitle: 'Tune your guitar',
          onTap: onTunerTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
        ),
        _MenuCard(
          icon: Icons.timer,
          title: 'Metronome',
          subtitle: 'Keep the rhythm',
          onTap: onMetronomeTap,
          mainTextColor: mainTextColor,
          secondaryTextColor: secondaryTextColor,
        ),
      ],
    );
  }

  Widget _buildFooter(Color secondaryTextColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '© 2025. Eun, Hwangbo. All Rights Reserved.',
        style: TextStyle(fontSize: 12, color: secondaryTextColor),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color mainTextColor;
  final Color secondaryTextColor;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.mainTextColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    // HTML의 다크 모드 디자인 색상을 고정적으로 사용
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
              color: const Color.fromARGB(13, 0, 0, 0), // withOpacity(0.05)와 동일
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: primaryColor, size: 32),
            // 불필요한 Column과 Flexible을 제거하고 텍스트를 바로 배치합니다.
            // Text 위젯은 기본적으로 공간이 부족하면 자동 줄바꿈됩니다.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ).copyWith(color: mainTextColor),
                ),
                const SizedBox(height: 4),
                // 공간이 부족할 때 글자 크기를 자동으로 조절하여 잘림 방지
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: secondaryTextColor),
                    maxLines: 1, // 한 줄로 표시되도록 강제
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
