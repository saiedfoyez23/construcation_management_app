import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/day_work/controller/new_day_work_controller.dart';
import 'package:flutter/material.dart';

class NewDayWorkImageAndLocationWidget {

  Widget newDayWorkImageAndLocationBuilder({
    required BuildContext context,
    required NewDayWorkController controller,
  }) {
    return Container(
      width: 375.w(context),
      padding: EdgeInsets.symmetric(
        vertical: 16.vpm(context),
        horizontal: 16.hpm(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r(context)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(4, 6, 15, 0.05),
            blurRadius: 60,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          _buildSectionTitle(
            context: context,
            title: "Site Capture",
          ),

          SpaceHelperClass.v(12.h(context)),

          // Image Capture Button
          _buildImageCaptureButton(
            context: context,
            controller: controller,
          ),

          SpaceHelperClass.v(12.h(context)),

          // Selected Image Preview
          if (controller.selectedImage.value.path.isNotEmpty)
            _buildSelectedImagePreview(context: context, controller: controller),

          SpaceHelperClass.v(12.h(context)),

          // Location Section
          _buildLocationSection(context: context, controller: controller),

          SpaceHelperClass.v(15.h(context)),

          // Recapture Button
          _buildRecaptureButton(context: context, controller: controller),
        ],
      ),
    );
  }

// Helper Widget for Section Title
  Widget _buildSectionTitle({
    required BuildContext context,
    required String title
  }) {
    return TextHelperClass.headingText(
      context: context,
      text: title,
      fontSize: 20,
      textColor: Color.fromRGBO(31, 41, 55, 1),
      fontWeight: FontWeight.w700,
    );
  }

// Helper Widget for Image Capture Button
  Widget _buildImageCaptureButton({
    required BuildContext context,
    required NewDayWorkController controller,
  }) {
    return Container(
      width: 375.w(context),
      height: 160.h(context),
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(10.r(context)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF04060F).withOpacity(0.03),
            blurRadius: 60,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () => controller.showImageSourceDialog(context: context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageHelperClass.customImageContainer(
              context: context,
              height: 101.h(context),
              width: 101.w(context),
              imagePath: AppImages.imageIcon,
              imageFit: BoxFit.contain,
              fit: BoxFit.cover,
            ),
            TextHelperClass.headingText(
              alignment: Alignment.center,
              textAlign: TextAlign.center,
              context: context,
              text: "Capture Photo",
              fontSize: 16,
              textColor: Color.fromRGBO(107, 114, 128, 1),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

// Helper Widget for Selected Image Preview
  Widget _buildSelectedImagePreview({
    required BuildContext context,
    required NewDayWorkController controller,
  }) {
    return ImageHelperClass.customFileImageContainer(
      context: context,
      height: 192.h(context),
      width: 374.w(context),
      imagePath: controller.selectedImage.value,
      imageFit: BoxFit.contain,
      fit: BoxFit.cover,
    );
  }

// Helper Widget for Location Section
  Widget _buildLocationSection({
    required BuildContext context,
    required NewDayWorkController controller,
  }) {
    return Container(
      width: 375.w(context),
      padding: EdgeInsets.symmetric(
        vertical: 8.vpm(context),
        horizontal: 16.hpm(context),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.r(context)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageHelperClass.customImageContainer(
            context: context,
            height: 24.h(context),
            width: 24.w(context),
            imagePath: AppImages.locationIcon,
            imageFit: BoxFit.contain,
            fit: BoxFit.cover,
          ),
          SpaceHelperClass.h(8.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHelperClass.headingText(
                  context: context,
                  text: "Location",
                  fontSize: 16,
                  textColor: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                ),
                SpaceHelperClass.v(8.h(context)),
                CustomTextFormFieldClass.build(
                  context: context,
                  controller: controller.locationController.value,
                  hintText: "Enter Location",
                  borderColor: Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.vpm(context),
                  ),
                  borderRadius: 8,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Helper Widget for Recapture Button
  Widget _buildRecaptureButton({
    required BuildContext context,
    required NewDayWorkController controller,
  }) {
    return CustomButtonHelper.customRoundedButton(
      context: context,
      text: "Recapture Photo",
      fontSize: 16,
      textColor: Color.fromRGBO(255, 255, 255, 1),
      fontWeight: FontWeight.w600,
      borderRadius: 8,
      backgroundColor: Color.fromRGBO(24, 147, 248, 1),
      onPressed: () {
        controller.showImageSourceDialog(context: context);
      },
    );
  }


}