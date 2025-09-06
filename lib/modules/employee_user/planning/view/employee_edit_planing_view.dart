import 'dart:convert';

import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/planning/controller/employee_edit_planing_controller.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_planning_details_view.dart';
import 'package:construction_management_app/modules/employee_user/planning/widget/edit_planing_task/employee_edit_planing_add_task_section_widget.dart';
import 'package:construction_management_app/modules/employee_user/planning/widget/edit_planing_task/employee_edit_planing_task_details_widget.dart';
import 'package:construction_management_app/modules/employee_user/planning/widget/edit_planing_task/employee_edit_planing_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeEditPlaningView extends StatelessWidget {
  const EmployeeEditPlaningView({super.key,required this.planingId,required this.projectId});

  final String planingId;
  final String projectId;


  @override
  Widget build(BuildContext context) {
    EmployeeEditPlaningController employeeEditPlaningController = Get.put(EmployeeEditPlaningController(planingId: planingId, projectId: projectId));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: employeeEditPlaningController.isLoading.value == true  ?
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
                  Get.off(()=>EmployeePlaningDetailsView(planingId: planingId, projectId: projectId,),preventDuplicates: false);
                },
                title: "Edit Planing",
              ),



              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      EmployeeEditPlaningWidget.employeeEditPlaningProjectSelectionAndDescriptionBuilder(context: context, controller: employeeEditPlaningController),

                      SpaceHelperClass.v(24.h(context)),

                      EmployeeEditPlaningAddTaskSectionWidget().employeeEditPlaningAddTaskSectionBuilder(context: context, controller: employeeEditPlaningController),

                      SpaceHelperClass.v(24.h(context)),

                      ...[
                        for (int i = 0; i < employeeEditPlaningController.taskList.length; i++)
                          EmployeeEditPlaningTaskDetailsWidget().employeeEditPlaningTaskDetailsBuilder(
                            context: context,
                            controller: employeeEditPlaningController,
                            item: employeeEditPlaningController.taskList[i],
                            index: i,
                            planingId: planingId,
                          ),
                      ],


                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: employeeEditPlaningController.isSubmit.value == true ?
                            CustomLoaderButton().customLoaderButton(
                              backgroundColor: Colors.transparent,
                              loaderColor: Color.fromRGBO(38, 50, 56, 1),
                              height: 50,
                              context: context,
                            ) :
                            CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Save",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () async {
                               if(employeeEditPlaningController.taskController.value.text == ""){
                                  kSnackBar(message: "Please enter task name", bgColor: AppColors.red);
                                } else if(employeeEditPlaningController.dueTimeController.value.text == ""){
                                  kSnackBar(message: "Please select due time", bgColor: AppColors.red);
                                } else if(employeeEditPlaningController.dueDateController.value.text == ""){
                                  kSnackBar(message: "Please select due date", bgColor: AppColors.red);
                                } else {
                                 employeeEditPlaningController.isSubmit.value = true;

                                  Map<String,dynamic> payload = {
                                    "name": employeeEditPlaningController.taskController.value.text,
                                    "due_date": employeeEditPlaningController.date.value.toString(),
                                    "due_time": employeeEditPlaningController.date.value.toString(),
                                  };
                                  print(jsonEncode(payload));
                                  await employeeEditPlaningController.uploadPlaningController(
                                    data: payload,
                                    planingId: planingId,
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
                                employeeEditPlaningController.isSubmit.value = false;
                                //Get.off(()=>(projectId: projectId),preventDuplicates: false);
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
          ),
        ),
      )),
    );
  }
}
