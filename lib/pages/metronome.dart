import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:metronome/metronome.dart';
import 'package:guitar_helper/pages/designs/metronome_view.dart';
import 'package:guitar_helper/pages/setting.dart';
// safari 자동 재생 정책 방지를 위한 함수
import 'package:guitar_helper/util/audio_unlock_stub.dart'
    if (dart.library.html) 'package:guitar_helper/util/audio_unlock_web.dart';

class MetronomePage extends StatefulWidget {
  const MetronomePage({super.key});

  @override
  State<MetronomePage> createState() => MetronomePageState();
}

class MetronomePageState extends State<MetronomePage> {
  double _bpm = 120.0; // double -> 슬라이더와 호환
  bool _isPlaying = false; // 실행중 여부
  // int _beatCount = 0; // 현재 박자 (사용 X)

  int _tripletMultiplier = 1; // 셋잇단 변수 1 or 3
  int _beatsPerMeasure = 4; // 박자 체크
  DateTime? _lastTapTime; // 탭 템포 마지막 클릭 시간
  Timer? _tapTempoTimer; // 탭 템포 초기화 타이머
  final metronome = Metronome(); // 메트로놈 객체

  // 박자 종류를 담는 리스트
  final List<String> _timeSignatures =
      List.generate(12, (index) => (index + 1).toString());
  String get _currentTimeSignature => '$_beatsPerMeasure'; // 현재 박자를 문자로 가져오는 함수

  @override
  void initState() {
    super.initState();
    // 메트로놈 초기화
    metronome.init(
      'assets/beat.wav', // 보조 박자 사운드
      accentedPath: 'assets/accent.wav', // 주 박자 사운드
      bpm: (_bpm * _tripletMultiplier).toInt(), // 메트로놈 bpm (기본은 120)
      volume: 100, // 메트로놈 볼륨
      timeSignature:
          (_tripletMultiplier == 3) ? 3 : _beatsPerMeasure, // 메트로놈 박자
      enableTickCallback: true, // 현재 박자를 받아올 수 있음
    );
    /* 현재 박자를 사용하는 경우 주석 해제
    metronome.tickStream.listen((int tick) {
      if (mounted) {
        setState(() {
          _beatCount = tick + 1;
        });
      }
    });*/
  }

  // 메트로놈 재생/종료 설정
  void _toggleMetronome() {
    // safari 자동 재생 정책 방지
    if (kIsWeb) {
      unlockWebAudio();
    }

    if (!_isPlaying) {
      metronome.play();
    } else {
      metronome.stop();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  // bpm 변경 후 타이머 재설정
  void _onBpmChanged(double value) {
    final newBpm = value.clamp(20.0, 500.0);
    setState(() {
      _bpm = newBpm;
    });
    metronome.setBPM((newBpm * _tripletMultiplier).toInt());
  }

  // 셋잇단 관리 함수
  void _toggleTriplet() {
    setState(() {
      _tripletMultiplier = _tripletMultiplier == 1 ? 3 : 1;
    });
    // 메트로놈에 즉시 반영
    metronome.setBPM((_bpm * _tripletMultiplier).toInt());
    metronome
        .setTimeSignature((_tripletMultiplier == 3) ? 3 : _beatsPerMeasure);
  }

  // 박자 변경 위젯
  void _showTimeSignaturePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: _timeSignatures.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Center(child: Text(_timeSignatures[index])),
                onTap: () {
                  setState(() {
                    _beatsPerMeasure = int.parse(_timeSignatures[index]);
                    metronome.setTimeSignature(
                        (_tripletMultiplier == 3) ? 3 : _beatsPerMeasure);
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
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
        // BPM 범위를 20-500으로 설정
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

  // 메트로놈 및 탭 템포 타이머 사용 중지
  @override
  void dispose() {
    metronome.destroy();
    _tapTempoTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MetronomeView(
      bpm: _bpm,
      isPlaying: _isPlaying,
      isTripletActive: _tripletMultiplier == 3,
      timeSignature: _currentTimeSignature,
      onBpmChanged: _onBpmChanged,
      onBpmIncrement: () => _onBpmChanged(_bpm + 1),
      onBpmDecrement: () => _onBpmChanged(_bpm - 1),
      onTogglePlay: _toggleMetronome,
      onToggleTriplet: _toggleTriplet,
      onTapTempo: _handleTapTempo,
      onTimeSignatureChange: _showTimeSignaturePicker,
      onSettingsTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      ),
      onBack: () => Navigator.of(context).pop(),
    );
  }
}
