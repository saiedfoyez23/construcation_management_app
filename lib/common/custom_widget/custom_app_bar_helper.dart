import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';


class CustomAppBarHelper {

  static Widget authAppBar({
    required BuildContext context,
    required VoidCallback onBackPressed,
    double width = 375,
    double height = 58,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    double borderWidth = 1,
    EdgeInsetsGeometry? padding,
    String backButtonImage = AppImages.arrowImage,
    double backButtonSize = 34,
  }) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      primary: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.scaffoldBackGroundColor,
      toolbarHeight: height.h(context),
      flexibleSpace: Container(
        width: width.w(context),
        height: height.h(context),
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: 20.hpm(context),
          vertical: 12.vpm(context),
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        child: ImageHelperClass.customImageButtonContainer(
          onPressed: onBackPressed,
          context: context,
          height: backButtonSize,
          width: backButtonSize,
          imagePath: backButtonImage,
          imageFit: BoxFit.cover,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

}