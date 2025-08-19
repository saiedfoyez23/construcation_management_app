import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/home/controller/add_site_diary_controller.dart';
import 'package:construction_management_app/modules/home/widget/add_site_diary_widget/add_site_diary_widget.dart';
import 'package:construction_management_app/modules/home/widget/add_site_diary_widget/add_task_section_widget.dart';
import 'package:construction_management_app/modules/home/widget/add_site_diary_widget/image_and_location_widget.dart';
import 'package:construction_management_app/modules/home/widget/add_site_diary_widget/task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddSiteDiaryView  extends StatelessWidget {
  AddSiteDiaryView ({super.key});

  final AddSiteDiaryController addSiteDiaryController = Get.put(AddSiteDiaryController());

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
            child: CustomScrollView(
              slivers: [

                CustomAppBarHelper.normalAppBar(
                  context: context,
                  onBackPressed: () {
                    Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                  },
                  title: 'Upload New',
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SpaceHelperClass.v(24.h(context)),


                        AddSiteDiaryWidget.projectSelectionAndDescriptionBuilder(
                          context: context,
                          controller: addSiteDiaryController,
                        ),

                        SpaceHelperClass.v(24.h(context)),

                        AddTaskSectionWidget().addTaskSectionBuilder(context: context, controller: addSiteDiaryController),

                        SpaceHelperClass.v(24.h(context)),

                        ...addSiteDiaryController.taskList.map((item) {
                          return TaskDetailsWidget().taskDetailsBuilder(
                            context: context,
                            controller: addSiteDiaryController,
                            item: item,
                          );
                        }),


                        ImageAndLocationWidget().imageAndLocationBuilder(context: context, controller: addSiteDiaryController),


                        SpaceHelperClass.v(35.h(context)),


                        Row(
                          children: [


                            Expanded(
                              child: CustomButtonHelper.customRoundedButton(
                                context: context,
                                text: "Save Log",
                                fontSize: 16,
                                textColor: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600,
                                borderRadius: 8,
                                backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                onPressed: () {
                                  Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                },
                              ),
                            ),


                            SpaceHelperClass.h(12.w(context)),

                            Expanded(
                              child: CustomButtonHelper.customRoundedButton(
                                context: context,
                                text: "Cancel",
                                fontSize: 16,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w600,
                                borderRadius: 8,
                                backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                                borderWidth: 1,
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                                onPressed: () {
                                  Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                },
                              ),
                            ),



                          ],
                        ),


                        SpaceHelperClass.v(35.h(context)),



                      ],
                    ),
                  ),
                )

              ],
            )
        )),
      ),
    );
  }

}