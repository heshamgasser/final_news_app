import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared/styles/app_color.dart';

class AppText {
  static TextStyle titleLarge = GoogleFonts.exo(
    fontSize: 22.sp,
    color: Colors.white,
  );

  static TextStyle titleMedium = GoogleFonts.exo(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );

  static TextStyle titleSmall = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.titleColor
  );


  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.blueColor
  );
  static TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.blueColor
  );
  static TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.greyColor
  );

}