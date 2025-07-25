import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final BorderRadiusGeometry? borderRadius;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.backgroundColor, required this.textColor, this.borderRadius, required this.text, this.fontSize, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(backgroundColor: backgroundColor, shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(16))),
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(color: textColor, fontWeight: FontWeight.w900, fontSize: fontSize),
          )),
    );
  }
}
