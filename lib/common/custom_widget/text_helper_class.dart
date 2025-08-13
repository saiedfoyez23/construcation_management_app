import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHelperClass {
  /// Custom text widget with transparent container, alignment, and size controls
  static Widget headingText({
    required BuildContext context,
    required String text,
    double width = 375,
    Alignment alignment = Alignment.centerLeft,
    Color containerColor = Colors.transparent, // Default: transparent
    TextAlign textAlign = TextAlign.start, // Default: left-align text
    double fontSize = 24,
    Color textColor = const Color.fromRGBO(35, 47, 48, 1),
    FontWeight fontWeight = FontWeight.w700,
    FontStyle fontStyle = FontStyle.normal,
    TextOverflow textOverFlow = TextOverflow.visible,
  }) {
    return Container(
      width: width.w(context),
      alignment: alignment,
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: Text(
        text,
        overflow: textOverFlow,
        textAlign: textAlign, // Controls text alignment within container
        style: GoogleFonts.albertSans(
          fontSize: fontSize.sp(context),
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
      ),
    );
  }
}