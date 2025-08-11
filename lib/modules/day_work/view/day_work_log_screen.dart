import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/day_work/view/widget/resources_view_card.dart';
import 'package:construction_management_app/common/common_container/container_button.dart';
import 'package:construction_management_app/modules/site_diary/view/widget/delay_card_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayWorksLogScreen extends StatefulWidget {
  const DayWorksLogScreen({super.key});

  @override
  State<DayWorksLogScreen> createState() => _DayWorksLogScreenState();
}

class _DayWorksLogScreenState extends State<DayWorksLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          "Day Work-01",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    title: "Day Work-01",
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  Image.asset(
                    AppImages.linedit,
                    height: 24,
                    width: 24,
                    color: AppColors.blue,
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  CustomTextWidget(
                    title: "Description",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 5),
              CustomTextWidget(
                title:
                    "Excavation of trench for pipeline along the eastern boundary.",
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomTextWidget(
                    title: "Resources Used",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 5),
              ResourcesViewCard(
                image: AppImages.person,
                titel: "5 Workers ,4 Laborers, 2 Electrician",
                text: "4 hours",
              ),
              SizedBox(height: 2),
              ResourcesViewCard(
                image: AppImages.gari,
                titel: "1 Cement Mixer",
                text: "2 hours",
              ),
              SizedBox(height: 2),
              ResourcesViewCard(
                image: AppImages.gari,
                titel: "1 Excavator",
                text: "2 hours",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomTextWidget(
                    title: "Meterials Used",
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Image.asset(AppImages.gari, height: 16, width: 16),
                  SizedBox(width: 5),
                  CustomTextWidget(
                    title: "10 cubic meters of concrete",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.linerColor,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomTextWidget(
                    title: "Attachments",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  CustomTextWidget(
                    title: "Task-related photos ",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    AppImages.attachment,
                    height: 192,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 160,
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          Icons.location_on,
                          color: AppColors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        CustomTextWidget(
                          title: "Location for work site",
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              DelayCardView(),
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
                            title: "Write Comment",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        height: 100,
                        maxLines: 4,
                        border: BorderSide(
                          color: AppColors.lightGray,
                          width: 1,
                        ),
                        fillColor: AppColors.white,
                        hintText: "Add additional comments...",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              ContainerButton(
                title: 'Export as pdf',
                fontWeight: FontWeight.w400,
                cardColor: AppColors.white,
                border: Border.all(color: AppColors.red),
                fontSize: 14,
                color: AppColors.red,
                image: AppImages.pdf,
              ),
              SizedBox(height: 15),
              ContainerButton(
                title: 'Export as Excell',
                fontWeight: FontWeight.w400,
                cardColor: AppColors.white,
                border: Border.all(color: Colors.green),
                fontSize: 14,
                color: Colors.green,
                image: AppImages.excell,
              ),
              SizedBox(height: 15),

              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
