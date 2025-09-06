import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/planning/controller/employee_get_planing_details_controller.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_edit_planing_view.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_planing_view.dart';
import 'package:construction_management_app/modules/employee_user/planning/widget/view_planing_task/day_employee_work_details_task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class EmployeePlaningDetailsView extends StatelessWidget {
  const EmployeePlaningDetailsView({super.key,required this.planingId,required this.projectId});


  final String planingId;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeeGetPlaningDetailsController employeeGetPlaningDetailsController = Get.put(EmployeeGetPlaningDetailsController(planingId: planingId,projectId: projectId));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: employeeGetPlaningDetailsController.isLoading.value == true  ?
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
                title: "Planing Details",
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(16.h(context)),

                      Row(
                        children: [

                          Expanded(
                            child: Column(
                              children: [


                                TextHelperClass.headingText(
                                  context: context,
                                  text: "${employeeGetPlaningDetailsController.getEmployeePlanDetailsResponseModel.value.data?.project?.name} - ${employeeGetPlaningDetailsController.getEmployeePlanDetailsResponseModel.value.data?.name}",
                                  fontSize: 20,
                                  textColor: AppColors.black38,
                                  fontWeight: FontWeight.w700,
                                ),

                              ],
                            ),
                          ),

                          SpaceHelperClass.h(12.w(context)),


                          ImageHelperClass.customImageButtonContainer(
                            onPressed: () async {
                              Get.off(()=>EmployeeEditPlaningView(
                                planingId: planingId,
                                projectId: projectId,
                              ),preventDuplicates: false);
                            },
                            context: context,
                            height: 30.h(context),
                            width: 30.w(context),
                            imagePath: AppImages.editBlueIconSite,
                            fit: BoxFit.cover,
                            imageFit: BoxFit.contain,
                          ),
                        ],
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      TextHelperClass.headingText(
                        context: context,
                        text: "Date",
                        fontSize: 18,
                        textColor: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w700,
                      ),
                      SpaceHelperClass.v(8.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: "${DateFormat("MMM d, y , h:mm a").format(DateTime.parse(employeeGetPlaningDetailsController.getEmployeePlanDetailsResponseModel.value.data?.dueDate).toLocal())}",
                        fontSize: 15,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w500,
                      ),



                      SpaceHelperClass.v(16.h(context)),

                      ...employeeGetPlaningDetailsController.taskList.map((item) {
                        return EmployeePlaningTaskDetailsWidget().employeePlaningTaskDetailsBuilder(
                          context: context,
                          controller: employeeGetPlaningDetailsController,
                          item: item,
                        );
                      }),

                      SpaceHelperClass.v(16.h(context)),



                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      )),
    );
  }
}
