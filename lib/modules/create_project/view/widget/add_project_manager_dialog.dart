import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/create_project/controller/create_project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProjectManagerDialog extends StatelessWidget {
  const AddProjectManagerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    CreateProjectController controller = Get.put(CreateProjectController());
    return Container(
      height: 500,
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              CustomTextWidget(
                title: "Add Project Manager",
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: CustomTextField(
              fillColor: AppColors.white,
              prefixIcon: Icon(Icons.search, color: AppColors.gray),
              hintText: "Search manager",
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CustomTextWidget(
                title: "Add Project Manager",
                color: AppColors.lightGray,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: Obx(
              () =>
                  controller.isLoadingNow.value == true
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: controller.supervisorList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var manager = controller.supervisorList[index];
                          return GestureDetector(
                            onTap: () {
                              controller.selectedManagers(manager);
                            },
                            child: Card(
                              color: AppColors.white,
                              child: SizedBox(
                                height: 60,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                  AppImages.darleneprofile,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextWidget(
                                                    title: manager.name ?? '',
                                                    color: AppColors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  CustomTextWidget(
                                                    title: manager.type ?? '',
                                                    color: AppColors.lightGray,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Obx(
                                            () => Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      controller
                                                                  .selectedManager
                                                                  .value
                                                                  ?.id ==
                                                              manager.id
                                                          ? AppColors.blue
                                                          : AppColors.gray,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color:
                                                      controller
                                                                  .selectedManager
                                                                  .value
                                                                  ?.id ==
                                                              manager.id
                                                          ? AppColors.blue
                                                          : AppColors.gray,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: CustomButtonWidget(
                    width: 150,
                    title: "Cancel",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    cardColor: Color(0xFFF3F4F6),
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (controller.selectedManager.value != null) {
                      Get.back();
                    } else {
                      Get.snackbar('Error', 'Please select a supervisor');
                    }
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
