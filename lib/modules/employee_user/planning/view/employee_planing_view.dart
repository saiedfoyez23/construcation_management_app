import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_new_planing_view.dart';
import 'package:construction_management_app/modules/employee_user/project_details/view/employee_project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeePlaningView extends StatelessWidget {
  const EmployeePlaningView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  Get.off(()=>EmployeeProjectDetailsView(projectId: projectId),preventDuplicates: false);
                },
                title: "All Planing",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [


                      SpaceHelperClass.v(16.h(context)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Expanded(
                            child: TextHelperClass.headingText(
                              context: context,
                              text: "All Planing",
                              fontSize: 22,
                              textColor: AppColors.black255,
                              fontWeight: FontWeight.w700,
                            ),
                          ),



                          CustomButtonHelper.textWithIconButton(
                            context: context,
                            height: 40,
                            onPressed: () async {
                              Get.off(()=>EmployeeNewPlaningView(projectId: projectId),preventDuplicates: false);
                            },
                            text: "Add Planing",
                            icon: Icons.add,
                            iconSize: 19.r(context),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),


                        ],
                      ),

                      SpaceHelperClass.v(18.h(context)),

                    ],
                  ),
                ),
              ),







            ],
          ),
        ),
      ),
    );
  }
}
