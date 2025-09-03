import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/home/controller/employee_add_site_diary_controller.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_site_diary_widget/employee_add_site_diary_widget.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_site_diary_widget/employee_add_task_section_widget.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_site_diary_widget/employee_image_and_location_widget.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_add_site_diary_widget/employee_task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmployeeAddSiteDiaryView  extends StatelessWidget {
  EmployeeAddSiteDiaryView({super.key});

  final EmployeeAddSiteDiaryController employeeAddSiteDiaryController = Get.put(EmployeeAddSiteDiaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
            height: 812.h(context),
            width: 375.w(context),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackGroundColor,
            ),
            child: CustomScrollView(
              slivers: [

                CustomAppBarHelper.normalAppBar(
                  context: context,
                  onBackPressed: () {
                    Get.off(()=>EmployeeDashboardView(index: 0),preventDuplicates: false);
                  },
                  title: 'Add Site Diary',
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: employeeAddSiteDiaryController.isLoading.value == true  ?
                    CustomLoaderButton().customLoaderButton(
                      backgroundColor: Colors.transparent,
                      loaderColor: Color.fromRGBO(38, 50, 56, 1),
                      height: 812,
                      context: context,
                    ) : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SpaceHelperClass.v(24.h(context)),


                        EmployeeAddSiteDiaryWidget.employeeProjectSelectionAndDescriptionBuilder(
                          context: context,
                          controller: employeeAddSiteDiaryController,
                        ),

                        SpaceHelperClass.v(24.h(context)),

                        EmployeeAddTaskSectionWidget().employeeAddTaskSectionBuilder(
                          context: context,
                          controller: employeeAddSiteDiaryController,
                        ),

                        SpaceHelperClass.v(24.h(context)),

                        ...employeeAddSiteDiaryController.taskList.map((item) {
                          return EmployeeTaskDetailsWidget().employeeTaskDetailsBuilder(
                            context: context,
                            controller: employeeAddSiteDiaryController,
                            item: item,
                          );
                        }),


                        EmployeeImageAndLocationWidget().employeeImageAndLocationBuilder(
                          context: context,
                          controller: employeeAddSiteDiaryController,
                        ),

                        SpaceHelperClass.v(35.h(context)),

                        Row(
                          children: [


                            Expanded(
                              child: employeeAddSiteDiaryController.isSubmit.value == true ?
                              CustomLoaderButton().customLoaderButton(
                                backgroundColor: Colors.transparent,
                                loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                height: 50,
                                context: context,
                              ) :
                              CustomButtonHelper.customRoundedButton(
                                context: context,
                                text: "Save Log",
                                fontSize: 16,
                                textColor: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600,
                                borderRadius: 8,
                                backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                onPressed: () async {
                                  if(employeeAddSiteDiaryController.getEmployeeProjectDetailsResponseModel.value.data == null) {
                                    kSnackBar(message: "Please select a project", bgColor: AppColors.red);
                                  } else if(employeeAddSiteDiaryController.nameController.value.text == ""){
                                    kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                  } else if(employeeAddSiteDiaryController.descriptionController.value.text == "") {
                                    kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                  } else if(employeeAddSiteDiaryController.dateTimeController.value.text == "") {
                                    kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                  } else if(employeeAddSiteDiaryController.weatherConditionController.value.text == "") {
                                    kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                  } else if(employeeAddSiteDiaryController.locationController.value.text == "") {
                                    kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                  } else if(employeeAddSiteDiaryController.taskList.isEmpty == true) {
                                    kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                  } else if(employeeAddSiteDiaryController.selectedImage.value.path == "") {
                                    kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                  } else {
                                    employeeAddSiteDiaryController.isSubmit.value = true;
                                    List<Map<String, dynamic>> tasksToJson(List<EmployeeTask> tasks) {
                                      return tasks.map((task) {
                                        return {
                                          "name": task.name,
                                          "workforces": task.workforce.map((wf) {
                                            return {
                                              "workforce": wf.typeId,
                                              "quantity": wf.quantity,
                                              "duration": "${wf.duration} hours",
                                            };
                                          }).toList(),
                                          "equipments": task.equipment.map((eq) {
                                            return {
                                              "equipment": eq.typeId,
                                              "quantity": eq.quantity,
                                              "duration": "${eq.duration} hours",
                                            };
                                          }).toList(),
                                        };
                                      }).toList();
                                    }

                                    Map<String,dynamic> payload = {
                                      "name": employeeAddSiteDiaryController.nameController.value.text,
                                      "project": employeeAddSiteDiaryController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                      "description": employeeAddSiteDiaryController.descriptionController.value.text,
                                      "date": employeeAddSiteDiaryController.dateTimeController.value.text,
                                      "weather_condition": employeeAddSiteDiaryController.weatherConditionController.value.text,
                                      "duration": "8 hours",
                                      "tasks": tasksToJson(employeeAddSiteDiaryController.taskList),
                                      "location": employeeAddSiteDiaryController.locationController.value.text,
                                    };
                                    print(jsonEncode(payload));
                                    //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                    await employeeAddSiteDiaryController.crateSiteDiaryController(
                                      payload: payload,
                                      image: employeeAddSiteDiaryController.selectedImage.value,
                                    );
                                  }

                                },
                              ),
                            ),


                            SpaceHelperClass.h(12.w(context)),

                            Expanded(
                              child: CustomButtonHelper.customRoundedButton(
                                context: context,
                                text: "Cancel",
                                fontSize: 16,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w600,
                                borderRadius: 8,
                                backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                                borderWidth: 1,
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                                onPressed: () {
                                  Get.off(()=>EmployeeDashboardView(index: 0),preventDuplicates: false);
                                },
                              ),
                            ),



                          ],
                        ),


                        SpaceHelperClass.v(35.h(context)),



                      ],
                    ),
                  ),
                )

              ],
            )
        )),
      ),
    );
  }

}