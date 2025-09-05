import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/planning/controller/employee_new_planing_controller.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_planing_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeNewPlaningView extends StatelessWidget {
  const EmployeeNewPlaningView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeeNewPlaningController employeeNewPlaningController = Get.put(EmployeeNewPlaningController(projectId: projectId));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: employeeNewPlaningController.isLoading.value == true  ?
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
                  Get.off(()=>EmployeePlaningView(projectId: projectId),preventDuplicates: false);
                },
                title: "Add New Planing",
              ),

            ],
          ),
        ),
      ))
    );
  }
}
