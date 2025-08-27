import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class CustomTextFormFieldClass {

  static Widget build({
    required BuildContext context,
    String? hintText,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool readOnly = false,
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
    void Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      style: GoogleFonts.albertSans(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
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


  static Widget textFiledWithMaxLineBuild({
    required BuildContext context,
    String? hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool readOnly = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    Color fillColor = const Color.fromRGBO(255, 255, 255, 1),
    Color textColor = const Color.fromRGBO(117, 131, 141, 1),
    double borderRadius = 100,
    double fontSize = 16,
    int? maxLines = 1,
    int? minLines,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsetsGeometry? contentPadding,
    void Function(String?)? onChanged,
    void Function(String?)? onSaved,
    void Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      onSaved: onSaved,
      onTap: onTap,
      style: GoogleFonts.albertSans(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
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



  static Widget buildIntlPhoneField({
    required BuildContext context,
    String? hintText,
    String? labelText,
    TextEditingController? controller,
    bool disableLengthCheck = true,
    String initialCountryCode = 'IN',
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    Color fillColor = const Color(0xFFFFFFFF),
    Color textColor = const Color.fromRGBO(117, 131, 141, 1),
    double borderRadius = 100,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsetsGeometry? contentPadding,
    void Function(PhoneNumber)? onChanged,
  }) {
    return SizedBox(
      width: 375.w(context),
      child: IntlPhoneField(
        controller: controller,
        disableLengthCheck: disableLengthCheck,
        initialCountryCode: initialCountryCode,
        onChanged: onChanged,
        style: GoogleFonts.albertSans(
          fontStyle: FontStyle.normal,
          fontWeight: fontWeight,
          fontSize: fontSize.sp(context),
          color: textColor,
        ),
        maxLength: 15,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ?? EdgeInsets.symmetric(
            horizontal: 16.w(context),
            vertical: 11.h(context),
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
      ),
    );
  }



  static Widget otpInputFiledBuild({
    required BuildContext context,
    required ValueChanged<String> onCompleted,
    required TextEditingController pinController,
    int length = 6,
    bool showCursor = true,
    bool obscureText = false,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,

    // Sizing
    double width = 48,
    double height = 60,

    // Text Style
    double fontSize = 24,
    Color textColor = const Color.fromRGBO(6, 55, 73, 1),
    FontWeight fontWeight = FontWeight.w500,

    // Box Decoration
    Color backgroundColor = const Color(0xFFF5F6F7),
    double borderRadius = 8,

    // Focused State
    Color focusedBorderColor = const Color.fromRGBO(2, 127, 238, 1),
    double focusedBorderWidth = 1,

    // Submitted State
    Color submittedBorderColor = const Color.fromRGBO(234, 236, 240, 1),
  }) {
    final defaultPinTheme = PinTheme(
      width: width.w(context),
      height: height.h(context),
      textStyle: TextStyle(
        fontSize: fontSize.sp(context),
        color: textColor,
        fontWeight: fontWeight,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(
          color: focusedBorderColor,
          width: focusedBorderWidth,
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(color: submittedBorderColor),
      ),
    );

    return Pinput(
      controller: pinController,
      length: length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: showCursor,
      obscureText: obscureText,
      onCompleted: onCompleted,
      mainAxisAlignment: mainAxisAlignment,
    );
  }


}