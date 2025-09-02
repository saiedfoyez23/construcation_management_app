import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_drop_down.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/company_user/check_list/view/specification_check.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuctingReportScreen extends StatefulWidget {
  const DuctingReportScreen({super.key});

  @override
  State<DuctingReportScreen> createState() => _DuctingReportScreenState();
}

class _DuctingReportScreenState extends State<DuctingReportScreen> {
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
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 10),
                    CustomTextWidget(
                      title: "Drainage/Ducting Report",
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),
                Row(
                  children: [
                    CustomTextWidget(
                      title: " General Information Section",
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Contract:",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter contract number",
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
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Data:",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "May 10, 2025",
                          suffixIcon: Icon(Icons.calendar_month),
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
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Drawing Reference  Incl Revision:",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter drawing  reference",
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
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Location of work:",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter work  location",
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
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Completion Status:",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Select status', 'Select'],
                          hintText: 'Select status',
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
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Sub-Contractor:",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter work  location",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButtonWidget(
                  onTap: () {
                    Get.to(() => SpecificationCheck());
                  },
                  title: "Next",
                  cardColor: AppColors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
