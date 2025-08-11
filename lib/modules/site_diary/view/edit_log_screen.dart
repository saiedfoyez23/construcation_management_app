import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_drop_down.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/common/common_container/up_container_view_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLogScreen extends StatefulWidget {
  const EditLogScreen({super.key});

  @override
  State<EditLogScreen> createState() => _EditLogScreenState();
}

class _EditLogScreenState extends State<EditLogScreen> {
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
                      title: "Edit Log",
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Card(
                  color: AppColors.white,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Daily Log",
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Supervisors Name ",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Jane Cooper",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                title: "Description",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              Image.asset(
                                AppImages.linedit,
                                color: AppColors.blue,
                                height: 18,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            height: 50,
                            maxLines: 4,
                            fillColor: AppColors.white,
                            hintText: "Write Description",
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Data",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            fillColor: AppColors.white,
                            hintText: "May 10, 2025",
                            suffixIcon: Icon(Icons.calendar_month),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Weather condition",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            fillColor: AppColors.white,
                            hintText: "Sunny",
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                title: "Add Task",
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              CustomContainerTextView(
                                height: 30,
                                width: 110,
                                border: Border.all(
                                  color: AppColors.blue,
                                  width: 2,
                                ),
                                image: AppImages.add,
                                text: "Add task",
                                textColor: AppColors.blue,
                                imageColor: AppColors.blue,
                                cardColor: AppColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Task Name",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: "Enter task Name",
                            fillColor: AppColors.white,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Workforce",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
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
                                      title: "Worker",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 48,
                                      width: 160,
                                      child: CustomDropdown(
                                        items: ['Laborers', 'Excavator'],
                                        hintText: 'Laborers',
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
                                      title: "Quantity",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 48,
                                      width: 160,
                                      child: CustomTextField(
                                        fillColor: AppColors.white,
                                        hintText: "1",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Duration",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            fillColor: AppColors.white,
                            hintText: "4 hours",
                          ),
                          SizedBox(height: 15),
                          Row(children: [UpContainerViewCard(text: "Remove")]),
                          SizedBox(height: 15),
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
                                      title: "Worker",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 48,
                                      width: 160,
                                      child: CustomDropdown(
                                        items: ['Laborers', 'Excavator'],
                                        hintText: 'Laborers',
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
                                      title: "Quantity",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 48,
                                      width: 160,
                                      child: CustomTextField(
                                        fillColor: AppColors.white,
                                        hintText: "1",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Duration",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            fillColor: AppColors.white,
                            hintText: "4 hours",
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              UpContainerViewCard(
                                icon: Icon(Icons.add, color: AppColors.blue),
                                border: Border.all(color: AppColors.blue),
                                text: "Add Worker",
                                color: AppColors.blue,
                              ),
                              SizedBox(width: 15),

                              UpContainerViewCard(text: "Remove"),
                            ],
                          ),
                          SizedBox(height: 35),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Equipment",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
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
                                      title: "Select",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 48,
                                      width: 160,
                                      child: CustomDropdown(
                                        items: ['Laborers', 'Excavator'],
                                        hintText: 'Excavator',
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
                                      title: "Quantity",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 48,
                                      width: 173,
                                      child: CustomTextField(
                                        fillColor: AppColors.white,
                                        hintText: "1",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Duration",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            fillColor: AppColors.white,
                            hintText: "4 hours",
                          ),
                          SizedBox(height: 15),
                          Row(children: [UpContainerViewCard(text: "Remove")]),
                          SizedBox(height: 15),
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
                                      title: "Select",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 48,
                                      width: 160,
                                      child: CustomDropdown(
                                        items: ['Laborers', 'Excavator'],
                                        hintText: 'Excavator',
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
                                      title: "Quantity",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    SizedBox(height: 10),
                                    CustomTextField(
                                      width: 173,
                                      fillColor: AppColors.white,
                                      hintText: "1",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Duration",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            fillColor: AppColors.white,
                            hintText: "4 hours",
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              UpContainerViewCard(
                                icon: Icon(Icons.add, color: AppColors.blue),
                                border: Border.all(color: AppColors.blue),
                                text: "Add Worker",
                                color: AppColors.blue,
                              ),
                              SizedBox(width: 15),

                              UpContainerViewCard(text: "Remove"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Meterials",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            height: 60,
                            maxLines: 2,
                            fillColor: AppColors.white,
                            hintText: "10 cubic meters of concrete",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: SizedBox(
                    width: double.infinity,
                    height: 600,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Site Capture",
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Card(
                            color: AppColors.gray,
                            child: SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    shape: StadiumBorder(),
                                    color: AppColors.blue,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  CustomTextWidget(
                                    title: "Capture Photo",
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                AppImages.adddaily,
                                height: 192,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 15,
                                left: 310,
                                child: Icon(
                                  Icons.delete_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.gray),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                        color: AppColors.black,
                                      ),
                                      SizedBox(width: 10),
                                      CustomTextWidget(
                                        title: "Location",
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  CustomTextWidget(
                                    title: "Site 5 , Section A",
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomButtonWidget(
                            title: "Recapture Photo",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            cardColor: AppColors.blue,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButtonWidget(
                                  height: 40,
                                  title: "Save Log",
                                  borderRadius: BorderRadius.circular(8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  cardColor: AppColors.blue,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: CustomButtonWidget(
                                  height: 40,
                                  borderRadius: BorderRadius.circular(8),
                                  title: "Cancel",
                                  color: AppColors.lightGray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  cardColor: AppColors.gray,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
