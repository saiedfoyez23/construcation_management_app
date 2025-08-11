import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_drop_down.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/check_list/view/ducting_report_signature%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecificationCheck extends StatefulWidget {
  const SpecificationCheck({super.key});

  @override
  State<SpecificationCheck> createState() => _SpecificationCheckState();
}

class _SpecificationCheckState extends State<SpecificationCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Specification Compliance Check",
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Installation Details",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Bed Type and Thickness",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', 'No'],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Pipe Type",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter Pipe type",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Positioning & Alignment",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    title: "Line",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 50,
                                    width: 160,
                                    child: CustomDropdown(
                                      items: ['Yes', 'No'],
                                      hintText: 'Yes',
                                      onChanged: (String value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    title: "Level",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 50,
                                    width: 160,
                                    child: CustomDropdown(
                                      items: ['Yes', 'No'],
                                      hintText: 'Yes',
                                      onChanged: (String value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    title: "Position",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 50,
                                    width: 160,
                                    child: CustomDropdown(
                                      items: ['Yes', 'No'],
                                      hintText: 'Yes',
                                      onChanged: (String value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    title: "Gradient",
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 50,
                                    width: 160,
                                    child: CustomDropdown(
                                      items: ['Yes', 'No'],
                                      hintText: 'Yes',
                                      onChanged: (String value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Pop up dealed off",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', 'No'],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Testing & Certification",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Test(Air/Water/CCTV/Mandrill):",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter",
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Test Certificate Reference:",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "",
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomButtonWidget(
                        onTap: () {
                          Get.back();
                        },
                        height: 40,
                        title: "Previous",
                        borderRadius: BorderRadius.circular(8),
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        cardColor: AppColors.gray,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CustomButtonWidget(
                        onTap: () {
                          Get.to(() => DuctingReportSignature());
                        },
                        height: 40,
                        borderRadius: BorderRadius.circular(8),
                        title: "Next",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        cardColor: AppColors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
