import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart';
import 'package:my_app/widgets/fretboard.dart'; // NoteData를 위해 추가

class Fret extends StatelessWidget {
  final int fretNumber;
  final List<NoteData?> notes;

  const Fret({super.key, required this.fretNumber, required this.notes});
  static const List<int> _backgroundDotFrets = [
    3,
    5,
    7,
    9,
    12,
    15,
    17,
    19,
    21,
    24,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Stack(
        children: [
          // 프렛의 세로 선
          Container(
            width: 50,
            color: Colors.black,
            margin: const EdgeInsets.only(right: 2),
          ),
          if (_backgroundDotFrets.contains(fretNumber))
            Center(
              child:
                  fretNumber % 12 == 0
                      ? // 12번 프렛일 때
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NoteDot(
                            noteData: NoteData(text: '', color: Colors.white),
                          ),
                          NoteDot(
                            noteData: NoteData(text: '', color: Colors.white),
                          ),
                        ],
                      )
                      : // 12번이 아닌 다른 프렛일 때
                      const NoteDot(
                        noteData: NoteData(text: '', color: Colors.white),
                      ),
            ),

          // 현을 나타내는 가로 선
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(6, (index) {
              return Container(height: 2, color: Colors.grey[400]);
            }),
          ),
          // 프렛 번호와 점들을 표시
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  '$fretNumber',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
                          return Column(
                            children: [
                              NoteDot(noteData: note),
                              const SizedBox(height: 10), // 노트 아래에 고정 간격 추가
                            ],
                          );
                        }
                        // 노트가 없는 현에 투명한 점 추가
                        return Column(
                          children: [
                            NoteDot(
                              noteData: NoteData(
                                text: '',
                                color: Colors.transparent,
                              ),
                            ),
                            const SizedBox(height: 10), // 노트 아래에 고정 간격 추가
                          ],
                        );
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
