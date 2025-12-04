import 'dart:js_interop';

// JavaScript의 eval 함수를 Dart에서 호출할 수 있도록 선언합니다.
@JS('eval')
external void _eval(String code);

void unlockWebAudio() {
  // Safari의 오디오 자동 재생 정책을 해결합니다.
  _eval(
    "if (window.metCtx && window.metCtx.state === 'suspended') { window.metCtx.resume(); }",
  );
}
