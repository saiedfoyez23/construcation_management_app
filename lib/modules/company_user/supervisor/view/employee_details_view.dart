import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/supervisor/controller/employee_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeDetailsView extends StatelessWidget {
  EmployeeDetailsView({super.key,required this.employeeId});

  final String employeeId;

  @override
  Widget build(BuildContext context) {
    final EmployeeDetailsController employeeDetailsController = Get.put(EmployeeDetailsController(employeeId: employeeId));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: employeeDetailsController.isLoading.value == true ?
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
                  Get.off(()=>DashboardView(index: 2),preventDuplicates: false);
                },
                title: 'View Details',
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
                      SpaceHelperClass.v(12.h(context)),
                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.fromLTRB(
                          16.0.lpm(context),
                          16.0.tpm(context),
                          16.0.rpm(context),
                          16.0.bpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0.r(context)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(4, 6, 15, 0.05),
                              blurRadius: 60.0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 375.w(context),
                              padding: EdgeInsets.fromLTRB(16.lpm(context), 12.tpm(context), 16.rpm(context), 12.bpm(context)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r(context)),
                                border: Border.all(
                                  width: 1.w(context),
                                  color: Color(0xFFE5E7EB), // rgba(229, 231, 235, 1)
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40.r(context),
                                    backgroundImage: employeeDetailsController.getSingleEmployeeResponseModel.value.data?.image != null
                                        ? NetworkImage(employeeDetailsController.getSingleEmployeeResponseModel.value.data?.image) : null,
                                    backgroundColor: Colors.grey[300],
                                    child: employeeDetailsController.getSingleEmployeeResponseModel.value.data?.image == null ?
                                    Icon(
                                      Icons.person,
                                      size: 48.r(context),
                                      color: Colors.white,
                                    ) : null,
                                  ),

                                  SpaceHelperClass.h(8.w(context)),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextHelperClass.headingText(
                                          context: context,
                                          text: employeeDetailsController.getSingleEmployeeResponseModel.value.data?.name ?? "",
                                          fontSize: 20,
                                          textColor: AppColors.black38,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        TextHelperClass.headingText(
                                          context: context,
                                          text: employeeDetailsController.getSingleEmployeeResponseModel.value.data?.type ?? "",
                                          fontSize: 15,
                                          textColor: Color.fromRGBO(107, 114, 128, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),

                                  SpaceHelperClass.h(4.w(context)),

                                  ImageHelperClass.customImageButtonContainer(
                                    onPressed: () async {},
                                    context: context,
                                    height: 42.h(context),
                                    width: 42.w(context),
                                    imagePath: AppImages.messageSendIcon,
                                    fit: BoxFit.cover,
                                    imageFit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),

                            SpaceHelperClass.v(12.h(context)),

                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.vpm(context), horizontal: 16.hpm(context)),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(209, 250, 229, 1),
                                      borderRadius: BorderRadius.circular(9999.r(context)),
                                    ),
                                    child: TextHelperClass.headingText(
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      context: context,
                                      text: "Active",
                                      fontSize: 13,
                                      textColor: Color.fromRGBO(6, 95, 70, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.vpm(context), horizontal: 16.hpm(context)),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(24, 147, 248, 0.17),
                                      borderRadius: BorderRadius.circular(9999.r(context)),
                                    ),
                                    child: TextHelperClass.headingText(
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      context: context,
                                      text: "ID: ${employeeDetailsController.getSingleEmployeeResponseModel.value.data?.employeeId ?? ""}",
                                      fontSize: 13,
                                      textColor: Color.fromRGBO(37, 99, 235, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SpaceHelperClass.v(12.h(context)),


                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.fromLTRB(
                          16.0.lpm(context),
                          16.0.tpm(context),
                          16.0.rpm(context),
                          16.0.bpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0.r(context)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(4, 6, 15, 0.05),
                              blurRadius: 60.0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextHelperClass.headingText(
                              context: context,
                              text: 'Contact Information',
                              fontSize: 22,
                              textColor: AppColors.black255,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(12.h(context)),


                            Row(
                              children: [
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24.h(context),
                                  width: 24.w(context),
                                  imagePath: AppImages.emailSendIcon,
                                  fit: BoxFit.cover,
                                  imageFit: BoxFit.contain,
                                ),

                                SpaceHelperClass.h(11.h(context)),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      TextHelperClass.headingText(
                                        context: context,
                                        text: 'Email',
                                        fontSize: 15,
                                        textColor: Color.fromRGBO(107, 114, 128, 1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(height: 4.0),
                                      TextHelperClass.headingText(
                                        context: context,
                                        text: employeeDetailsController.getSingleEmployeeResponseModel.value.data?.email ?? "",
                                        fontSize: 15,
                                        textColor: AppColors.black255,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SpaceHelperClass.v(12.h(context)),

                            Row(
                              children: [
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24.h(context),
                                  width: 24.w(context),
                                  imagePath: AppImages.phoneIcon,
                                  fit: BoxFit.cover,
                                  imageFit: BoxFit.contain,
                                ),

                                SpaceHelperClass.h(11.h(context)),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      TextHelperClass.headingText(
                                        context: context,
                                        text: 'Phone',
                                        fontSize: 15,
                                        textColor: Color.fromRGBO(107, 114, 128, 1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(height: 4.0),
                                      TextHelperClass.headingText(
                                        context: context,
                                        text: employeeDetailsController.getSingleEmployeeResponseModel.value.data?.phone ?? "",
                                        fontSize: 15,
                                        textColor: AppColors.black255,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
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
