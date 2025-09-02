import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/home/controller/add_day_work_controller.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_day_work_widget/add_day_work_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_day_work_widget/add_task_section_day_work_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_day_work_widget/image_and_location_day_work_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_day_work_widget/material_used_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_day_work_widget/task_details_day_work_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_site_diary_widget/add_site_diary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddDayWorkView extends StatelessWidget {
  AddDayWorkView({super.key});

  final AddDayWorkController addDayWorkController = Get.put(AddDayWorkController());


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
                  Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                },
                title: 'Add Day Works',
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: addDayWorkController.isLoading.value == true  ?
                  CustomLoaderButton().customLoaderButton(
                    backgroundColor: Colors.transparent,
                    loaderColor: Color.fromRGBO(38, 50, 56, 1),
                    height: 812,
                    context: context,
                  ) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(24.h(context)),


                      AddDayWorkWidget.projectSelectionAndDescriptionDayWorkBuilder(
                        context: context,
                        controller: addDayWorkController,
                      ),

                      SpaceHelperClass.v(24.h(context)),

                      AddTaskSectionWidgetDayWork().addTaskSectionDayWorkBuilder(context: context, controller: addDayWorkController),

                      SpaceHelperClass.v(24.h(context)),

                      ...addDayWorkController.taskList.map((item) {
                        return TaskDetailsDayWorkWidget().taskDetailsDayWorkBuilder(
                          context: context,
                          controller: addDayWorkController,
                          item: item,
                        );
                      }),


                      MaterialUsedWidget().materialsUsedSection(
                        context: context,
                        controller: addDayWorkController,
                      ),


                      SpaceHelperClass.v(24.h(context)),


                      ImageAndLocationDayWorkWidget().imageAndLocationDayWorkBuilder(context: context, controller: addDayWorkController),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: addDayWorkController.isSubmit.value == true ?
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
                                if(addDayWorkController.getProjectDetailsResponseModel.value.data == null) {
                                  kSnackBar(message: "Please select a project", bgColor: AppColors.red);
                                } else if(addDayWorkController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(addDayWorkController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(addDayWorkController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(addDayWorkController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(addDayWorkController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(addDayWorkController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else if(addDayWorkController.selectedImage.value.path == "") {
                                  kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                } else {
                                  addDayWorkController.isSubmit.value = true;
                                  List<Map<String, dynamic>> tasksToJson(List<Task> tasks) {
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
                                    "name": addDayWorkController.nameController.value.text,
                                    "project": addDayWorkController.getProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": addDayWorkController.descriptionController.value.text,
                                    "date": addDayWorkController.dateTimeController.value.text,
                                    "weather_condition": addDayWorkController.weatherConditionController.value.text,
                                    "duration": "8 hours",
                                    "tasks": tasksToJson(addDayWorkController.taskList),
                                    "location": addDayWorkController.locationController.value.text,
                                    "materials": addDayWorkController.metrialUsedController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await addDayWorkController.createDayWorksController(payload: payload, image: addDayWorkController.selectedImage.value);
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
                                Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
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
