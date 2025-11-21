import 'package:flutter/material.dart';
import 'package:my_app/pages/chord.dart';
import 'package:my_app/pages/scale.dart';
import 'package:my_app/pages/tuner.dart';
import 'package:my_app/pages/metronome.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const Text(
                'Guitar Helper',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChordPage(),
                          ),
                        );
                      },
                      child: const Text('Chord'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScalePage(),
                          ),
                        );
                      },
                      child: const Text('Scale'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TunerPage(),
                          ),
                        );
                      },
                      child: const Text('Tuner'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MetronomePage(),
                          ),
                        );
                      },
                      child: const Text('Metronome'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Eun, Hwangbo. All rights reserved.',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
