import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/home/controller/add_site_diary_controller.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_site_diary_widget/add_site_diary_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_site_diary_widget/add_task_section_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_site_diary_widget/image_and_location_widget.dart';
import 'package:construction_management_app/modules/company_user/home/widget/add_site_diary_widget/task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddSiteDiaryView  extends StatelessWidget {
  AddSiteDiaryView ({super.key});

  final AddSiteDiaryController addSiteDiaryController = Get.put(AddSiteDiaryController());

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
                  title: 'Add Site Diary',
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: addSiteDiaryController.isLoading.value == true  ?
                    CustomLoaderButton().customLoaderButton(
                      backgroundColor: Colors.transparent,
                      loaderColor: Color.fromRGBO(38, 50, 56, 1),
                      height: 812,
                      context: context,
                    ) : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SpaceHelperClass.v(24.h(context)),


                        AddSiteDiaryWidget.projectSelectionAndDescriptionBuilder(
                          context: context,
                          controller: addSiteDiaryController,
                        ),

                        SpaceHelperClass.v(24.h(context)),

                        AddTaskSectionWidget().addTaskSectionBuilder(context: context, controller: addSiteDiaryController),

                        SpaceHelperClass.v(24.h(context)),

                        ...addSiteDiaryController.taskList.map((item) {
                          return TaskDetailsWidget().taskDetailsBuilder(
                            context: context,
                            controller: addSiteDiaryController,
                            item: item,
                          );
                        }),


                        ImageAndLocationWidget().imageAndLocationBuilder(context: context, controller: addSiteDiaryController),

                        SpaceHelperClass.v(35.h(context)),

                        Row(
                          children: [


                            Expanded(
                              child: addSiteDiaryController.isSubmit.value == true ?
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
                                  if(addSiteDiaryController.getProjectDetailsResponseModel.value.data == null) {
                                    kSnackBar(message: "Please select a project", bgColor: AppColors.red);
                                  } else if(addSiteDiaryController.nameController.value.text == ""){
                                    kSnackBar(message: "Please enter the site diary name", bgColor: AppColors.red);
                                  } else if(addSiteDiaryController.descriptionController.value.text == "") {
                                    kSnackBar(message: "Please enter the description", bgColor: AppColors.red);
                                  } else if(addSiteDiaryController.dateTimeController.value.text == "") {
                                    kSnackBar(message: "Please select a date", bgColor: AppColors.red);
                                  } else if(addSiteDiaryController.weatherConditionController.value.text == "") {
                                    kSnackBar(message: "Please enter a weather condition", bgColor: AppColors.red);
                                  } else if(addSiteDiaryController.locationController.value.text == "") {
                                    kSnackBar(message: "Please enter location", bgColor: AppColors.red);
                                  } else if(addSiteDiaryController.taskList.isEmpty == true) {
                                    kSnackBar(message: "Please add minium 1 task", bgColor: AppColors.red);
                                  } else if(addSiteDiaryController.selectedImage.value.path == "") {
                                    kSnackBar(message: "Please select a image", bgColor: AppColors.red);
                                  } else {
                                    addSiteDiaryController.isSubmit.value = true;
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
                                      "name": addSiteDiaryController.nameController.value.text,
                                      "project": addSiteDiaryController.getProjectDetailsResponseModel.value.data?.sId ?? "",
                                      "description": addSiteDiaryController.descriptionController.value.text,
                                      "date": addSiteDiaryController.dateTimeController.value.text,
                                      "weather_condition": addSiteDiaryController.weatherConditionController.value.text,
                                      "duration": "8 hours",
                                      "tasks": tasksToJson(addSiteDiaryController.taskList),
                                      "location": addSiteDiaryController.locationController.value.text,
                                    };
                                    print(jsonEncode(payload));
                                    //Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                    await addSiteDiaryController.crateSiteDiaryController(payload: payload, image: addSiteDiaryController.selectedImage.value);
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
            )
        )),
      ),
    );
  }

}