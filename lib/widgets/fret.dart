import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart';

class GuitarFretboard extends StatelessWidget {
  GuitarFretboard({super.key});

  final List<List<String?>> fretboardData = List.generate(
    6,
    (_) => List.generate(24, (_) => null),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(width: 50),
          ...List.generate(fretboardData.length, (index) {
            return Fret(fretNumber: index + 5, notes: fretboardData[index]);
          }),
        ],
      ),
    );
  }
}

class Fret extends StatelessWidget {
  final int fretNumber;
  final List<String?> notes;

  const Fret({super.key, required this.fretNumber, required this.notes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Stack(
        children: [
          Container(
            width: 50,
            color: Colors.black,
            margin: const EdgeInsets.only(right: 2),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(6, (index) {
              return Container(height: 2, color: Colors.grey[400]);
            }),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '$fretNumber',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                      List.generate(notes.length, (index) {
                        final note = notes[index];
                        if (note != null) {
                          // NoteDot에 String 값을 전달
                          return NoteDot(noteText: note);
                        }
                        return const SizedBox(height: 30);
                      }).reversed.toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
