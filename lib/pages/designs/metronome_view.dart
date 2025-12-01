import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar.dart';

class MetronomeView extends StatelessWidget {
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
  final VoidCallback onBack;

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
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    const bgColor = backgroundDark;
    const textColor = Colors.white;
    const subTextColor = Color(0xFF9CA3AF);
    const buttonBgColor = Color(0x80374151);
    const buttonFgColor = Color(0xFFD1D5DB);

    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.0);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        title: 'Metronome',
        onBack: onBack,
        onSettings: onSettingsTap,
        textColor: textColor,
        backgroundColor: Colors.transparent,
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
                          width:
                              180 *
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
                              inactiveTrackColor: const Color(0xFF4B5563),
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
                          // 박자 설정 리스트 & 탭 템포 버튼
                          SizedBox(height: 24 * scaleFactor),
                          _buildTimeSignatureButton(context, scaleFactor),
                          SizedBox(height: 24 * scaleFactor),
                          _buildTapTempoButton(scaleFactor),
                        ],
                      ),
                    ),
                    // 재생 버튼
                    SizedBox(height: 24 * scaleFactor),
                    _buildPlayButton(scaleFactor),
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

  Widget _buildTimeSignatureButton(BuildContext context, double scaleFactor) {
    return Material(
      color: const Color(0xFF27272A),
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
                  color: Colors.white,
                ),
              ),
              Icon(Icons.expand_more, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTapTempoButton(double scaleFactor) {
    return GestureDetector(
      onTap: onTapTempo,
      child: Container(
        width: 360 * scaleFactor,
        height: 60 * scaleFactor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16 * scaleFactor),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF27272A), Color(0xFF18181B)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x33000000),
              blurRadius: 8 * scaleFactor,
              offset: Offset(0, 4 * scaleFactor),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.touch_app,
            color: primaryColor,
            size: 36 * scaleFactor,
            weight: 500,
            fill: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayButton(double scaleFactor) {
    return Container(
      width: 96 * scaleFactor,
      height: 96 * scaleFactor,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x4D13C8EC),
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
