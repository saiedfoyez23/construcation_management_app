import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonHelper {


  static Widget customTextButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    Alignment alignment = Alignment.centerLeft,
    double height = 24,
    Color textColor = const Color(0xFF1F93FF),
    double fontSize = 17,
    FontWeight fontWeight = FontWeight.w700,
    double borderRadius = 4,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        height: height.h(context),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.albertSans(
              fontStyle: FontStyle.normal,
              fontWeight: fontWeight,
              fontSize: fontSize.sp(context),
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }




  static Widget customRoundedButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    double width = 375,
    double height = 50,
    Color backgroundColor = const Color(0xFFDCDDDF),
    Color textColor = const Color.fromRGBO(255, 255, 255, 1),
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 100,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool isFullWidth = false,
  }) {
    return Container(
      width: isFullWidth ? double.infinity : width.w(context),
      height: height.h(context),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.albertSans(
              fontStyle: FontStyle.normal,
              fontSize: fontSize.sp(context),
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }


  static Widget customRichTextButton({
    required BuildContext context,
    required String normalText,
    required String highlightedText,
    required VoidCallback onPressed,
    Alignment alignment = Alignment.center,
    Color normalTextColor = const Color.fromRGBO(9, 44, 76, 1),
    Color highlightedTextColor = const Color.fromRGBO(68, 77, 98, 1),
    double fontSize = 17,
    FontWeight normalTextWeight = FontWeight.w400,
    FontWeight highlightedTextWeight = FontWeight.w700,
    double lineHeight = 1.5,
    EdgeInsetsGeometry? padding,
  }) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.albertSans(
              fontSize: fontSize.sp(context),
              fontWeight: normalTextWeight,
              color: normalTextColor,
              height: lineHeight,
            ),
            children: [
              TextSpan(text: normalText),
              TextSpan(
                text: highlightedText,
                style: GoogleFonts.albertSans(
                  fontSize: fontSize.sp(context),
                  fontWeight: highlightedTextWeight,
                  color: highlightedTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
