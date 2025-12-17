import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/appbar.dart';

class ContactUsView extends StatelessWidget {
  final VoidCallback onBack;

  const ContactUsView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor = colorScheme.tertiary;
    final Color textColor = colorScheme.onSurface;

    final screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.0);

    const String contactUsText = '''
Contact Us — Guitar Helper

If you have any questions, feedback, or issues while using Guitar Helper, please feel free to contact us.
We will do our best to respond as soon as possible.


Email Support

For all inquiries related to the app, please reach us at:
Email: hwangboeun2002@naver.com


What You Can Contact Us About

You may contact us regarding:
Bug reports
Feature requests
General questions about the app
Issues related to the tuner, metronome, chords, or scales
Any other feedback to help improve the app


Response Time

We typically respond within a reasonable time frame, but delays may occur depending on the nature of the inquiry.
''';

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Contact Us',
        onBack: onBack,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0 * scaleFactor),
        child: Text(
          contactUsText,
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
