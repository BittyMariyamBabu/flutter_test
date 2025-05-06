import 'package:flutter/material.dart';
// import 'package:zalt_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_app/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:zalt_app/constants/styles.dart';

void showGradientToast({
  required String msg,
  // required Gradient? gradient,
  Gradient? gradient,
}) {
  FToast fToast = FToast();
  fToast.init(Get.overlayContext!);

  Widget toast = Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Text(
      msg,
      // style: TextStyles.t17,
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

void successToast({required String msg, Color? backgroundColor}) {
  // _showGradientToast(msg: msg,
  // // gradient: gradientColor
  // );
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: backgroundColor ?? AppColors.primaryColor,
  );
}

void errorToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: AppColors.red1,
  );
}
