import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/planning/controller/get_planing_details_controller.dart';
import 'package:construction_management_app/modules/company_user/planning/view/planing_view.dart';
import 'package:construction_management_app/modules/company_user/planning/widget/view_planing_task/planing_task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class PlaningDetailsView extends StatelessWidget {
  const PlaningDetailsView({super.key,required this.planingId,required this.projectId});


  final String planingId;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    GetPlaningDetailsController getPlaningDetailsController = Get.put(GetPlaningDetailsController(planingId: planingId,projectId: projectId));
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: getPlaningDetailsController.isLoading.value == true  ?
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
                  Get.off(()=>PlaningView(projectId: projectId),preventDuplicates: false);
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
                                  text: "${getPlaningDetailsController.getPlanDetailsResponseModel.value.data?.project?.name} - ${getPlaningDetailsController.getPlanDetailsResponseModel.value.data?.name}",
                                  fontSize: 20,
                                  textColor: AppColors.black38,
                                  fontWeight: FontWeight.w700,
                                ),

                              ],
                            ),
                          ),

                          SpaceHelperClass.h(12.w(context)),

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
                        text: "${DateFormat("MMM d, y , h:mm a").format(DateTime.parse(getPlaningDetailsController.getPlanDetailsResponseModel.value.data?.dueDate).toLocal())}",
                        fontSize: 15,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w500,
                      ),



                      SpaceHelperClass.v(16.h(context)),

                      ...getPlaningDetailsController.taskList.map((item) {
                        return PlaningTaskDetailsWidget().planingTaskDetailsBuilder(
                          context: context,
                          controller: getPlaningDetailsController,
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
