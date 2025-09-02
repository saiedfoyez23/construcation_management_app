import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_dropdown_button.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ConcreateSettingOut extends StatefulWidget {
  const ConcreateSettingOut({super.key});

  @override
  State<ConcreateSettingOut> createState() => _ConcreateSettingOutState();
}

class _ConcreateSettingOutState extends State<ConcreateSettingOut> {
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
                              title: "Setting Out",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Line / Level / Position",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter Line / Level / Position",
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomDropdownButton(),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter comment",
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
                              title: "Concrete Finish",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Concrete Finish Type",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomDropdownButton(),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter comment",
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Chamfers,Edging etc",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomDropdownButton(),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Write Comment",
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
                        width: 161,
                        title: "Previous",
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(8),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CustomButtonWidget(
                        width: 161,
                        title: "Next",
                        fontWeight: FontWeight.w500,
                        borderRadius: BorderRadius.circular(8),
                        fontSize: 16,
                        cardColor: AppColors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
