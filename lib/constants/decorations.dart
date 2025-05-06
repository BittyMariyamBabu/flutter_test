import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_app/constants/colors.dart';

class AppDecorations {
  static OutlineInputBorder textfieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.textFieldBorderColor),
    borderRadius: BorderRadius.circular(14.r),
  );
  static final borderRadius14 = BorderRadius.circular(14.r);
  static List<BoxShadow> lowSpreadShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.03), // Shadow color with opacity
      // Horizontal and vertical offsets
      blurRadius: 20, // Blur radius
      spreadRadius: 5, // Spread radius
    ),
  ];

}
