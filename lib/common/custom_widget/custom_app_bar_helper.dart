import 'package:construction_management_app/common/common.dart';
import 'package:flutter/cupertino.dart';

import '../app_images/app_images.dart';

class CustomAppBarHelper {

  static Widget authAppBar({
    required BuildContext context,
    required VoidCallback onBackPressed,
    double width = 375,
    double height = 48,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    double borderWidth = 1,
    EdgeInsetsGeometry? padding,
    String backButtonImage = AppImages.arrowImage,
    double backButtonSize = 24,
  }) {
    return SliverToBoxAdapter(
      child: Container(
        width: width.w(context),
        height: height.h(context),
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: 24.hpm(context),
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
          height: backButtonSize.h(context),
          width: backButtonSize.w(context),
          imagePath: backButtonImage,
        ),
      ),
    );
  }
}