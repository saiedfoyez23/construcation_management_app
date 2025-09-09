import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/controller/post_pour_inspection_report_controller.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/create_view/post_pour_inspection_report_first_page_view.dart';
import 'package:construction_management_app/modules/company_user/check_sheet/view/post_pour_inspection_report/create_view/post_pour_inspection_report_third_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PostPourInspectionReportSecondPageView extends StatelessWidget {
  PostPourInspectionReportSecondPageView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    PostPourInspectionReportController postPourInspectionReportController = Get.put(PostPourInspectionReportController(projectId: projectId));
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


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(24.h(context)),


                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.vpm(context),
                          horizontal: 16.hpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Setting Out",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Line / Level / Position",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: postPourInspectionReportController.lineLevelPositionController.value,
                              hintText: "Enter Line / Level / Position",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: postPourInspectionReportController.selectInspection.value == "" ? null : postPourInspectionReportController.selectInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isInspection.value = true;
                                  postPourInspectionReportController.selectInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isInspection.value = false;
                                  postPourInspectionReportController.selectInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: postPourInspectionReportController.commentInspectionController.value,
                              hintText: "Enter comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),
                      ),

                      SpaceHelperClass.v(14.h(context)),


                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.vpm(context),
                          horizontal: 16.hpm(context),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r(context)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Concrete Finish",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(14.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Concrete Finish Type",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: postPourInspectionReportController.selectConcreteFinishTypeInspection.value == "" ?
                              null : postPourInspectionReportController.selectConcreteFinishTypeInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isConcreteFinishTypeInspection.value = true;
                                  postPourInspectionReportController.selectConcreteFinishTypeInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isConcreteFinishTypeInspection.value = false;
                                  postPourInspectionReportController.selectConcreteFinishTypeInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: postPourInspectionReportController.concreteFinishTypeCommentController.value,
                              hintText: "Write Comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),


                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Chamfers,Edging etc",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(10.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Inspection",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomDropdownHelperClass<String>(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              value: postPourInspectionReportController.selectChamfersEdgingInspection.value == "" ?
                              null : postPourInspectionReportController.selectChamfersEdgingInspection.value,
                              items: ['Yes','No'],
                              onChanged: (value) async {
                                if(value == "Yes") {
                                  postPourInspectionReportController.isChamfersEdgingInspection.value = true;
                                  postPourInspectionReportController.selectChamfersEdgingInspection.value = value!;
                                } else {
                                  postPourInspectionReportController.isChamfersEdgingInspection.value = false;
                                  postPourInspectionReportController.selectChamfersEdgingInspection.value = value!;
                                }
                              },
                              hintText: "Select Inspection",
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Comment : ",
                              fontSize: 16,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: postPourInspectionReportController.chamfersEdgingCommentController.value,
                              hintText: "Write Comment",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),




                          ],
                        ),
                      ),


                      SpaceHelperClass.v(35.h(context)),

                      Row(
                        children: [


                          Expanded(
                            child: CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Next",
                              fontSize: 16,
                              textColor: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                              onPressed: () async {
                                if(postPourInspectionReportController.lineLevelPositionController.value.text == "" ||
                                    postPourInspectionReportController.selectInspection.value == "" ||
                                    postPourInspectionReportController.commentInspectionController.value.text == "" ||
                                    postPourInspectionReportController.selectConcreteFinishTypeInspection.value == "" ||
                                    postPourInspectionReportController.concreteFinishTypeCommentController.value.text == "" ||
                                    postPourInspectionReportController.selectChamfersEdgingInspection.value == "" ||
                                    postPourInspectionReportController.chamfersEdgingCommentController.value.text == "") {
                                  kSnackBar(message: "Please fill all fields", bgColor: AppColors.red);
                                } else {
                                  Get.to(()=>PostPourInspectionReportThirdPageView(projectId: projectId));
                                }

                              },
                            ),
                          ),

                          SpaceHelperClass.h(12.w(context)),

                          Expanded(
                            child: CustomButtonHelper.customRoundedButton(
                              context: context,
                              text: "Previous",
                              fontSize: 16,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w600,
                              borderRadius: 8,
                              backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                              borderWidth: 1,
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              onPressed: () {
                                Get.to(()=>PostPourInspectionReportFirstPageView(projectId: projectId));
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
      ),
    );
  }
}
