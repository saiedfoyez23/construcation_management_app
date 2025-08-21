import 'dart:io';

import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';

class ImageHelperClass {


  static Widget customImageContainer({
    required BuildContext context,
    required double height,
    required double width,
    required String imagePath,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    BoxFit imageFit = BoxFit.cover,
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
            fit: imageFit,
          ),
        ),
      ),
    );
  }


  static Widget customNetworkImageContainer({
    required BuildContext context,
    required double height,
    required double width,
    required String imagePath,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    BoxFit imageFit = BoxFit.cover,
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
          child: Image.network(
            imagePath,
            height: height,
            width: width,
            fit: imageFit,
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
    BoxFit imageFit = BoxFit.cover,
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
            fit: imageFit,
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
    BoxFit imageFit = BoxFit.cover,
    required VoidCallback onPressed,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    BoxBorder? border,
    double elevation = 0, // New elevation parameter
    double pressedElevation = 2, // New pressed state elevation
    Color shadowColor = Colors.black, // New shadow color parameter
  }) {
    // Handle individual corner radii if provided
    final borderRadiusGeometry = borderRadius ?? BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );

    return Container(
      height: height.h(context),
      width: width.w(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadiusGeometry,
        border: border,
        boxShadow: elevation > 0 ? [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            blurRadius: elevation * 2,
            spreadRadius: elevation * 0.5,
            offset: Offset(0, elevation),
          ),
        ] : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(width.w(context), height.h(context)), // Ensure button fills container
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: Colors.transparent, // Make button background transparent
          elevation: 0, // Disable built-in elevation
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadiusGeometry,
          ),
        ),
        child: ClipRRect(
          borderRadius: borderRadiusGeometry,
          child: FittedBox(
            fit: fit,
            child: Image.asset(
              imagePath,
              height: height.h(context),
              width: width.w(context),
              fit: imageFit,
            ),
          ),
        ),
      ),
    );
  }



}