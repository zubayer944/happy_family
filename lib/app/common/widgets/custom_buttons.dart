import 'package:flutter/material.dart';
import 'package:happy_family/app/common/values/my_colors.dart';
import '../values/style_text.dart';

class CustomButtons {
  static Widget regular({
    Function()? onPressed,
    String? text,
    Widget? child,
    double? border,
    Color? borderColor,
    Color? txtColor,
    Color? background,
    EdgeInsets? margin,
    double horizontalMargin = 0,
    double verticalMargin = 0,
    double? borderRadius,
    TextStyle? textStyle,
    ButtonStyle ? style,
  }) {
    return Container(
      height: 50,
      margin: margin ??  EdgeInsets.symmetric(horizontal: horizontalMargin,vertical:verticalMargin),
      child: ElevatedButton(
        style: style ?? ElevatedButton.styleFrom(
          backgroundColor: background ?? MyColors.blueColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Center(
              child: Text(
                (text ?? "Button Text Here").toUpperCase(),
                textAlign: TextAlign.center,
                style: textStyle ?? StyleText.nunitoSans_700_15.copyWith(
                  color: txtColor ?? Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
      ),
    );
  }
}