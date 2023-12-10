import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared/styles/app_color.dart';

class AppText {
  static TextStyle titleLarge = GoogleFonts.exo(
    fontSize: 22.sp,
    color: Colors.white,
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
}