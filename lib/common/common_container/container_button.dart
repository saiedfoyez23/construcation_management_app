import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    this.color,
    this.cardColor,
    required this.title,
    required this.image,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
    this.borderRadius,
    this.border,
    this.colorImage,
  });

  final Color? cardColor;
  final Color? color;
  final Color? colorImage;
  final String title;
  final String image;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(15),
        color: cardColor ?? AppColors.gray,
        border: border,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 20, width: 20, color: colorImage),
          SizedBox(width: 5),
          CustomTextWidget(
            title: title,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize ?? 12,
            color: color ?? AppColors.white,
          ),
        ],
      ),
    );
  }
}
