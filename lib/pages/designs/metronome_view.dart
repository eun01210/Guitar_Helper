import 'dart:ui';

import 'package:flutter/material.dart';

class MetronomeView extends StatelessWidget {
  // Define colors from the design
  static const Color primaryColor = Color(0xFF13C8EC);
  static const Color backgroundLight = Color(0xFFF6F8F8);
  static const Color backgroundDark = Color(0xFF101F22);

  final double bpm;
  final bool isPlaying;
  final String timeSignature;
  final ValueChanged<double> onBpmChanged;
  final VoidCallback onBpmIncrement;
  final VoidCallback onBpmDecrement;
  final VoidCallback onTogglePlay;
  final VoidCallback onTapTempo;
  final VoidCallback onTimeSignatureChange;
  final VoidCallback onSettingsTap;

  const MetronomeView({
    super.key,
    required this.bpm,
    required this.isPlaying,
    required this.timeSignature,
    required this.onBpmChanged,
    required this.onBpmIncrement,
    required this.onBpmDecrement,
    required this.onTogglePlay,
    required this.onTapTempo,
    required this.onTimeSignatureChange,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    const bgColor = backgroundDark;
    const textColor = Colors.white;
    const subTextColor = Color(0xFF9CA3AF);
    const buttonBgColor = Color(0x80374151);
    const buttonFgColor = Color(0xFFD1D5DB);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    Text(
                      'BPM',
                      style: TextStyle(color: subTextColor, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildBpmButton(
                          Icons.remove,
                          onBpmDecrement,
                          buttonBgColor,
                          buttonFgColor,
                        ),
                        SizedBox(
                          width: 180, // 3자리 숫자를 기준으로 너비 고정
                          child: Text(
                            bpm.round().toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 88,
                              fontWeight: FontWeight.bold,
                              height: 1,
                              letterSpacing: -4,
                            ),
                          ),
                        ),
                        _buildBpmButton(
                          Icons.add,
                          onBpmIncrement,
                          buttonBgColor,
                          buttonFgColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 8.0,
                              trackShape: const RoundedRectSliderTrackShape(),
                              activeTrackColor: primaryColor,
                              inactiveTrackColor: const Color(0xFF4B5563),
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12.0,
                              ),
                              thumbColor: primaryColor,
                              overlayColor: const Color(0x2013C8EC),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 28.0,
                              ),
                            ),
                            child: Slider(
                              value: bpm,
                              min: 20,
                              max: 500,
                              onChanged: onBpmChanged,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildTimeSignatureButton(context),
                          const SizedBox(height: 24),
                          _buildTapTempoButton(),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    _buildPlayButton(),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ),
          _buildAppBar(context, textColor),
        ],
      ),
    );
  }

  Widget _buildBpmButton(
    IconData icon,
    VoidCallback onPressed,
    Color bgColor,
    Color fgColor,
  ) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Material(
        color: bgColor,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Icon(icon, size: 28, color: fgColor),
        ),
      ),
    );
  }

  Widget _buildTimeSignatureButton(BuildContext context) {
    return Material(
      color: const Color(0xFF27272A),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTimeSignatureChange,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timeSignature,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Icon(Icons.expand_more, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTapTempoButton() {
    return GestureDetector(
      onTap: onTapTempo,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF27272A), Color(0xFF18181B)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x33000000),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.touch_app,
              color: primaryColor,
              size: 28,
              weight: 500,
              fill: 1,
            ),
            SizedBox(height: 6),
            Text(
              '탭 템포',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.01,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x4D13C8EC),
            blurRadius: 16,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTogglePlay,
          customBorder: const CircleBorder(),
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 56,
            fill: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, Color textColor) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            color: const Color(0xCC101F22),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 4.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 24),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      '메트로놈',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, size: 28),
                      onPressed: onSettingsTap,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
