import 'package:flutter/material.dart';
import 'package:my_app/widgets/note.dart'; // NoteData를 위해 추가

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
      width: (fretNumber == 0) ? 24 : 36 - fretNumber * 0.6,
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Stack(
            children: [
              // 프렛보드 배경색
              if (fretNumber > 0) Container(color: Colors.black),
              // 프렛의 세로 선 (너비 1px)
              if (fretNumber > 0)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(width: 1, color: Colors.white),
                ),
              if (_backgroundDotFrets.contains(fretNumber))
                Transform.translate(
                  offset: const Offset(0, 7.5),
                  child: Center(
                    child:
                        fretNumber % 12 == 0
                            ? // 12번 프렛일 때
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NoteDot(
                                  noteData: NoteData(
                                    text: ' ',
                                    color: Colors.white,
                                  ),
                                ),
                                NoteDot(
                                  noteData: NoteData(
                                    text: ' ',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                            : // 12번이 아닌 다른 프렛일 때
                            const NoteDot(
                              noteData: NoteData(
                                text: ' ',
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),
              // 프렛 번호와 점들을 표시
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      '$fretNumber',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          List.generate(notes.length, (index) {
                            final note = notes[index];

                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                // 가로선
                                Container(height: 1, color: Colors.grey[700]),
                                // 노트 점 (줄의 중앙에 위치)
                                if (note != null)
                                  NoteDot(noteData: note)
                                else
                                  const NoteDot(
                                    noteData: NoteData(
                                      text: '',
                                      color: Colors.transparent,
                                    ),
                                  ),
                              ],
                            );
                          }).reversed.toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
