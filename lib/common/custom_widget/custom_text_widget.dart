import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.title,
    this.textAlign,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.color,
  });

  final String title;
  final TextAlign? textAlign;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 12,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
