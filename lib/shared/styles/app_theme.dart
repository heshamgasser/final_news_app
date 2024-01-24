import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/shared/styles/app_color.dart';
import 'package:news_app/shared/styles/app_text.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,


    appBarTheme: AppBarTheme(
      color: AppColor.primaryColor,
      toolbarHeight: 100.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30.r,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: AppText.titleLarge,
      titleMedium: AppText.titleMedium,
      titleSmall: AppText.titleSmall,
      displayLarge: AppText.displayLarge,
      displayMedium: AppText.displayMedium,
      displaySmall: AppText.displaySmall,
    ),

  );
}
