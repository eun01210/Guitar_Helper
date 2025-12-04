import 'dart:js_interop';

// safari 자동 재생 정책 해결
@JS('eval')
external void _eval(String code);

void unlockWebAudio() {
  _eval(
    "if (window.metCtx && window.metCtx.state === 'suspended') { window.metCtx.resume(); }",
  );
}
