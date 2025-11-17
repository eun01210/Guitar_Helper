import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MetronomePage extends StatefulWidget {
  const MetronomePage({super.key});

  @override
  State<MetronomePage> createState() => _MetronomePageState();
}

class _MetronomePageState extends State<MetronomePage> {
  int _bpm = 120; // 현재 bpm
  bool _isPlaying = false; // 실행중 여부
  Timer? _timer; // Timer 기능으로 특정 시간 경과마다 소리를 냄

  int _beatCount = 0; // 현재 박자
  int _beatsPerMeasure = 4; // 박자 체크
  DateTime? _lastTapTime; // 탭 템포 마지막 클릭 시간
  Timer? _tapTempoTimer; // 탭 템포 초기화 타이머

  // 오디오 플레이어를 stop 상태로 초기화
  @override
  void initState() {
    super.initState();
    // initState는 비워두거나 다른 초기화 로직을 추가할 수 있습니다.
  }

  // 메트로놈 재생/종료 설정
  void _toggleMetronome() {
    setState(() {
      _isPlaying = !_isPlaying;

      if (_isPlaying) {
        // 메트로놈이 시작, 타이머 설정
        _playBeat();
        _startTimer();
      } else {
        // 타이머 및 카운트 초기화
        _timer?.cancel();
        _beatCount = 0;
      }
    });
  }

  // 박자를 세고, 해당하는 소리를 재생
  void _playBeat() {
    // 위젯이 화면에 없을 때 setState가 호출되는 것을 방지
    if (!mounted) return;

    setState(() {
      _beatCount = (_beatCount % _beatsPerMeasure) + 1;
    });

    // 매번 새로운 플레이어를 생성하여 상태 충돌을 원천적으로 방지합니다.
    final player = AudioPlayer();
    player.setPlayerMode(PlayerMode.lowLatency);

    // 박자에 맞는 소스를 선택하여 재생합니다.
    final source = AssetSource(_beatCount == 1 ? 'metro1.wav' : 'metro2.wav');
    player.play(source);

    // 재생이 완료되면 플레이어 리소스를 자동으로 해제합니다.
    player.onPlayerComplete.listen((event) {
      player.dispose();
    });
  }

  // 타이머 설정 (간격을 bpm에 맞게) 후 박자 세기 시작
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: (60000 / _bpm).round()), (
      timer,
    ) {
      _playBeat();
    });
  }

  // bpm 변경 후 타이머 재설정
  void _onBpmChanged(double value) {
    setState(() {
      _bpm = value.round();
    });

    if (_isPlaying) {
      _timer?.cancel();
      _startTimer();
    }
  }

  // 박자 변경 함수
  void _onBeatsPerMeasureChanged(int? newValue) {
    if (newValue != null) {
      setState(() {
        // 박자 변경 후, 카운트 초기화
        _beatsPerMeasure = newValue;
        _beatCount = 0;
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
    _timer?.cancel();
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
                    _isPlaying && _beatCount > 0 ? '$_beatCount' : '',
                    style: TextStyle(
                      fontSize: beatCountFontSize,
                      fontWeight: FontWeight.bold,
                      color:
                          _beatCount == 1
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromARGB(255, 71, 71, 71),
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
