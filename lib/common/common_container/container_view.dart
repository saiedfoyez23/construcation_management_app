import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomContainerTextView extends StatelessWidget {
  const CustomContainerTextView({
    super.key,
    this.width,
    required this.image,
    required this.text,
    this.imageColor,
    this.textColor,
    this.fontWeight,
    this.height,
    this.cardColor,
    this.fontSize, this.border, this.borderRadius,
  });

  final double? width;
  final double? height;
  final String image;
  final String text;
  final Color? imageColor;
  final Color? cardColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Border? border;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width ?? 150,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        border: border,
        color: cardColor ?? AppColors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 16,
            width: 16,
            color: imageColor ?? AppColors.white,
          ),
          SizedBox(width: 5),
          CustomTextWidget(
            title: text,
            color: textColor,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 12,
          ),
        ],
      ),
    );
  }
}
