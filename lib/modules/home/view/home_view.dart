import 'package:construction_management_app/modules/create_project/view/all_job_view.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/home/controller/home_controller.dart';
import 'package:construction_management_app/modules/home/view/add_day_work_view.dart';
import 'package:construction_management_app/modules/home/view/add_site_diary_view.dart';
import 'package:construction_management_app/modules/home/widget/home_widget/home_widget.dart';
import 'package:construction_management_app/modules/subscription/view/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/common.dart';


class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          child: homeController.isLoading.value == true  ?
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
            child: CustomScrollView(
              slivers: [

                CustomAppBarHelper().homePageAppBar(context),


                SliverToBoxAdapter(
                  child: Column(
                    children: [


                      HomeWidgets.profileCard(
                        context: context,
                        userName: homeController.profileResponseModel.value.data?.user?.name ?? "Guest User",
                        userRole: "Company Admin",
                        accountType: "Basic Account",
                        profileImageUrl: homeController.profileResponseModel.value.data?.user?.logo,
                        onManageSubscriptionPressed: () {
                          Get.off(() => const SubscriptionScreen(), preventDuplicates: false);
                        },
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
                              Get.off(()=>AddSiteDiaryView(), preventDuplicates: false);
                            },
                          ),
                          SpaceHelperClass.h(16.w(context)),

                          CustomButtonHelper.imageTextColumnButton(
                            context: context,
                            imagePath: AppImages.addDayworks,
                            text: "Add Dayworks",
                            onTap: () {
                              Get.off(()=>AddDayWorkView(), preventDuplicates: false);
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
                              Get.off(()=>DashboardView(index: 1),preventDuplicates: false);
                            },
                          ),
                        ],
                      ),

                      SpaceHelperClass.v(18.h(context)),

                      Column(
                        children: List.generate(10, (index) {
                          return HomeWidgets.projectDetailsCard(
                            context: context,
                            projectName: 'Green Valley School',
                            projectAddress: '123 Oak St',
                            dailyLogsCount: 12,
                            dayWorksCount: 23,
                            projectId: "your_project_id_here",
                            images: [
                              "https://picsum.photos/200/120?4",
                              "https://picsum.photos/200/120?5",
                              "https://picsum.photos/200/120?6",
                            ],
                          );
                        }),
                      ),


                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
