import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/appbar.dart';

class TosView extends StatelessWidget {
  final VoidCallback onBack;

  const TosView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    // setting_view.dart와 동일한 색상 테마 적용
    const Color backgroundDark = Color(0xFF101F22);
    const Color textColor = Color(0xFFE5E7EB);
    const Color appBarBgColor = Color(0xCC101F22);

    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.0);

    // 여기에 표시할 긴 텍스트를 입력합니다.
    const String termsOfServiceText = '''
Guitar Helper — Terms of Service


These Terms of Service ("Terms") govern the use of the "Guitar Helper" App ("the App").


1. Purpose

These Terms define the rights and responsibilities between the App provider and its users.


2. Service Description

The App provides the following features:
Chord forms
Scale information
Tuner
Metronome


3. User Responsibilities

Users must not engage in the following activities:
Misuse of App functionality
Reverse engineering, decompiling, or attempting to analyze the App
Any actions that violate applicable laws


4. Limitation of Liability

The App provider is not responsible for:
Malfunctions caused by the user's device environment
Errors resulting from incorrect settings or user misuse
Any damages arising from the use of the App's information (tuning, chords, scales, etc.)


5. Service Modification and Termination

The App provider may modify or discontinue the App's features without prior notice and is not liable for any resulting issues.


6. Governing Law

Any disputes related to the App will be governed by the laws of the Republic of Korea.
''';

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: CustomAppBar(
        title: 'Terms of Service',
        onBack: onBack,
        textColor: textColor,
        backgroundColor: appBarBgColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0 * scaleFactor),
        child: Text(
          termsOfServiceText,
          style: TextStyle(
            color: textColor,
            fontSize: 16 * scaleFactor,
            height: 1.5, // 줄 간격을 넓혀 가독성을 높입니다.
          ),
        ),
      ),
    );
  }
}
