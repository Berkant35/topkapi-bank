import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/extension/context_extensions.dart';


class CustomElevatedButton extends StatelessWidget {
  final OutlinedBorder? outBorder;
  final Color? primaryColor;
  final Color? shadowColor;
  final Color? onPrimaryColor;
  final Color? borderColor;
  final Color? gradienFirstColor;
  final Color? gradienSecondColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  final TextStyle? inButtonTextStyle;
  final double? width;
  final double? borderRadius;
  final double? elevation;
  final double? height;
  final Function? onPressed;
  final Widget? inButtonWidget;
  final String? inButtonText;

  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.inButtonText,
      this.height,
      this.width,
      this.outBorder,
      this.inButtonTextStyle,
      this.elevation,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.primaryColor,
      this.onPrimaryColor,
      this.gradienFirstColor,
      this.gradienSecondColor,
      this.textStyle,
      this.inButtonWidget,
      this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 90.w,
      height: height ?? 7.5.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          elevation: elevation ?? 0,
          shape: outBorder,
          shadowColor: shadowColor,
        ),
        onPressed: onPressed as void Function()?,
        child: inButtonWidget ??
            Text(
              inButtonText!,
              style: inButtonTextStyle ?? ThemeValueExtension.subtitle,
            ),
      ),
    );
  }
}
