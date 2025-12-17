import 'package:flutter/material.dart';
import 'package:guitar_helper/widgets/note.dart'; // NoteData를 위해 추가

class Fret extends StatelessWidget {
  final int fretNumber;
  final List<NoteData?> notes;
  final bool showBarreConnections;
  final bool chord;

  const Fret({
    super.key,
    required this.fretNumber,
    required this.notes,
    this.showBarreConnections = false,
    this.chord = false,
  });

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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color fretboardColor = colorScheme.secondary;
    final Color numberColor = colorScheme.onSurfaceVariant;
    final Color dotColor = colorScheme.primaryContainer;

    return SizedBox(
      // ChordPage(chord: true)일 때 프렛 너비를 더 넓게 설정
      width: chord
          // 코드 페이지 프렛 너비 조정 (기존: 36, 54 -> 수정: 34, 52)
          ? ((fretNumber == 0) ? 34 : 52 - fretNumber * 0.9)
          : ((fretNumber == 0) ? 24 : 36 - fretNumber * 0.6),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Stack(
            children: [
              // 프렛보드 배경색
              if (fretNumber > 0) Container(color: fretboardColor),
              // 프렛의 세로 선 (너비 1px)
              Align(
                alignment: Alignment.centerRight,
                child: Container(width: 1, color: dotColor),
              ),
              // 프렛 배경 흰색 점
              if (_backgroundDotFrets.contains(fretNumber))
                Transform.translate(
                  offset: const Offset(0, 7.5),
                  child: Center(
                    child: fretNumber % 12 == 0
                        ? // 12의 배수 프렛일 때 점 2개
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              NoteDot(
                                noteData: NoteData(
                                  text: ' ',
                                  color: dotColor,
                                ),
                              ),
                              NoteDot(
                                noteData: NoteData(
                                  text: ' ',
                                  color: dotColor,
                                ),
                              ),
                            ],
                          )
                        : // 12의 배수가 아닌 프렛일 때 점 1개
                        NoteDot(
                            noteData: NoteData(
                              text: ' ',
                              color: dotColor,
                            ),
                          ),
                  ),
                ),

              // finger인 경우 바레 표시
              if (showBarreConnections) ..._buildBarreConnections(),

              // 프렛 번호와 점들을 표시
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Center(
                      // 프렛 번호
                      child: Text(
                        '$fretNumber',
                        style: TextStyle(
                          fontSize: 10,
                          color: numberColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(notes.length, (index) {
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

  /// 바레 코드 연결선 생성
  List<Widget> _buildBarreConnections() {
    final List<Widget> barreWidgets = []; // 모든 바레 위젯을 저장
    final Map<String, List<int>> fingerGroups = {}; // 손가락 번호에 해당하는 프렛들을 담는 map

    // 손가락 번호 기준으로 노트들을 그룹화하여 map에 저장
    for (int i = 0; i < notes.length; i++) {
      final note = notes[i];
      if (note != null) {
        // 손가락 번호가 '0'이 아니고, 숫자로 변환 가능한 경우만 처리
        final fingerNumber = int.tryParse(note.text);
        if (fingerNumber != null && fingerNumber > 0) {
          fingerGroups.putIfAbsent(note.text, () => []).add(i);
        }
      }
    }

    // 2개 이상의 노트를 포함하는 map에 대해 연결선을 그림
    fingerGroups.forEach((finger, stringIndices) {
      if (stringIndices.length > 1) {
        // 시작점, 끝점 파악
        stringIndices.sort();
        final int startStringIndex = stringIndices.first;
        final int endStringIndex = stringIndices.last;
        final NoteData? startNote = notes[startStringIndex];

        if (startNote != null) {
          // Column은 reversed 되므로, 줄 인덱스 변환
          // 6번줄(index 0) -> index 5
          // 1번줄(index 5) -> index 0
          final double visualTopStringIndex = (5 - endStringIndex).toDouble();
          final double visualBottomStringIndex =
              (5 - startStringIndex).toDouble();

          // 노트 점의 위치와 크기를 고려하여 바레의 top과 height를 계산
          // 각 줄의 간격은 약 25px, 노트 점의 높이는 18px
          // 15(프렛 번호) + 노트 크기 + 여백 고려
          final double topOffset =
              15 + visualTopStringIndex * 25 + (25 - 18) / 2;
          final double bottomOffset =
              visualBottomStringIndex * 25 + (25 + 18) / 2;
          final double height = bottomOffset - topOffset;

          barreWidgets.add(
            Positioned(
              top: topOffset,
              height: height,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 18, // NoteDot의 너비와 동일하게 설정
                  decoration: BoxDecoration(
                    color: colorTable[1], // 기본 노트 색상 사용
                    borderRadius: BorderRadius.circular(9), // 끝을 둥글게 처리
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ),
          );
        }
      }
    });

    return barreWidgets;
  }
}
