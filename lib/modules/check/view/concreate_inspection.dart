import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/check/view/concreate_setting_out.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConcreateInspection extends StatefulWidget {
  const ConcreateInspection({super.key});

  @override
  State<ConcreateInspection> createState() => _ConcreateInspectionState();
}

class _ConcreateInspectionState extends State<ConcreateInspection> {
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
                Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 10),
                    CustomTextWidget(
                      title: "Concrete Pour Inspection",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(thickness: 2),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Project:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter project name",
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Pour No.:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter piur number",
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Pour Date:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          suffixIcon: Icon(Icons.calendar_month),
                          hintText: "May 10, 2025",
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspection Date & Time:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          suffixIcon: Icon(Icons.calendar_month),
                          hintText: "May 10, 2025",
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Drawing/Sketch No. & Revision:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter drawing  number",
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "GA Drawing:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter GA drawing ",
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Rebar Drgs:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: 'Enter rebar drawing ',
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Temporary Works:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: 'Enter Temporary Works ',
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
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Pour Reference:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: 'Enter pour reference',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButtonWidget(
                  onTap: () {
                    Get.to(() => ConcreateSettingOut());
                  },
                  height: 40,
                  borderRadius: BorderRadius.circular(8),
                  title: "Next",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  cardColor: AppColors.blue,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
