# Flutter-specific rules.
#
# For more details, see:
# https://docs.flutter.dev/deployment/android#enabling-r8
-keep class io.flutter.embedding.android.FlutterActivity
-keep class io.flutter.embedding.android.FlutterFragment
-keep class io.flutter.embedding.android.FlutterView
-keep class io.flutter.embedding.android.FlutterSurfaceView
-keep class io.flutter.embedding.android.FlutterTextureView
# Add any additional rules for plugins or code shrinking here.

# --- 앱의 메인 액티비티 유지 ---
# 클래스 이름과 그 안의 모든 멤버(필드, 메소드)를 유지하여 앱 시작을 보장합니다.
-keep class com.eun.guitarhelper.MainActivity { *; }

# --- 플러그인 및 라이브러리를 위한 일반 규칙 ---

# @Keep 어노테이션이 붙은 클래스는 모두 유지합니다. (많은 라이브러리가 이 방식을 사용)
-keep @androidx.annotation.Keep class * {*;}

# record, permission_handler 등 네이티브 코드를 사용하는 플러그인에서
# 클래스가 제거되는 것을 방지하기 위한 포괄적인 규칙입니다.
-keep class io.flutter.plugins.** { *; }
-keep class com.llf.record.** { *; }
-keep class com.baseflow.permissionhandler.** { *; }