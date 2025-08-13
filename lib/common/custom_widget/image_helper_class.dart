import 'dart:io';

import 'package:flutter/material.dart';

class ImageHelperClass {


  static Widget customImageContainer({
    required BuildContext context,
    required double height,
    required double width,
    required String imagePath,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    BorderRadiusGeometry? borderRadius,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    BoxBorder? border,
  }) {
    // Handle individual corner radii if provided
    final borderRadiusGeometry = borderRadius ?? BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadiusGeometry,
        border: border,
      ),
      child: ClipRRect(
        borderRadius: borderRadiusGeometry,
        child: FittedBox(
          fit: fit,
          child: Image.asset(
            imagePath,
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  static Widget customFileImageContainer({
    required BuildContext context,
    required double height,
    required double width,
    required File imagePath,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    BorderRadiusGeometry? borderRadius,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    BoxBorder? border,
  }) {
    // Handle individual corner radii if provided
    final borderRadiusGeometry = borderRadius ?? BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadiusGeometry,
        border: border,
      ),
      child: ClipRRect(
        borderRadius: borderRadiusGeometry,
        child: FittedBox(
          fit: fit,
          child: Image.file(
            imagePath,
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  static Widget customImageButtonContainer({
    required BuildContext context,
    required double height,
    required double width,
    required String imagePath,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    BorderRadiusGeometry? borderRadius,
    required VoidCallback onPressed,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    BoxBorder? border,
  }) {
    // Handle individual corner radii if provided
    final borderRadiusGeometry = borderRadius ?? BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadiusGeometry,
        border: border,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: ClipRRect(
          borderRadius: borderRadiusGeometry,
          child: FittedBox(
            fit: fit,
            child: Image.asset(
              imagePath,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }



}