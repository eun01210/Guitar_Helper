import 'package:flutter/material.dart';

// 화면 비율에 맞춰 크기가 조절되는 AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onSettings;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onSettings,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // 화면 너비를 기준으로 스케일 팩터 계산
    final screenWidth = MediaQuery.sizeOf(context).width;
    // 기준 너비(e.g., 360)를 기반으로 스케일 팩터 계산하고, 최소/최대 크기 제한
    final double scaleFactor = (screenWidth / 360.0).clamp(0.8, 2.5);
    final double dynamicHeight = kToolbarHeight * scaleFactor;

    final effectiveTextColor = Theme.of(context).colorScheme.onSurface;
    final effectiveBackgroundColor = backgroundColor ?? Colors.transparent;

    return PreferredSize(
      preferredSize: Size.fromHeight(dynamicHeight),
      child: Container(
        height: dynamicHeight,
        padding: EdgeInsets.symmetric(horizontal: 10 * scaleFactor),
        color: effectiveBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Leading 위젯 (뒤로가기 버튼 또는 빈 공간)
            SizedBox(
              width: 22 * scaleFactor, // AppBar의 기본 아이콘 영역 크기
              child: onBack != null
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 22 * scaleFactor,
                        color: effectiveTextColor,
                      ),
                      onPressed: onBack,
                    )
                  : null,
            ),
            // Title
            Text(
              title,
              style: TextStyle(
                color: effectiveTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 22 * scaleFactor,
              ),
            ),
            // Actions 위젯 (설정 버튼 또는 빈 공간)
            Padding(
              padding: EdgeInsets.only(right: 10 * scaleFactor),
              child: SizedBox(
                width: 22 * scaleFactor, // AppBar의 기본 아이콘 영역 크기
                child: onSettings != null
                    ? IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 22 * scaleFactor,
                          color: effectiveTextColor,
                        ),
                        onPressed: onSettings,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight * 1.5);
  }
}
