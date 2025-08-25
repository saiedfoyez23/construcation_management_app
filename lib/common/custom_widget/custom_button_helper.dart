import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonHelper {


  static Widget customTextButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    Alignment alignment = Alignment.centerLeft,
    double height = 45,
    double? width, // Optional width parameter
    Color textColor = const Color(0xFF1F93FF),
    Color backgroundColor = Colors.transparent,
    double fontSize = 17,
    FontWeight fontWeight = FontWeight.w700,
    double borderRadius = 4,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    double elevation = 0,
  }) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: width, // Apply width if provided
        height: height.h(context),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: padding,
            minimumSize: Size(width ?? 0, height.h(context)), // Set minimum size
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: backgroundColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,
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
    Color? backgroundColor, // Make optional when using gradient
    Color textColor = const Color.fromRGBO(255, 255, 255, 1),
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 100,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool isFullWidth = false,
    Gradient? gradient,
    List<Color>? gradientColors,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    double elevation = 0,
    bool hasBorder = false, // New parameter for border
    Color borderColor = const Color.fromRGBO(38, 50, 56, 1), // New parameter for border color
    double borderWidth = 1, // New parameter for border width
  }) {

    // Handle gradient creation
    final actualGradient = gradient ?? (gradientColors != null ? LinearGradient(
      colors: gradientColors,
      begin: begin,
      end: end,
    ) : null );

    return Container(
      width: isFullWidth ? double.infinity : width.w(context),
      height: height.h(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
        gradient: actualGradient,
        border: hasBorder ? Border.all(
          color: borderColor,
          width: borderWidth.w(context),
        ) : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          minimumSize: Size(width.w(context), height.h(context)), // Set minimum size
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            side: hasBorder ? BorderSide(
              color: borderColor,
              width: borderWidth,
            ) : BorderSide.none,
          ),
          // For splash effect
          foregroundColor: textColor,
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
    required VoidCallback? onPressed,
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


  static Widget imageTextColumnButton({
    required BuildContext context,
    required String imagePath,
    required String text,
    required VoidCallback onTap,
    double? width,
    double? height,
    double? imageSize,
    double? borderRadius,
    Color? backgroundColor,
    Color? shadowColor,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    double? horizontalPadding,
    double? verticalPadding,
    double? spaceBetween,
  }) {
    return Container(
      width: width ?? 94.w(context),
      height: 102.w(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r(context)),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? const Color.fromRGBO(4, 6, 15, 0.05),
            offset: const Offset(0, 4),
            blurRadius: 60,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r(context)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 8.hpm(context),
              vertical: verticalPadding ?? 16.vpm(context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageHelperClass.customImageContainer(
                  context: context,
                  height: imageSize ?? 25.h(context),
                  width: imageSize ?? 25.w(context),
                  imagePath: imagePath,
                  imageFit: BoxFit.contain,
                  fit: BoxFit.cover,
                ),
                SpaceHelperClass.v(spaceBetween ?? 8.h(context)),
                TextHelperClass.headingText(
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  context: context,
                  text: text,
                  fontSize: fontSize ?? 15,
                  textColor: textColor ?? AppColors.black89,
                  fontWeight: fontWeight ?? FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  static Widget textWithIconButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    required IconData icon,
    Color backgroundColor = const Color.fromRGBO(24, 147, 248, 1),
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
    double iconSize = 16,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    double width = 375,
    double textContainerWidth = 375,
    double height = 50,
    double minWidth = 265,
    double minHeight = 28,
    double horizontalPadding = 8,
    double verticalPadding = 6,
    double borderRadius = 4,
  }) {
    return SizedBox(
      width: width.w(context),
      height: height.h(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding.hpm(context),
            vertical: verticalPadding.vpm(context),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(minWidth.w(context), minHeight.h(context)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: iconSize.r(context)),
            SpaceHelperClass.h(8.w(context)),
            TextHelperClass.headingText(
              width: textContainerWidth.w(context),
              context: context,
              text: text,
              fontSize: fontSize.sp(context),
              textColor: textColor,
              fontWeight: fontWeight,
            ),
          ],
        ),
      ),
    );
  }


}
