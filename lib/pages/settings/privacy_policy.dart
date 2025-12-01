import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/appbar.dart';

class PrivacyPolicyView extends StatelessWidget {
  final VoidCallback onBack;

  const PrivacyPolicyView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    // setting_view.dart와 동일한 색상 테마 적용
    const Color backgroundDark = Color(0xFF101F22);
    const Color textColor = Color(0xFFE5E7EB);
    const Color appBarBgColor = Color(0xCC101F22);

    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.0);

    // 여기에 표시할 긴 텍스트를 입력합니다.
    const String privacyPolicyText = '''
Guitar Helper — Privacy Policy


Guitar Helper ("the App") does not collect any personal information from its users.
The App provides basic guitar practice features including chord forms, scales, a tuner, and a metronome.


1. Information We Collect

The App does not collect any personal data from users.


2. Permissions Used

● Microphone Permission
Purpose: Used solely to analyze pitch for the tuner function.
The App does not store, record, transmit, or share any audio data.


3. Sharing of Information

Since no personal data is collected, the App does not share any information with third parties.


4. Data Retention and Deletion

As the App does not store any personal information, no data is retained or deleted.


5. Advertising and Analytics

The App does not use any advertising services or analytics tools (such as AdMob, Firebase, or Google Analytics).


6. Children's Privacy

The App does not collect any personal information from children.
''';

    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        onBack: onBack,
        textColor: textColor,
        backgroundColor: appBarBgColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0 * scaleFactor),
        child: Text(
          privacyPolicyText,
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
