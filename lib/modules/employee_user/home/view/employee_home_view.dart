import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/home/controller/employee_home_controller.dart';
import 'package:construction_management_app/modules/employee_user/home/view/employee_add_day_work_view.dart';
import 'package:construction_management_app/modules/employee_user/home/view/employee_add_site_diary_view.dart';
import 'package:construction_management_app/modules/employee_user/home/widget/employee_home_widget/employee_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';


class EmployeeHomeView extends StatelessWidget {
  EmployeeHomeView({super.key});

  final EmployeeHomeController employeeHomeController = Get.put(EmployeeHomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          child: employeeHomeController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          Container(
            height: 812.h(context),
            width: 375.w(context),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackGroundColor,
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                Get.off(()=>EmployeeDashboardView(index: 0),preventDuplicates: false);
              },
              child: CustomScrollView(
                slivers: [

                  CustomAppBarHelper().employeeHomePageAppBar(context),


                  SliverToBoxAdapter(
                    child: Column(
                      children: [


                        EmployeeHomeWidgets.profileCard(
                          context: context,
                          userName: employeeHomeController.employeeProfileResponseModel.value.data?.name ?? "Guest User",
                          userRole: employeeHomeController.employeeProfileResponseModel.value.data?.type ?? "Employee type is not Assigned",
                          accountType: "Basic Account",
                          profileImageUrl: employeeHomeController.employeeProfileResponseModel.value.data?.image,
                          width: 375.w(context), // Optional width parameter
                        ),


                        SpaceHelperClass.v(10.h(context)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            CustomButtonHelper.imageTextColumnButton(
                              context: context,
                              imagePath: AppImages.addSiteDiary,
                              text: "Add Site Diary",
                              onTap: () {
                                Get.off(()=>EmployeeAddSiteDiaryView(), preventDuplicates: false);
                              },
                            ),
                            SpaceHelperClass.h(16.w(context)),

                            CustomButtonHelper.imageTextColumnButton(
                              context: context,
                              imagePath: AppImages.addDayworks,
                              text: "Add Dayworks",
                              onTap: () {
                                Get.off(()=>EmployeeAddDayWorkView(), preventDuplicates: false);
                              },
                            ),

                          ],
                        ),



                        SpaceHelperClass.v(16.h(context)),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Expanded(
                              child: TextHelperClass.headingText(
                                context: context,
                                text: "Active Jobs",
                                fontSize: 20,
                                textColor: AppColors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            CustomButtonHelper.customTextButton(
                              context: context,
                              text: 'See All',
                              textColor: Color.fromRGBO(37, 99, 235, 1),
                              onPressed: () {
                                Get.off(()=>EmployeeDashboardView(index: 1),preventDuplicates: false);
                              },
                            ),
                          ],
                        ),

                        SpaceHelperClass.v(18.h(context)),

                        employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data?.isEmpty == true ||
                            employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data == null ?
                        TextHelperClass.headingText(
                          context: context,
                          text: "No Project Available",
                          alignment: Alignment.center,
                          textAlign: TextAlign.center,
                          fontSize: 24,
                          textColor: Color.fromRGBO(114, 114, 114, 1),
                          fontWeight: FontWeight.w700,
                        ) :
                        Column(
                          children: List.generate(employeeHomeController.employeeGetAllProjectResponseModel.value.data!.data!.length, (index) {
                            return EmployeeHomeWidgets.projectDetailsCard(
                              context: context,
                              projectName: employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data?[index].name ?? "",
                              projectAddress: employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data?[index].location ?? "",
                              dailyLogsCount: employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data?[index].totalSiteDiary ?? "",
                              dayWorksCount: employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data?[index].totalDayWork ?? "",
                              projectId: employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data?[index].sId,
                              images: employeeHomeController.employeeGetAllProjectResponseModel.value.data?.data?[index].dayWorkImages,
                            );
                          }),
                        ),


                        SpaceHelperClass.v(18.h(context)),


                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
