import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_app/constants/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String hintText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? fillColor;
  final bool? filled;
  final bool isBoarder;
  int? maxLines = 1;
  final bool? isMaxLine;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextStyle? style;
  final Color borderColor;
  final bool editable;
  final String displayText;
  final bool? enabled;
  final VoidCallback? onSubmitted;
  final TextStyle? hintStyle;
  final bool? readOnly;
  final bool? autoCorrect;
  final bool? enableSuggestions;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final void Function()? onEditingComplete;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;

  CustomTextField({
    super.key,
    required this.hintText,
    this.focusNode,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.fillColor,
    this.filled,
    this.isBoarder = true,
    this.onChanged,
    this.maxLines,
    this.isMaxLine = false,
    this.onTap,
    this.style,
    this.prefixIcon,
    this.autovalidateMode,
    this.keyboardType,
    this.contentPadding,
    this.borderColor = AppColors.textFieldBorderColor,
    this.editable = true,
    this.displayText = '',
    this.onSubmitted,
    this.enabled,
    this.hintStyle,
    this.readOnly = false,
    this.enableSuggestions = false,
    this.maxLength,
    this.textInputAction,
    this.borderRadius,
    this.autoCorrect = false,
    this.onEditingComplete,
    this.minLines,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      minLines: minLines,
      onEditingComplete: onEditingComplete,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textInputAction: textInputAction,
      maxLength: maxLength,
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required bool isFocused,
        required int? maxLength,
      }) {
        return null; // removes the default character counter
      },
      readOnly: readOnly ?? false,
      autocorrect: autoCorrect ?? false,
      enableSuggestions: enableSuggestions ?? false,
      enabled: enabled,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      // style: style ?? AppStyles.hintTextStyle.copyWith(color: Colors.black),
      onTap: onTap,
      maxLines: isMaxLine! ? maxLines : 1,
      onChanged: onChanged,
      onFieldSubmitted: (_) {
        onSubmitted?.call(); // Invoke the onSubmitted callback
      },
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      autofocus: false, //true, // Ensure it gains focus on build
      focusNode: focusNode,
      decoration: InputDecoration(
        // labelStyle: TextStyles.t4,
        // errorStyle: const TextStyle(color: redColor),
        // hintStyle: hintStyle ?? AppStyles.hintTextStyle,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: prefixIcon != null ? 11.w : 0,
          ),
          child: prefixIcon,
        ),
        // prefixIconColor: gradientColor1,
        // suffixIconColor: gradientColor1,
        fillColor: fillColor,
        filled: filled,
        suffixIcon: suffixIcon,
        hintText: hintText,
        // errorStyle: AppStyles.errorStyle,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 13.h),
        prefixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 20),
        suffixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 20),
        isCollapsed: true,
        isDense: true,
        border:
            isBoarder
                ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder:
            isBoarder
                ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        disabledBorder:
            isBoarder
                ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder:
            isBoarder
                ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder:
            isBoarder
                ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder:
            isBoarder
                ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
                )
                : const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
