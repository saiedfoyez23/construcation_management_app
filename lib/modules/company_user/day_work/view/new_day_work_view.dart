import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/day_work/controller/new_day_work_controller.dart';
import 'package:construction_management_app/modules/company_user/day_work/view/day_work_view.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/add_day_work_widget/image_and_location_day_work_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/add_day_work_widget/new_add_day_work_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/add_day_work_widget/new_day_work_add_task_section_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/add_day_work_widget/new_day_work_material_used_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/add_day_work_widget/new_day_work_task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDayWorkView extends StatelessWidget {
  NewDayWorkView({super.key,required this.projectId});

  final String projectId;
  @override
  Widget build(BuildContext context) {
    NewDayWorkController newDayWorkController = Get.put(NewDayWorkController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: newDayWorkController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :CustomScrollView(
            slivers: [



              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>DayWorkView(projectId: projectId),preventDuplicates: false);
                },
                title: "New Day Work",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(24.h(context)),


                      NewAddDayWorkWidget.newDayWorkProjectSelectionAndDescriptionBuilder(
                        context: context,
                        controller: newDayWorkController,
                      ),

                      SpaceHelperClass.v(24.h(context)),

                      NewDayWorkAddTaskSectionWidget().newDayWorkAddTaskSectionBuilder(context: context, controller: newDayWorkController,),

                      SpaceHelperClass.v(24.h(context)),

                      ...newDayWorkController.taskList.map((item) {
                        return NewDayWorkTaskDetailsWidget().newDayWorkTaskDetailsBuilder(
                          context: context,
                          controller: newDayWorkController,
                          item: item,
                        );
                      }),


                      NewDayWorkMaterialUsedWidget().newDayWorkMaterialsUsedSection(
                        context: context,
                        controller: newDayWorkController,
                      ),



                      SpaceHelperClass.v(24.h(context)),


                      NewDayWorkImageAndLocationWidget().newDayWorkImageAndLocationBuilder(context: context, controller: newDayWorkController),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: newDayWorkController.isSubmit.value == true ?
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
                                if(newDayWorkController.getProjectDetailsResponseModel.value.data == null) {
                                  kSnackBar(message: "Please select a project", bgColor: AppColors.red);
                                } else if(newDayWorkController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(newDayWorkController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(newDayWorkController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(newDayWorkController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(newDayWorkController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(newDayWorkController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else if(newDayWorkController.selectedImage.value.path == "") {
                                  kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                } else {
                                  newDayWorkController.isSubmit.value = true;
                                  List<Map<String, dynamic>> tasksToJson(List<DayWorkTask> tasks) {
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
                                    "name": newDayWorkController.nameController.value.text,
                                    "project": newDayWorkController.getProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": newDayWorkController.descriptionController.value.text,
                                    "date": newDayWorkController.dateTimeController.value.text,
                                    "weather_condition": newDayWorkController.weatherConditionController.value.text,
                                    "duration": "8 hours",
                                    "tasks": tasksToJson(newDayWorkController.taskList),
                                    "location":  newDayWorkController.locationController.value.text,
                                    "materials":  newDayWorkController.metrialUsedController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await newDayWorkController.createDayWorksController(
                                    payload: payload,
                                    image: newDayWorkController.selectedImage.value,
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
                                Get.off(()=>DayWorkView(projectId: projectId),preventDuplicates: false);
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
          ),
        )),
      ),
    );
  }
}
