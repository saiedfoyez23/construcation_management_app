import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CustomLoaderButton {

  Widget customLoaderButton({
    Key? key,
    required BuildContext context,
    double height = 43,
    Color backgroundColor = Colors.black,
    Color loaderColor = Colors.white,
    double loaderSize = 30.0,
    double borderRadius = 6,
  }) {
    return Container(
      key: key,
      height: height.h(context),
      width: 375.w(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: SpinKitDualRing(
          color: loaderColor,
          size: loaderSize,
        ),
      ),
    );
  }

  Widget customLoader({
    Key? key,
    required Color color,
    double size = 30.0,
  }) {
    return Center(
      key: key,
      child: SpinKitDualRing(
        color: color,
        size: size,
      ),
    );
  }

}
