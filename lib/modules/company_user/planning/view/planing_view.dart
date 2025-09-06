import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/planning/controller/get_planing_controller.dart';
import 'package:construction_management_app/modules/company_user/planning/view/employee_planning_details_view.dart';
import 'package:construction_management_app/modules/company_user/project_details/view/project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class PlaningView extends StatelessWidget {
  const PlaningView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    GetPlaningController getPlaningController = Get.put(GetPlaningController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: getPlaningController.isLoading.value == true  ?
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
                  Get.off(()=>ProjectDetailsView(projectId: projectId),preventDuplicates: false);
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


                        ],
                      ),

                      SpaceHelperClass.v(18.h(context)),

                    ],
                  ),
                ),
              ),



              getPlaningController.getAllPlanResponseModel.value.data?.data?.isEmpty == true ?
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
                                        text: getPlaningController.getAllPlanResponseModel.value.data?.data?[index].name,
                                        fontSize: 18,
                                        textColor: Color.fromRGBO(31, 41, 55, 1),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),

                                SpaceHelperClass.h(5.h(context)),
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
                                    text: "${ getPlaningController.getAllPlanResponseModel.value.data?.data?[index].totalWorkforces} Workforce",
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
                                    text: "${ getPlaningController.getAllPlanResponseModel.value.data?.data?[index].totalEquipments} Equipments",
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
                                    text: "${DateFormat("MMM d, y , h:mm a").format(DateTime.parse(getPlaningController.getAllPlanResponseModel.value.data?.data?[index].dueDate).toLocal())}",
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
                                    Get.off(()=>PlaningDetailsView(
                                      planingId: getPlaningController.getAllPlanResponseModel.value.data?.data?[index].sId,
                                      projectId: projectId,
                                    ),);
                                  },
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount:  getPlaningController.getAllPlanResponseModel.value.data?.data?.length
              ),),







            ],
          ),
        )),
      ),
    );
  }
}
