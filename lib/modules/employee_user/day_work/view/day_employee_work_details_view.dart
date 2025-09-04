import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/day_work/controller/get_employee_day_work_details_controller.dart';
import 'package:construction_management_app/modules/employee_user/day_work/view/day_employee_work_edit_view.dart';
import 'package:construction_management_app/modules/employee_user/day_work/view/day_employee_work_view.dart';
import 'package:construction_management_app/modules/employee_user/day_work/widget/day_employee_work_details_widget/day_employee_work_details_task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DayEmployeeWorkDetailsView extends StatelessWidget {
  DayEmployeeWorkDetailsView({super.key,required this.dayWorkId,required this.projectId});

  final String dayWorkId;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    GetEmployeeDayWorkDetailsController getEmployeeDayWorkDetailsController = Get.put(GetEmployeeDayWorkDetailsController(dayWorkId: dayWorkId, projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: 812.h(context),
            width: 375.w(context),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackGroundColor,
            ),
            child: Obx(()=> getEmployeeDayWorkDetailsController.isLoading.value == true  ?
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
                    Get.off(()=>DayEmployeeWorkView(projectId: projectId),preventDuplicates: false);
                  },
                  title: "Day Work Details",
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
                                    text: "${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.project?.name} - ${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.name}",
                                    fontSize: 20,
                                    textColor: AppColors.black38,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  SpaceHelperClass.v(6.h(context)),

                                  Row(
                                    children: [
                                      ImageHelperClass.customImageContainer(
                                        context: context,
                                        height: 18.h(context),
                                        width: 18.w(context),
                                        imagePath: AppImages.location,
                                        imageFit: BoxFit.contain,
                                        fit: BoxFit.cover,
                                      ),

                                      SpaceHelperClass.h(4.w(context)),

                                      Expanded(
                                        child: TextHelperClass.headingText(
                                          context: context,
                                          text: "${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.location}",
                                          fontSize: 16,
                                          textColor: AppColors.gray107,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                    ],
                                  ),


                                ],
                              ),
                            ),

                            SpaceHelperClass.h(12.w(context)),


                            ImageHelperClass.customImageButtonContainer(
                              onPressed: () async {
                                Get.off(()=>DayEmployeeWorkEditView(dayWorkId: getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.sId, projectId: projectId),preventDuplicates: false);
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
                          text: "Description",
                          fontSize: 18,
                          textColor: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w700,
                        ),
                        SpaceHelperClass.v(8.h(context)),

                        TextHelperClass.headingText(
                          context: context,
                          text: "${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.description}",
                          fontSize: 15,
                          textColor: Color.fromRGBO(75, 85, 99, 1),
                          fontWeight: FontWeight.w500,
                        ),


                        SpaceHelperClass.v(16.h(context)),


                        TextHelperClass.headingText(
                          context: context,
                          text: "Weather Condition",
                          fontSize: 18,
                          textColor: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w700,
                        ),
                        SpaceHelperClass.v(8.h(context)),

                        TextHelperClass.headingText(
                          context: context,
                          text: "${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.weatherCondition}",
                          fontSize: 15,
                          textColor: Color.fromRGBO(75, 85, 99, 1),
                          fontWeight: FontWeight.w500,
                        ),



                        SpaceHelperClass.v(16.h(context)),


                        TextHelperClass.headingText(
                          context: context,
                          text: "Materials Used",
                          fontSize: 18,
                          textColor: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w700,
                        ),
                        SpaceHelperClass.v(8.h(context)),

                        TextHelperClass.headingText(
                          context: context,
                          text: "${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.materials}",
                          fontSize: 15,
                          textColor: Color.fromRGBO(75, 85, 99, 1),
                          fontWeight: FontWeight.w500,
                        ),




                        SpaceHelperClass.v(16.h(context)),

                        ...getEmployeeDayWorkDetailsController.taskList.map((item) {
                          return DayEmployeeWorkDetailsTaskDetailsWidget().dayEmployeeWorkDetailsTaskDetailsBuilder(
                            context: context,
                            controller: getEmployeeDayWorkDetailsController,
                            item: item,
                          );
                        }),

                        SpaceHelperClass.v(16.h(context)),



                        TextHelperClass.headingText(
                          context: context,
                          text: "Attachments",
                          fontSize: 18,
                          textColor: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w700,
                        ),
                        SpaceHelperClass.v(8.h(context)),

                        TextHelperClass.headingText(
                          context: context,
                          text: "Task-related photos",
                          fontSize: 15,
                          textColor: Color.fromRGBO(75, 85, 99, 1),
                          fontWeight: FontWeight.w500,
                        ),

                        SpaceHelperClass.v(13.h(context)),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.r(context)),
                          child: Image.network(
                            "${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.image}",
                            width: 375.w(context),
                            height: 192.h(context),
                            fit: BoxFit.contain,
                          ),
                        ),

                        SpaceHelperClass.v(16.h(context)),


                        getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.duration == "" ?
                        SizedBox.shrink() :
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 242, 255, 1),
                            borderRadius: BorderRadius.circular(12.r(context)),
                          ),
                          child: Column(
                            children: [

                              Row(
                                children: [
                                  ImageHelperClass.customImageContainer(
                                    context: context,
                                    height: 20.h(context),
                                    width: 20.w(context),
                                    imagePath: AppImages.delay,
                                    imageFit: BoxFit.contain,
                                    fit: BoxFit.cover,
                                  ),


                                  SpaceHelperClass.h(12.w(context)),


                                  Expanded(
                                    child: TextHelperClass.headingText(
                                      context: context,
                                      text: "Delay",
                                      fontSize: 18,
                                      textColor: Color.fromRGBO(31, 41, 55, 1), // White text
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),

                              SpaceHelperClass.v(16.h(context)),


                              TextHelperClass.headingText(
                                context: context,
                                text: "${getEmployeeDayWorkDetailsController.getEmployeeSingleDayWorkDetailsResponseModel.value.data?.duration}",
                                fontSize: 15,
                                textColor: Color.fromRGBO(75, 85, 99, 1), // White text
                                fontWeight: FontWeight.w500,
                              ),




                            ],
                          ),
                        ),


                        SpaceHelperClass.v(16.h(context)),

                        getEmployeeDayWorkDetailsController.isPdf.value == true  ?
                        CustomLoaderButton().customLoaderButton(
                          backgroundColor: Colors.transparent,
                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                          height: 50,
                          context: context,
                        ) :
                        SizedBox(
                          height: 50.h(context),
                          child: OutlinedButton(
                            onPressed: () async {
                              await getEmployeeDayWorkDetailsController.getPdfExcelController(dayWorkId: dayWorkId, isExcel: false, context: context);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.hpm(context),
                                vertical: 6.vpm(context),
                              ),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r(context)),
                              ),
                              side: BorderSide(
                                  color: Color.fromRGBO(239, 68, 68, 1),
                                  width: 1
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size(375.w(context), 50.h(context)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imagePath: AppImages.pdf,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),

                                SpaceHelperClass.h(4.w(context)),

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  text: "Export as pdf",
                                  fontSize: 16,
                                  textColor: Color.fromRGBO(239, 68, 68, 1),
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),

                        SpaceHelperClass.v(12.h(context)),

                        getEmployeeDayWorkDetailsController.isExcelOpen.value == true  ?
                        CustomLoaderButton().customLoaderButton(
                          backgroundColor: Colors.transparent,
                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                          height: 50,
                          context: context,
                        ) :
                        SizedBox(
                          height: 50.h(context),
                          child: OutlinedButton(
                            onPressed: () async {
                              await getEmployeeDayWorkDetailsController.getPdfExcelController(dayWorkId: dayWorkId, isExcel: true, context: context);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.hpm(context),
                                vertical: 6.vpm(context),
                              ),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r(context)),
                              ),
                              side: BorderSide(
                                  color: Color.fromRGBO(33, 178, 122, 1),
                                  width: 1
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size(375.w(context), 50.h(context)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imagePath: AppImages.excell,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),

                                SpaceHelperClass.h(4.w(context)),

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  text: "Export as Excel",
                                  fontSize: 16,
                                  textColor: Color.fromRGBO(33, 178, 122, 1),
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),


                        SpaceHelperClass.v(15.h(context)),




                      ],
                    ),
                  ),
                )




              ],
            ),)
        ),
      ),
    );
  }
}
