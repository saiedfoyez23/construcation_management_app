import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.height,
    this.borderRadius,
    this.fillColor,
    this.width,
    this.border,
    this.controller,
    this.readOnly,
  });

  final String hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final BorderSide? border;
  final Icon? prefixIcon;
  final double? height;
  final double? width;
  final Color? fillColor;
  final TextEditingController? controller;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: TextField(
        readOnly: readOnly ?? false,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 8, left: 15),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            borderSide: border ?? BorderSide(color: AppColors.lightGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            borderSide: border ?? BorderSide(color: AppColors.lightGray),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            borderSide: border ?? BorderSide(color: AppColors.lightGray),
          ),
          hintText: hintText,
          fillColor: fillColor,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
