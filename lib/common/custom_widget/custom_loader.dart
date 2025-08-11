import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomLoaderButton extends StatelessWidget {
  const CustomLoaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: Get.width,
      decoration: BoxDecoration(
 color: AppColors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(child: SpinKitDualRing(color: AppColors.white, size: 30.0)),
    );
  }
}

class CustomLoader extends StatelessWidget {
  final Color color;
  const CustomLoader({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitDualRing(color: color, size: 30.0));
  }
}
