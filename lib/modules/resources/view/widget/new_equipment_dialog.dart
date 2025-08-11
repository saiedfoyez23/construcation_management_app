import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/resources/view/project_detalis_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewEquipmentDialog extends StatelessWidget {
  const NewEquipmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              CustomTextWidget(
                title: "Add New Equipments",
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17,
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
                      width: 130,
                      child: CustomTextField(
                        fillColor: AppColors.white,
                        hintText: "Laborer",
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
                      width: 130,
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
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  onTap: () {
                    Get.back();
                  },
                  width: 150,
                  title: "Cancel",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  cardColor: Color(0xFFF3F4F6),
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(ProjectDetalisResources());
                  },
                  child: CustomButtonWidget(
                    width: 150,
                    title: "Save",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    cardColor: AppColors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
