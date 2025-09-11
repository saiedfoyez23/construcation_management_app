import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/notification/view/controller/employee_notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeNotificationView extends StatelessWidget {
  EmployeeNotificationView({super.key});

  final EmployeeNotificationController employeeNotificationController = Get.put(EmployeeNotificationController());


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
          child: employeeNotificationController.isLoading.value == true  ?
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
                  Get.off(()=>EmployeeDashboardView(index: 0,),preventDuplicates: false);
                },
                title: "Notification",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
                      SpaceHelperClass.v(16.h(context)),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: TextHelperClass.headingText(
                              context: context,
                              text: "Notification",
                              fontSize: 20,
                              textColor: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          CustomButtonHelper.customTextButton(
                            context: context,
                            text: 'Clean All Notification',
                            textColor: Color.fromRGBO(37, 99, 235, 1),
                            onPressed: () {
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
                                            text: "Delete All Notification?",
                                            fontSize: 18,
                                            textColor: AppColors.black255,
                                            fontWeight: FontWeight.w700,
                                          ),


                                          SpaceHelperClass.v(18.h(context)),

                                          TextHelperClass.headingText(
                                            textAlign: TextAlign.center,
                                            alignment: Alignment.center,
                                            context: context,
                                            text: "Are you sure you want to delete all notification? This action cannot be undone.",
                                            fontSize: 16,
                                            textColor: Color.fromRGBO(107, 114, 128, 1),
                                            fontWeight: FontWeight.w700,
                                          ),


                                          SpaceHelperClass.v(16.h(context)),


                                          Column(
                                            children: [

                                              employeeNotificationController.isDelete.value == true ?
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
                                                  employeeNotificationController.isDelete.value = true;
                                                  await employeeNotificationController.deleteAllNotificationController();
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
                          ),
                        ],
                      ),

                      SpaceHelperClass.v(18.h(context)),
                    ],
                  ),
                ),
              ),


              employeeNotificationController.getEmployeeAllNotificationResponseModel.value.data?.data?.isEmpty == true ?
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

                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 35.h(context),
                                  width: 35.w(context),
                                  imagePath: AppImages.notifi,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),


                                SpaceHelperClass.h(12.w(context)),


                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextHelperClass.headingText(
                                        context: context,
                                        text: employeeNotificationController.getEmployeeAllNotificationResponseModel.value.data?.data?[index].body,
                                        fontSize: 18,
                                        textColor: Color.fromRGBO(31, 41, 55, 1),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),

                                SpaceHelperClass.h(5.w(context)),

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
                                                        text: "Delete Notification?",
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

                                                          employeeNotificationController.isDelete.value == true ?
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
                                                              employeeNotificationController.isDelete.value = true;
                                                              employeeNotificationController.isDelete.value = true;
                                                              await employeeNotificationController.deleteSingleNotificationController(notificationId: employeeNotificationController.getEmployeeAllNotificationResponseModel.value.data?.data?[index].sId);
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
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: employeeNotificationController.getEmployeeAllNotificationResponseModel.value.data?.data?.length
              ),),




            ],
          ),
        )),
      ),
    );
  }
}
