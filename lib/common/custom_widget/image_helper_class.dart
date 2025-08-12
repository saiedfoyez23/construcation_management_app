import 'package:flutter/material.dart';

class ImageHelperClass {


  static Widget customImageContainer({
    required BuildContext context,
    required double height,
    required double width,
    required String imagePath,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: FittedBox(
        fit: fit,
        child: Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }



}