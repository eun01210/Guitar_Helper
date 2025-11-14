import 'package:flutter/material.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:my_app/util/tunecheck.dart';
import 'package:record/record.dart';
import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

class TunerPage extends StatefulWidget {
  const TunerPage({super.key});

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> {
  // 오디오 녹음 및 음정 감지에 사용할 설정값
  static const _sampleRate = 44100;

  final _audioRecorder = AudioRecorder(); // 음성 녹음 인스턴스
  final _pitchDetector = PitchDetector(); // 음정 감지 인스턴스
  final _tuningUtil = TuningUtil(); // 튜닝 계산 유틸 인스턴스
  // 특정 스트림을 구독하는 객체 (<>타입의 이벤트를 비동기적으로 수신, 처리)
  StreamSubscription<Uint8List>? _recordSub;

  // 오디오 데이터를 모으기 위한 버퍼, 작은 음성 데이터를 모아서 한 번에 처리하기 위함
  final List<int> _audioBuffer = [];
  // 음정 분석에 필요한 샘플 수 4096, 샘플의 크기 2 -> 4096*2
  static const _requiredBufferSize = 8192;

  String _note = ''; // 감지된 음 이름
  String _status = 'Please make a sound'; // 상태 메시지
  double _pitch = 0.0; // 감지된 주파수
  double _diff = 0.0; // 주파수 차이

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  Future<void> _startListening() async {
    // 마이크 권한 확인
    if (!await _audioRecorder.hasPermission()) {
      setState(() {
        _status = 'Microphone permission denied';
      });
      return;
    }

    // 녹음 기본 설정
    const config = RecordConfig(
      encoder: AudioEncoder.pcm16bits,
      sampleRate: _sampleRate,
      numChannels: 1,
    );

    // 스트림 시작
    final stream = await _audioRecorder.startStream(config);

    // 데이터 수신 및 처리
    _recordSub = stream.listen(
      (data) async {
        // 들어오는 데이터를 버퍼에 추가
        _audioBuffer.addAll(data);

        // 버퍼에 분석에 필요한 만큼 데이터가 쌓였는지 확인
        while (_audioBuffer.length >= _requiredBufferSize) {
          // 필요한 만큼만 잘라서 분석에 사용
          final bufferToProcess = _audioBuffer.sublist(0, _requiredBufferSize);
          // 사용한 부분은 버퍼에서 제거
          _audioBuffer.removeRange(0, _requiredBufferSize);

          final result = await _pitchDetector.getPitchFromIntBuffer(
            Uint8List.fromList(bufferToProcess),
          );

          // mounted는 위젯의 표시 여부, 비동기 작업 시 위험하므로 안전장치
          if (mounted && result.pitched) {
            setState(() {
              _pitch = result.pitch;
              _updateTuningStatus();
            });
          }
        }
      },
      onError: (err) {
        // 스트림 에러 처리
        if (mounted) {
          setState(() {
            _status = 'Error listening to audio stream';
          });
        }
      },
    );
  }

  void _updateTuningStatus() {
    if (_pitch == 0.0) {
      _note = '';
      _status = 'Please make a sound';
      _diff = 0.0;
      return;
    }

    // TuningUtil을 사용하여 튜닝 상태 계산
    final result = _tuningUtil.getTuningStatus(_pitch);
    _note = result.note;
    _status = result.status;
    _diff = result.diff;
  }

  @override
  void dispose() {
    _recordSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tuner',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _note,
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(_status, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 20,
              color: Colors.grey[300],
              child: Align(
                alignment: Alignment(math.max(-1, math.min(1, _diff / 10)), 0),
                child: Container(
                  width: 4,
                  height: 20,
                  color: _status == 'In Tune' ? Colors.green : Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Pitch: ${_pitch.toStringAsFixed(2)} Hz',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
