import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/planning/controller/employee_get_planing_controller.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_edit_planing_view.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_new_planing_view.dart';
import 'package:construction_management_app/modules/employee_user/planning/view/employee_planning_details_view.dart';
import 'package:construction_management_app/modules/employee_user/project_details/view/employee_project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeePlaningView extends StatelessWidget {
  const EmployeePlaningView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    EmployeeGetPlaningController employeeGetPlaningController = Get.put(EmployeeGetPlaningController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: employeeGetPlaningController.isLoading.value == true  ?
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



              employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?.isEmpty == true ?
              SliverToBoxAdapter(
                child: Column(
                  children: [


                    SpaceHelperClass.v(50.h(context)),


                    TextHelperClass.headingText(
                      context: context,
                      text: "No Planing Available",
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      textColor: Color.fromRGBO(114, 114, 114, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ) :
              SliverList(delegate: SliverChildBuilderDelegate(
                      (context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      child: Container(
                        width: 375.w(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r(context)),
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xFFE5E7EB), // rgba(229, 231, 235, 1)
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 12.bpm(context)),
                        padding: EdgeInsets.only(
                          top: 14.tpm(context),
                          right: 16.rpm(context),
                          bottom: 14.bpm(context),
                          left: 16.lpm(context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top Row (Title, Hours, Delete Icon)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextHelperClass.headingText(
                                        context: context,
                                        text:employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?[index].name,
                                        fontSize: 18,
                                        textColor: Color.fromRGBO(31, 41, 55, 1),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),

                                SpaceHelperClass.h(5.h(context)),

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete_outlined,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return Obx(()=>AlertDialog(
                                                backgroundColor: AppColors.white,
                                                insetPadding: EdgeInsets.only(
                                                  left: 21.lpm(context),
                                                  right: 21.rpm(context),
                                                  top: 56.tpm(context),
                                                  bottom: 56.bpm(context),
                                                ),
                                                contentPadding: EdgeInsets.symmetric(horizontal: 24.hpm(context),vertical: 24.vpm(context)),
                                                scrollable: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.r(context)),
                                                  side: const BorderSide(
                                                    color: Color.fromRGBO(229, 231, 235, 1),
                                                    width: 1,
                                                  ),
                                                ),
                                                content: SizedBox(
                                                  width: 375.w(context),
                                                  //height: 812.h(context),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [

                                                      ImageHelperClass.customImageContainer(
                                                        context: context,
                                                        height: 74.h(context),
                                                        width: 74.w(context),
                                                        imagePath: AppImages.deleteFileIcon,
                                                        imageFit: BoxFit.contain,
                                                        fit: BoxFit.cover,
                                                      ),

                                                      SpaceHelperClass.v(8.h(context)),

                                                      TextHelperClass.headingText(
                                                        textAlign: TextAlign.center,
                                                        alignment: Alignment.center,
                                                        context: context,
                                                        text: "Delete Planing?",
                                                        fontSize: 18,
                                                        textColor: AppColors.black255,
                                                        fontWeight: FontWeight.w700,
                                                      ),


                                                      SpaceHelperClass.v(18.h(context)),

                                                      TextHelperClass.headingText(
                                                        textAlign: TextAlign.center,
                                                        alignment: Alignment.center,
                                                        context: context,
                                                        text: "Are you sure you want to delete this item? This action cannot be undone.",
                                                        fontSize: 16,
                                                        textColor: Color.fromRGBO(107, 114, 128, 1),
                                                        fontWeight: FontWeight.w700,
                                                      ),


                                                      SpaceHelperClass.v(16.h(context)),


                                                      Column(
                                                        children: [

                                                          employeeGetPlaningController.isDelete.value == true ?
                                                          CustomLoaderButton().customLoaderButton(
                                                            backgroundColor: Colors.transparent,
                                                            loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                            height: 50,
                                                            context: context,
                                                          ) :
                                                          CustomButtonHelper.customRoundedButton(
                                                            context: context,
                                                            text: "Delete",
                                                            fontSize: 16,
                                                            textColor: Color.fromRGBO(255, 255, 255, 1),
                                                            fontWeight: FontWeight.w600,
                                                            borderRadius: 8,
                                                            backgroundColor: Color.fromRGBO(220, 20, 60, 1),
                                                            onPressed: () async {
                                                              employeeGetPlaningController.isDelete.value = true;
                                                              await employeeGetPlaningController.deleteEmployeePlaningController(
                                                                planingId: employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?[index].sId,
                                                                projectId: projectId,
                                                              );
                                                            },
                                                          ),

                                                          SpaceHelperClass.v(12.h(context)),


                                                          CustomButtonHelper.customRoundedButton(
                                                            context: context,
                                                            text: "Cancel",
                                                            fontSize: 16,
                                                            textColor: Color.fromRGBO(75, 85, 99, 1),
                                                            fontWeight: FontWeight.w600,
                                                            borderRadius: 8,
                                                            backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                                                            borderWidth: 1,
                                                            borderColor: Color.fromRGBO(229, 231, 235, 1),
                                                            onPressed: () async {
                                                              Get.back();
                                                            },
                                                          ),






                                                        ],
                                                      ),


                                                      SpaceHelperClass.v(24.h(context)),

                                                    ],
                                                  ),
                                                ),
                                              ));
                                            },
                                          );
                                        },
                                        iconSize: 25.r(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),


                            SpaceHelperClass.v(12.h(context)),


                            // Workforce
                            Row(
                              children: [
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imagePath: AppImages.workforceIcon,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),


                                SpaceHelperClass.h(12.w(context)),
                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: "${employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?[index].totalWorkforces} Workforce",
                                    fontSize: 15,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            // Equipment
                            Row(
                              children: [
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imagePath:AppImages.equipmentIcon,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),

                                SpaceHelperClass.h(12.w(context)),

                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: "${employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?[index].totalEquipments} Equipments",
                                    fontSize: 15,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            Row(
                              children: [
                                Icon(Icons.access_time, size: 25.r(context), color: Color.fromRGBO(41, 45, 50, 1)),
                                SpaceHelperClass.h(12.w(context)),
                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: "${DateFormat("MMM d, y , h:mm a").format(DateTime.parse(employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?[index].dueDate).toLocal())}",
                                    fontSize: 15,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),


                            SpaceHelperClass.v(14.h(context)),

                            const SizedBox(height: 16),

                            // Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                CustomButtonHelper.customTextButton(
                                  context: context,
                                  fontSize: 18,
                                  text: 'View Details →',
                                  onPressed: () {
                                    Get.off(()=>EmployeePlaningDetailsView(
                                      planingId: employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?[index].sId,
                                      projectId: projectId,
                                    ),);
                                  },
                                ),



                                SizedBox(
                                  height: 50.h(context),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Get.off(()=>EmployeeEditPlaningView(
                                        planingId: employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?[index].sId,
                                        projectId: projectId,
                                      ),preventDuplicates: false);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.hpm(context),
                                        vertical: 6.vpm(context),
                                      ),
                                      backgroundColor: Color.fromRGBO(242, 243, 245, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r(context)),
                                      ),
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        ImageHelperClass.customImageContainer(
                                          context: context,
                                          height: 18.h(context),
                                          width: 18.w(context),
                                          imagePath: AppImages.editImageIcon,
                                          imageFit: BoxFit.contain,
                                          fit: BoxFit.cover,
                                        ),

                                        SpaceHelperClass.h(4.w(context)),

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          text: "Edit Log",
                                          fontSize: 16,
                                          textColor: Color.fromRGBO(0, 0, 0, 1),
                                          fontWeight: FontWeight.w500,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: employeeGetPlaningController.getEmployeeAllPlanResponseModel.value.data?.data?.length
              ),),







            ],
          ),
        )),
      ),
    );
  }
}
