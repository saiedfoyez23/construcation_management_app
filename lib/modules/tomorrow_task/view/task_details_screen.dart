import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    title: "Task Details",
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 2),
              Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: "Concrete Pouring",
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Due Tomorrow, 3:00 PM",
                                color: AppColors.linerColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: "Workforce",
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.person,
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(width: 5),
                              CustomTextWidget(
                                title: "5 Workers ,4 Laborers, 2 Electrician",
                                color: AppColors.linerColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: "Equipments",
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.gari,
                                height: 14,
                                width: 14,
                              ),
                              SizedBox(width: 8),
                              CustomTextWidget(
                                title: "Excavator",
                                color: AppColors.linerColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.gari,
                                height: 14,
                                width: 14,
                              ),
                              SizedBox(width: 8),
                              CustomTextWidget(
                                title: "Concrete Mixer",
                                color: AppColors.linerColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
