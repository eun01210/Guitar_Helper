import 'package:flutter/material.dart';

// 화면 비율에 맞춰 크기가 조절되는 AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onSettings;
  final Color textColor;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onSettings,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    // 화면 너비를 기준으로 스케일 팩터 계산
    final screenWidth = MediaQuery.of(context).size.width;
    // 기준 너비(e.g., 360)를 기반으로 스케일 팩터 계산하고, 최소/최대 크기 제한
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.5);
    final double dynamicHeight = kToolbarHeight * scaleFactor;

    return PreferredSize(
      preferredSize: Size.fromHeight(dynamicHeight),
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        // onBack 콜백이 있으면 뒤로가기 버튼 표시
        leading:
            onBack != null
                ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 22 * scaleFactor, // 화면 비율에 맞게 크기 조절
                    color: textColor,
                  ),
                  onPressed: onBack,
                )
                : null,
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22 * scaleFactor, // 화면 비율에 맞게 크기 조절
          ),
        ),
        centerTitle: true,
        actions: [
          // onSettings 콜백이 있을 때만 설정 버튼 표시
          onSettings != null
              ? IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 22 * scaleFactor,
                  color: textColor,
                ),
                onPressed: onSettings,
              )
              : const SizedBox.shrink(), // 빈 공간을 차지하지 않는 위젯
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight * 1.5);
  }
}
