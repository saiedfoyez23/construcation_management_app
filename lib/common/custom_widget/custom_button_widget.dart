import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.color,
    this.cardColor,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
    this.borderRadius,
    this.border,
    this.onTap,
  });

  final Color? cardColor;
  final Color? color;
  final String title;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final Border? border;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(15),
          color: cardColor ?? AppColors.gray,
          border: border,
        ),
        child: Center(
          child: CustomTextWidget(
            title: title,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize ?? 12,
            color: color ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
