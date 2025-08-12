import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownHelperClass {


  static Widget customDropdown({
    required BuildContext context,
    required List<String> items,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
    String hintText = 'Select your role',
    double width = 329,
    double height = 60,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    Color backgroundColor = Colors.white,
    Color textColor = const Color.fromRGBO(117, 131, 141, 1),
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    double borderRadius = 100,
    double iconSize = 24,
    EdgeInsetsGeometry? padding,
    bool isExpanded = true,
  }) {
    return Container(
      width: width.w(context),
      height: height.h(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        color: backgroundColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue == "" ? null : selectedValue,
          hint: Text(
            hintText,
            style: GoogleFonts.albertSans(
              fontStyle: FontStyle.normal,
              fontWeight: fontWeight,
              fontSize: fontSize.sp(context),
              color: textColor,
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(left: 8.w(context)),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: iconSize.r(context),
              color: textColor,
            ),
          ),
          padding: padding ?? EdgeInsets.only(
            right: 16.w(context),
            top: 11.h(context),
            bottom: 11.h(context),
            left: 16.w(context),
          ),
          isExpanded: isExpanded,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.albertSans(
                  fontStyle: FontStyle.normal,
                  fontWeight: fontWeight,
                  fontSize: fontSize.sp(context),
                  color: textColor,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}