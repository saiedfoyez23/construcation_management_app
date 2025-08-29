import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/home/controller/home_controller.dart';
import 'package:construction_management_app/modules/home/view/add_day_work_view.dart';
import 'package:construction_management_app/modules/home/view/add_site_diary_view.dart';
import 'package:construction_management_app/modules/home/widget/home_widget/home_widget.dart';
import 'package:construction_management_app/modules/subscription/view/subscription_view.dart';
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
            child: RefreshIndicator(
              onRefresh: () async {
                Get.off(DashboardView(index: 0),preventDuplicates: false);
              },
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
                            Get.off(()=>SubscriptionView(isHome: true),preventDuplicates: false);
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

                        homeController.getAllProjectResponseModel.value.data?.data?.isEmpty == true ||
                            homeController.getAllProjectResponseModel.value.data?.data == null ?
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
                          children: List.generate(homeController.getAllProjectResponseModel.value.data!.data!.length, (index) {
                            return HomeWidgets.projectDetailsCard(
                              context: context,
                              projectName: homeController.getAllProjectResponseModel.value.data?.data?[index].name ?? "",
                              projectAddress: homeController.getAllProjectResponseModel.value.data?.data?[index].location ?? "",
                              dailyLogsCount: homeController.getAllProjectResponseModel.value.data?.data?[index].totalSiteDiary ?? "",
                              dayWorksCount: homeController.getAllProjectResponseModel.value.data?.data?[index].totalDayWork ?? "",
                              projectId: homeController.getAllProjectResponseModel.value.data?.data?[index].sId,
                              images: homeController.getAllProjectResponseModel.value.data?.data?[index].dayWorkImages,
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
