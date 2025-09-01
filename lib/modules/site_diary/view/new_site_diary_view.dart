import 'dart:convert';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/project_details/view/project_details_view.dart';
import 'package:construction_management_app/modules/site_diary/controller/new_site_diary_controller.dart';
import 'package:construction_management_app/modules/site_diary/view/site_diary_view.dart';
import 'package:construction_management_app/modules/site_diary/widget/add_site_diary_widget/new_site_diary_add_task_section_widget.dart';
import 'package:construction_management_app/modules/site_diary/widget/add_site_diary_widget/new_site_diary_image_and_location_widget.dart';
import 'package:construction_management_app/modules/site_diary/widget/add_site_diary_widget/new_site_diary_task_details_widget.dart';
import 'package:construction_management_app/modules/site_diary/widget/add_site_diary_widget/new_site_diary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSiteDiaryView extends StatelessWidget {
  NewSiteDiaryView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    NewSiteDiaryController newSiteDiaryController = Get.put(NewSiteDiaryController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> newSiteDiaryController.isLoading.value == true  ?
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
                  Get.off(()=>SiteDiaryView(projectId: projectId),preventDuplicates: false);
                },
                title: "New Site Diary",
              ),
        
        
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      NewSiteDiaryWidget.projectSelectionAndDescriptionBuilder(context: context, controller: newSiteDiaryController),


                      SpaceHelperClass.v(24.h(context)),




                      NewSiteDiaryAddTaskSectionWidget().newSiteDiaryAddTaskSectionBuilder(context: context,controller: newSiteDiaryController),

                      SpaceHelperClass.v(24.h(context)),

                      ...newSiteDiaryController.taskList.map((item) {
                        return NewSiteDiaryTaskDetailsWidget().newSiteDiaryTaskDetailsBuilder(
                          context: context,
                          controller: newSiteDiaryController,
                          item: item,
                        );
                      }),


                      NewSiteDiaryImageAndLocationWidget().newSiteDiaryImageAndLocationBuilder(context: context, controller: newSiteDiaryController),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: newSiteDiaryController.isSubmit.value == true ?
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
                                if(newSiteDiaryController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(newSiteDiaryController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(newSiteDiaryController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(newSiteDiaryController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(newSiteDiaryController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(newSiteDiaryController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else if(newSiteDiaryController.selectedImage.value.path == "") {
                                  kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                } else {
                                  newSiteDiaryController.isSubmit.value = true;

                                  List<Map<String, dynamic>> tasksToJson(List<NewSiteDiaryTask> tasks) {
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
                                    "name": newSiteDiaryController.nameController.value.text,
                                    "project": newSiteDiaryController.getProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": newSiteDiaryController.descriptionController.value.text,
                                    "date": newSiteDiaryController.dateTimeController.value.text,
                                    "weather_condition": newSiteDiaryController.weatherConditionController.value.text,
                                    "duration": "",
                                    "tasks": tasksToJson(newSiteDiaryController.taskList),
                                    "location": newSiteDiaryController.locationController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await newSiteDiaryController.crateSiteDiaryController(payload: payload, image: newSiteDiaryController.selectedImage.value,projectId: projectId);
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
