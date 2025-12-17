import 'dart:js_interop';

// safari 환경에서 자동 재생 정책 해결 함수 작동
@JS('eval')
external void _eval(String code);

void unlockWebAudio() {
  _eval(
    "if (window.metCtx && window.metCtx.state === 'suspended') { window.metCtx.resume(); }",
  );
}
