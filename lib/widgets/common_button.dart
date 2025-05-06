import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_app/constants/colors.dart';
import 'package:flutter_test_app/constants/decorations.dart';
import 'package:flutter_test_app/constants/styles.dart';
import 'package:get/get.dart';

class LoadingCustomButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const LoadingCustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Focus(
        autofocus: true,
        child: Container(
          padding: EdgeInsets.all(context.width * 0.03),
          decoration: BoxDecoration(
            // gradient: gradientColor,
            borderRadius: BorderRadius.circular(8),
            // color: gradientColor1.withOpacity(0.3)
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(title,
                //     style: TextStyles.buttonText
                //         .copyWith(color: white, fontSize: context.width * 0.033)),
                // kWidth(context.width * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A customizable button widget that optionally displays a loading spinner.
///
/// Ideal for use during asynchronous operations like form submissions or network requests.
///
/// Parameters:
/// - [onTap] (required): The function to execute when the button is tapped.
/// - [title] (required): The text label of the button.


class CommonButton extends StatelessWidget {
  final Function ontap;
  final String title;
  final bool isLoading;
  const CommonButton({
    super.key,
    required this.ontap,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => ontap(),
      child: Container(
        height: 40.h,
        width: context.width,
        decoration: BoxDecoration(
          boxShadow: AppDecorations.lowSpreadShadow,
          borderRadius: BorderRadius.circular(14.r),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.whiteColor,
                  color: AppColors.primaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(135, 206, 235, 1),
                  ),
                  strokeCap: StrokeCap.round,
                ),
              )
              : Text(
                title,
                style: AppStyles.buttonText
              ),
        ),
      ),
    );
  }
}
