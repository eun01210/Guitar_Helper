import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/appbar.dart';

class PrivacyPolicyView extends StatelessWidget {
  final VoidCallback onBack;

  const PrivacyPolicyView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor = colorScheme.tertiary;
    final Color textColor = colorScheme.onSurface;

    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.0);

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
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        onBack: onBack,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0 * scaleFactor),
        child: Text(
          privacyPolicyText,
          style: TextStyle(
            color: textColor,
            fontSize: 16 * scaleFactor,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
