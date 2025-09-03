import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/site_diary/view/site_diary_view.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/controller/new_employee_site_diary_controller.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/view/site_employee_diary_view.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/add_site_diary_widget/new_employee_site_diary_add_task_section_widget.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/add_site_diary_widget/new_employee_site_diary_image_and_location_widget.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/add_site_diary_widget/new_employee_site_diary_task_details_widget.dart';
import 'package:construction_management_app/modules/employee_user/site_diary/widget/add_site_diary_widget/new_employee_site_diary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewEmployeeSiteDiaryView extends StatelessWidget {
  NewEmployeeSiteDiaryView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    NewEmployeeSiteDiaryController newEmployeeSiteDiaryController = Get.put(NewEmployeeSiteDiaryController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> newEmployeeSiteDiaryController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          CustomScrollView(
            slivers: [
        
        
        
              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>SiteEmployeeDiaryView(projectId: projectId),preventDuplicates: false);
                },
                title: "New Site Diary",
              ),
        
        
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      NewEmployeeSiteDiaryWidget.employeeProjectSelectionAndDescriptionBuilder(context: context, controller: newEmployeeSiteDiaryController),


                      SpaceHelperClass.v(24.h(context)),




                      NewEmployeeSiteDiaryAddTaskSectionWidget().newEmployeeSiteDiaryAddTaskSectionBuilder(context: context,controller: newEmployeeSiteDiaryController),

                      SpaceHelperClass.v(24.h(context)),

                      ...newEmployeeSiteDiaryController.taskList.map((item) {
                        return NewEmployeeSiteDiaryTaskDetailsWidget().newEmployeeSiteDiaryTaskDetailsBuilder(
                          context: context,
                          controller: newEmployeeSiteDiaryController,
                          item: item,
                        );
                      }),


                      NewEmployeeSiteDiaryImageAndLocationWidget().newEmployeeSiteDiaryImageAndLocationBuilder(context: context, controller: newEmployeeSiteDiaryController),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: newEmployeeSiteDiaryController.isSubmit.value == true ?
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
                                if(newEmployeeSiteDiaryController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(newEmployeeSiteDiaryController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(newEmployeeSiteDiaryController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(newEmployeeSiteDiaryController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(newEmployeeSiteDiaryController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(newEmployeeSiteDiaryController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else if(newEmployeeSiteDiaryController.selectedImage.value.path == "") {
                                  kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                } else {
                                  newEmployeeSiteDiaryController.isSubmit.value = true;

                                  List<Map<String, dynamic>> tasksToJson(List<EmployeeNewSiteDiaryTask> tasks) {
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
                                    "name": newEmployeeSiteDiaryController.nameController.value.text,
                                    "project": newEmployeeSiteDiaryController.getEmployeeProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": newEmployeeSiteDiaryController.descriptionController.value.text,
                                    "date": newEmployeeSiteDiaryController.dateTimeController.value.text,
                                    "weather_condition": newEmployeeSiteDiaryController.weatherConditionController.value.text,
                                    "duration": "8 hours",
                                    "tasks": tasksToJson(newEmployeeSiteDiaryController.taskList),
                                    "location": newEmployeeSiteDiaryController.locationController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await newEmployeeSiteDiaryController.crateSiteDiaryController(
                                    payload: payload,
                                    image: newEmployeeSiteDiaryController.selectedImage.value,
                                    projectId: projectId,
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
                                Get.off(()=>SiteDiaryView(projectId: projectId),preventDuplicates: false);
                              },
                            ),
                          ),



                        ],
                      ),


                      SpaceHelperClass.v(35.h(context)),
        
        
                    ],
                  ),
                ),
              ),
        
        
        
        
        
        
            ],
          )),
        ),
      ),
    );
  }
}
