import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  var horizontalPadding = 25.w;
  var verticalPadding = 25.w;
  var disscussionPaddingHorizontal = 15.w;
  var homeScreenhorizontalAllPadding = 20.w;
  EdgeInsetsGeometry symmetricAllPadding() => EdgeInsets.symmetric(
    horizontal: horizontalPadding,
    vertical: verticalPadding,
  );

  EdgeInsetsGeometry symmetricHorizontalPadding() =>
      EdgeInsets.symmetric(horizontal: horizontalPadding);

  EdgeInsetsGeometry symmetricVerticalPadding() =>
      EdgeInsets.symmetric(vertical: verticalPadding);

  var horizontalDraftPadding = 18.w;
  var verticalDraftPadding = 5.h;
  EdgeInsetsGeometry symmetricDraftPadding() => EdgeInsets.symmetric(
    horizontal: horizontalDraftPadding,
    vertical: verticalDraftPadding,
  );

  EdgeInsetsGeometry homeScreenSymmetricHorizontalPadding() =>
      EdgeInsets.symmetric(horizontal: homeScreenhorizontalAllPadding);
}
