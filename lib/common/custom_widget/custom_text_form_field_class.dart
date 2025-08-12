import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldClass {

  static Widget build({
    required BuildContext context,
    String? hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    Color fillColor = const Color.fromRGBO(255, 255, 255, 1),
    Color textColor = const Color.fromRGBO(117, 131, 141, 1),
    double borderRadius = 100,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsetsGeometry? contentPadding,
    void Function(String?)? onChanged,
    void Function(String?)? onSaved,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      style: GoogleFonts.albertSans(
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: fontSize.sp(context),
        color: textColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 16.hpm(context),
          vertical: 11.vpm(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        filled: true,
        fillColor: fillColor,
        hintStyle: GoogleFonts.albertSans(
          fontStyle: FontStyle.normal,
          fontWeight: fontWeight,
          fontSize: fontSize.sp(context),
          color: textColor,
        ),
      ),
    );
  }
}