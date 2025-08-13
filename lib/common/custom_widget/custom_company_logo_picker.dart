import 'package:construction_management_app/common/common.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../modules/authentication/sign_up/controller/sign_up_controller.dart';

class CustomCompanyLogoPicker {

  static Widget companyLogoPickerBuild({
    required BuildContext context,
    required SignUpController signUpController,
    // Text Content
    String title = "Logo",
    String buttonText = 'Choose File',
    String fileSizeText = "PNG, JPG up to 2MB",

    // Sizing
    double width = 375,
    double dottedAreaHeight = 154,
    double uploadIconHeight = 30,
    double uploadIconWidth = 37.5,

    // Colors
    Color backgroundColor = Colors.white,
    Color borderColor = const Color.fromRGBO(209, 213, 219, 1),
    Color buttonColor = const Color.fromRGBO(37, 99, 235, 1),
    Color buttonTextColor = Colors.white,

    // Border Radius
    double containerBorderRadius = 8,
    double dottedAreaBorderRadius = 8,
    double filePreviewBorderRadius = 8,
    double buttonBorderRadius = 8,
    double fileIconBorderRadius = 4,

    // Padding
    EdgeInsetsGeometry? containerPadding,
    EdgeInsetsGeometry? filePreviewPadding,
  }) {
    return Container(
      width: width.w(context),
      padding: containerPadding ?? EdgeInsets.symmetric(
        horizontal: 11.hpm(context),
        vertical: 10.vpm(context),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(containerBorderRadius.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          TextHelperClass.headingText(
            context: context,
            text: title,
            fontSize: 16,
            textColor: AppColors.black255,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(12.h(context)),

          // Dotted Border Area
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [5, 3],
              strokeWidth: 1,
              radius: Radius.circular(dottedAreaBorderRadius.r(context)),
              color: borderColor,
            ),
            child: Container(
              height: dottedAreaHeight.h(context),
              width: width.w(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dottedAreaBorderRadius.r(context)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageHelperClass.customImageContainer(
                    context: context,
                    height: uploadIconHeight.h(context),
                    width: uploadIconWidth.w(context),
                    imagePath: AppImages.uploadImage,
                  ),

                  SpaceHelperClass.v(16.h(context)),

                  // Upload Button
                  CustomButtonHelper.customRoundedButton(
                    context: context,
                    text: buttonText,
                    backgroundColor: buttonColor,
                    width: 94,
                    height: 34,
                    fontSize: 14,
                    borderRadius: buttonBorderRadius,
                    textColor: buttonTextColor,
                    fontWeight: FontWeight.w400,
                    onPressed: () async {
                      await signUpController.pickFile();
                    },
                  ),

                  SpaceHelperClass.v(8.h(context)),

                  // File size info
                  TextHelperClass.headingText(
                    alignment: Alignment.center,
                    context: context,
                    text: fileSizeText,
                    fontSize: 16,
                    textColor: const Color.fromRGBO(107, 114, 128, 1),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          SpaceHelperClass.v(12.h(context)),

          // Selected File Preview
          if (signUpController.selectedFile.value.path != "")
            _buildFilePreview(
              context,
              signUpController,
              filePreviewBorderRadius,
              fileIconBorderRadius,
              filePreviewPadding,
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }

  static Widget _buildFilePreview(BuildContext context, SignUpController signUpController, double containerRadius, double iconRadius, EdgeInsetsGeometry? padding,) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(
        horizontal: 16.hpm(context),
        vertical: 8.vpm(context),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(containerRadius.r(context)),
      ),
      child: Row(
        children: [

          ImageHelperClass.customFileImageContainer(
            context: context,
            height: 36.h(context),
            width: 40.w(context),
            imagePath: signUpController.selectedFile.value,
            borderRadius: BorderRadius.circular(iconRadius.r(context)),
          ),

          SpaceHelperClass.h(8.h(context)),

          Expanded(
            child: TextHelperClass.headingText(
              alignment: Alignment.centerLeft,
              context: context,
              text: signUpController.selectedFile.value.path.split('/').last,
              fontSize: 15,
              textColor: const Color.fromRGBO(75, 85, 99, 1),
              fontWeight: FontWeight.w400,
            ),
          ),

          IconButton(
            onPressed: () async {
              await signUpController.removeFile();
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}