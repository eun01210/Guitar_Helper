import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/appbar.dart';

class MetronomeView extends StatelessWidget {
  final double bpm;
  final bool isPlaying;
  final bool isTripletActive;
  final String timeSignature;
  final ValueChanged<double> onBpmChanged;
  final VoidCallback onBpmIncrement;
  final VoidCallback onBpmDecrement;
  final VoidCallback onTogglePlay;
  final VoidCallback onTapTempo;
  final VoidCallback onToggleTriplet;
  final VoidCallback onTimeSignatureChange;
  final VoidCallback onSettingsTap;
  final VoidCallback onBack;

  const MetronomeView({
    super.key,
    required this.bpm,
    required this.isPlaying,
    required this.isTripletActive,
    required this.timeSignature,
    required this.onBpmChanged,
    required this.onBpmIncrement,
    required this.onBpmDecrement,
    required this.onTogglePlay,
    required this.onToggleTriplet,
    required this.onTapTempo,
    required this.onTimeSignatureChange,
    required this.onSettingsTap,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color primaryColor = colorScheme.primary;
    final Color bgColor = colorScheme.tertiary;
    final Color textColor = colorScheme.onSurface;
    final Color subTextColor = colorScheme.onSurfaceVariant;
    final Color buttonBgColor = colorScheme.surfaceContainer;
    final Color buttonFgColor = colorScheme.outline;
    final Color containerColor = colorScheme.secondaryContainer;

    // 화면 너비에 따른 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.0);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        title: 'Metronome',
        onBack: onBack,
        onSettings: onSettingsTap,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 48 * scaleFactor),
                    // BPM 텍스트
                    Text(
                      'BPM',
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: 16 * scaleFactor,
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor),
                    // BPM 숫자 & 증감버튼 표시
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildBpmButton(
                          Icons.remove,
                          onBpmDecrement,
                          buttonBgColor,
                          buttonFgColor,
                          scaleFactor,
                        ),
                        SizedBox(
                          width: 180 *
                              scaleFactor, // 3자리 숫자를 기준으로 너비 고정 (버튼 위치 고정)
                          child: Text(
                            bpm.round().toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 88 * scaleFactor,
                              fontWeight: FontWeight.bold,
                              height: 1,
                              letterSpacing: -4 * scaleFactor,
                            ),
                          ),
                        ),
                        _buildBpmButton(
                          Icons.add,
                          onBpmIncrement,
                          buttonBgColor,
                          buttonFgColor,
                          scaleFactor,
                        ),
                      ],
                    ),
                    SizedBox(height: 32 * scaleFactor),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0 * scaleFactor,
                      ),
                      child: Column(
                        children: [
                          // BPM 슬라이더
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 8.0 * scaleFactor,
                              trackShape: const RoundedRectSliderTrackShape(),
                              activeTrackColor: primaryColor,
                              inactiveTrackColor: colorScheme.outlineVariant,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 12.0 * scaleFactor,
                              ),
                              thumbColor: primaryColor,
                              overlayColor: const Color(0x2013C8EC),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 28.0 * scaleFactor,
                              ),
                            ),
                            child: Slider(
                              value: bpm,
                              min: 20,
                              max: 500,
                              onChanged: onBpmChanged,
                            ),
                          ),
                          SizedBox(height: 24 * scaleFactor),
                          Row(
                            children: [
                              // 박자 설정 박스
                              Expanded(
                                flex: 2,
                                child: _buildTimeSignatureButton(context,
                                    scaleFactor, containerColor, textColor),
                              ),
                              SizedBox(width: 12 * scaleFactor),
                              // 셋잇단 버튼
                              Expanded(
                                flex: 1,
                                child: _buildTripletButton(
                                  scaleFactor,
                                  isTripletActive
                                      ? primaryColor
                                      : containerColor,
                                  isTripletActive ? Colors.white : textColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24 * scaleFactor),
                          // 탭 템포 버튼
                          _buildTapTempoButton(
                              scaleFactor, containerColor, primaryColor),
                        ],
                      ),
                    ),
                    // 재생 버튼
                    SizedBox(height: 24 * scaleFactor),
                    _buildPlayButton(scaleFactor, primaryColor),
                    SizedBox(height: 8 * scaleFactor),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // BPM 증감 버튼
  Widget _buildBpmButton(
    IconData icon,
    VoidCallback onPressed,
    Color bgColor,
    Color fgColor,
    double scaleFactor,
  ) {
    return SizedBox(
      width: 48 * scaleFactor,
      height: 48 * scaleFactor,
      child: Material(
        color: bgColor,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Icon(icon, size: 28 * scaleFactor, color: fgColor),
        ),
      ),
    );
  }

  // 박자 설정 박스
  Widget _buildTimeSignatureButton(BuildContext context, double scaleFactor,
      Color bgColor, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12 * scaleFactor),
        boxShadow: [
          BoxShadow(
            color: const Color(0x33000000),
            blurRadius: 8 * scaleFactor,
            offset: Offset(0, 4 * scaleFactor),
          ),
        ],
      ),
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(12 * scaleFactor),
        child: InkWell(
          onTap: onTimeSignatureChange,
          borderRadius: BorderRadius.circular(12 * scaleFactor),
          child: Container(
            width: 360 * scaleFactor,
            padding: EdgeInsets.symmetric(
              horizontal: 24 * scaleFactor,
              vertical: 16 * scaleFactor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeSignature,
                  style: TextStyle(
                    fontSize: 18 * scaleFactor,
                    color: textColor,
                  ),
                ),
                Icon(Icons.expand_more, color: textColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 셋잇단 버튼
  Widget _buildTripletButton(
      double scaleFactor, Color bgColor, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12 * scaleFactor),
        boxShadow: [
          BoxShadow(
            color: const Color(0x33000000),
            blurRadius: 8 * scaleFactor,
            offset: Offset(0, 4 * scaleFactor),
          ),
        ],
      ),
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(12 * scaleFactor),
        child: InkWell(
          onTap: onToggleTriplet,
          borderRadius: BorderRadius.circular(12 * scaleFactor),
          child: Container(
            height: 54 * scaleFactor,
            padding: EdgeInsets.symmetric(
              horizontal: 24 * scaleFactor,
              vertical: 16 * scaleFactor,
            ),
            child: Center(
              child: Image.asset(
                'assets/triplet.png',
                height: 36 * scaleFactor,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 탭 템포 버튼
  Widget _buildTapTempoButton(
      double scaleFactor, Color bgColor, Color iconColor) {
    return Container(
      width: 360 * scaleFactor,
      height: 60 * scaleFactor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16 * scaleFactor),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x33000000),
            blurRadius: 8 * scaleFactor,
            offset: Offset(0, 4 * scaleFactor),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTapTempo,
          borderRadius: BorderRadius.circular(16 * scaleFactor),
          child: Center(
            child: Icon(
              Icons.touch_app,
              color: iconColor,
              size: 36 * scaleFactor,
              weight: 500,
              fill: 1,
            ),
          ),
        ),
      ),
    );
  }

  // 재생 버튼
  Widget _buildPlayButton(double scaleFactor, Color primaryColor) {
    return Container(
      width: 96 * scaleFactor,
      height: 96 * scaleFactor,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withAlpha(77),
            blurRadius: 16 * scaleFactor,
            spreadRadius: 4 * scaleFactor,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTogglePlay,
          customBorder: const CircleBorder(),
          splashColor: Colors.black.withAlpha(30),
          highlightColor: Colors.black.withAlpha(20),
          hoverColor: Colors.black.withAlpha(10),
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 56 * scaleFactor,
            fill: 1,
          ),
        ),
      ),
    );
  }
}
