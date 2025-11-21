import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metronome/metronome.dart';

class MetronomePage extends StatefulWidget {
  const MetronomePage({super.key});

  @override
  State<MetronomePage> createState() => _MetronomePageState();
}

class _MetronomePageState extends State<MetronomePage> {
  int _bpm = 120; // 현재 bpm
  bool _isPlaying = false; // 실행중 여부
  int _beatCount = 0; // 현재 박자

  int _beatsPerMeasure = 4; // 박자 체크
  DateTime? _lastTapTime; // 탭 템포 마지막 클릭 시간
  Timer? _tapTempoTimer; // 탭 템포 초기화 타이머
  final metronome = Metronome();

  @override
  void initState() {
    super.initState();
    // 메트로놈 초기화
    metronome.init(
      'assets/metro1.wav', // 보조 박자 사운드
      accentedPath: 'assets/metro2.wav', // 주 박자 사운드
      bpm: _bpm,
      volume: 100,
      timeSignature: _beatsPerMeasure,
      enableTickCallback: true,
      sampleRate: 44100,
    );
    metronome.tickStream.listen((int tick) {
      if (mounted) {
        setState(() {
          _beatCount = tick + 1;
        });
      }
    });
  }

  // 메트로놈 재생/종료 설정
  void _toggleMetronome() {
    setState(() {
      _isPlaying = !_isPlaying;

      if (_isPlaying) {
        // 메트로놈이 시작, 타이머 설정
        metronome.play();
      } else {
        // 타이머 및 카운트 초기화
        metronome.pause();
        _beatCount = 0;
      }
    });
  }

  // bpm 변경 후 타이머 재설정
  void _onBpmChanged(double value) {
    setState(() {
      _bpm = value.round();
    });

    metronome.setBPM(_bpm);
  }

  // 박자 변경 함수
  void _onBeatsPerMeasureChanged(int? newValue) {
    if (newValue != null) {
      setState(() {
        // 박자 변경 후, 카운트 초기화
        _beatsPerMeasure = newValue;
        metronome.setTimeSignature(_beatsPerMeasure);
      });
    }
  }

  // 탭 템포 버튼으로 bpm 설정
  void _handleTapTempo() {
    final now = DateTime.now(); // 현재 시간

    // 마지막 클릭 시간이 있는 경우 시간 차이 계산 후 bpm 설정
    if (_lastTapTime != null) {
      final interval = now.difference(_lastTapTime!).inMilliseconds;
      if (interval > 0) {
        // 밀리세컨드 단위 변환
        double newBpm = 60000 / interval;
        // 20에서 500사이로 제한
        newBpm = newBpm.clamp(20.0, 500.0);
        _onBpmChanged(newBpm);
      }
    }

    _lastTapTime = now; // 마지막 클릭 시간을 현재 시간으로 설정

    // 탭 템포를 5초이상 클릭하지 않으면 마지막 시간 초기화
    _tapTempoTimer?.cancel();
    _tapTempoTimer = Timer(const Duration(seconds: 5), () {
      // 위젯이 화면에 없을 때 setState가 호출되는 것을 방지
      if (mounted) {
        setState(() {
          _lastTapTime = null;
        });
      }
    });
  }

  // 타이머 및 오디오 플레이어 사용 중지
  @override
  void dispose() {
    metronome.destroy();
    _tapTempoTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metronome')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 화면의 높이에 비례하여 폰트 크기 및 아이콘 크기 계산
          final double beatCountFontSize = constraints.maxHeight * 0.25;
          final double iconSize = constraints.maxHeight * 0.2;

          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(flex: 2),
                  Text(
                    _isPlaying ? '$_beatCount' : '',
                    style: TextStyle(
                      fontSize: beatCountFontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Spacer(flex: 1),
                  Column(
                    children: [
                      Text(
                        '$_bpm BPM',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Slider(
                        value: _bpm.toDouble(),
                        min: 20,
                        max: 500,
                        divisions: 480, // (500 - 20)
                        label: _bpm.toString(),
                        onChanged: _onBpmChanged,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton<int>(
                          underline: const SizedBox(), // 기본 밑줄 제거
                          value: _beatsPerMeasure,
                          items: List.generate(12, (index) {
                            final value = index + 1;
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text('$value'),
                            );
                          }),
                          onChanged: _onBeatsPerMeasureChanged,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          iconSize: iconSize,
                          // 오디오가 로드되기 전에는 버튼을 비활성화합니다.
                          onPressed: _toggleMetronome,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 80, // 버튼 너비 고정
                          child: ElevatedButton(
                            onPressed: _handleTapTempo,
                            child: const Text(
                              'Tap',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
