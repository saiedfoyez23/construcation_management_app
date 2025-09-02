import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/day_work/controller/day_work_edit_controller.dart';
import 'package:construction_management_app/modules/company_user/day_work/view/day_work_details_view.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/day_work_edit_widget/edit_day_work_add_task_section_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/day_work_edit_widget/edit_day_work_delay_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/day_work_edit_widget/edit_day_work_image_and_location_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/day_work_edit_widget/edit_day_work_material_used_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/day_work_edit_widget/edit_day_work_task_details_widget.dart';
import 'package:construction_management_app/modules/company_user/day_work/widget/day_work_edit_widget/edit_day_work_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayWorkEditView extends StatelessWidget {
  DayWorkEditView({super.key,required this.dayWorkId,required this.projectId});

  final String dayWorkId;
  final String projectId;


  @override
  Widget build(BuildContext context) {
    DayWorkEditController dayWorkEditController = Get.put(DayWorkEditController(projectId: projectId, dayWorkId: dayWorkId));
    return Scaffold(
      body:  SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> dayWorkEditController.isLoading.value == true  ?
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
                  Get.off(()=>DayWorkDetailsView(projectId: projectId,dayWorkId: dayWorkId,),preventDuplicates: false);
                },
                title: "Edit Day Work",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      EditDayWorkWidget.projectSelectionAndDescriptionBuilder(context: context, controller: dayWorkEditController),


                      SpaceHelperClass.v(24.h(context)),




                      EditDayWorkAddTaskSectionWidget().editDayWorkAddTaskSectionBuilder(context: context,controller: dayWorkEditController),

                      SpaceHelperClass.v(24.h(context)),

                      ...[
                        for (int i = 0; i < dayWorkEditController.taskList.length; i++)
                          EditDayWorkTaskDetailsWidget().editDayWorkTaskDetailsBuilder(
                            context: context,
                            controller: dayWorkEditController,
                            item: dayWorkEditController.taskList[i],
                            index: i,
                            dayWorkId: dayWorkId,
                          ),
                      ],


                      SpaceHelperClass.v(24.h(context)),


                      EditDayWorkMaterialUsedWidget().editDayWorkMaterialsUsedSection(context: context, controller: dayWorkEditController),

                      SpaceHelperClass.v(24.h(context)),


                      EditDayWorkCommandWidget().editDayWorkCommendWidget(context: context, controller: dayWorkEditController),

                      SpaceHelperClass.v(24.h(context)),


                      EditDayWorkImageAndLocationWidget().editDayWorkImageAndLocationBuilder(context: context, controller: dayWorkEditController),

                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: dayWorkEditController.isSubmit.value == true ?
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
                                if(dayWorkEditController.nameController.value.text == ""){
                                  kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                } else if(dayWorkEditController.descriptionController.value.text == "") {
                                  kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                } else if(dayWorkEditController.dateTimeController.value.text == "") {
                                  kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                } else if(dayWorkEditController.weatherConditionController.value.text == "") {
                                  kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                } else if(dayWorkEditController.locationController.value.text == "") {
                                  kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                } else if(dayWorkEditController.taskList.isEmpty == true) {
                                  kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                } else {
                                  dayWorkEditController.isSubmit.value = true;

                                  List<Map<String, dynamic>> tasksToJson(List<DayWorkEditTask> tasks) {
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
                                    "name": dayWorkEditController.nameController.value.text,
                                    "project": dayWorkEditController.getProjectDetailsResponseModel.value.data?.sId ?? "",
                                    "description": dayWorkEditController.descriptionController.value.text,
                                    "date": dayWorkEditController.dateTimeController.value.text,
                                    "weather_condition": dayWorkEditController.weatherConditionController.value.text,
                                    "comment": dayWorkEditController.commendController.value.text,
                                    "materials": dayWorkEditController.materialUsedController.value.text,
                                    "location": dayWorkEditController.locationController.value.text,
                                  };
                                  print(jsonEncode(payload));
                                  //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                  await dayWorkEditController.updateSiteDiaryController(
                                    payload: payload,
                                    image: dayWorkEditController.selectedImage.value,
                                    projectId: projectId,
                                    dayWorkId: dayWorkId
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
                                Get.off(()=>DayWorkDetailsView(projectId: projectId, dayWorkId: dayWorkId,),preventDuplicates: false);
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
