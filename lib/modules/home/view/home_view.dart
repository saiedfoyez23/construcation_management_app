import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/create_project/controller/my_project_controller.dart';
import 'package:construction_management_app/modules/create_project/view/all_job_screen.dart';
import 'package:construction_management_app/modules/home/controller/home_controller.dart';
import 'package:construction_management_app/modules/home/view/add_day_work.dart';
import 'package:construction_management_app/modules/home/view/add_site_diary.dart';
import 'package:construction_management_app/modules/home/view/widget/container_view_card.dart';
import 'package:construction_management_app/modules/home/view/widget/valley_school_view_card.dart';
import 'package:construction_management_app/modules/message/view/send_message.dart';
import 'package:construction_management_app/modules/notification/view/notification_screen.dart';
import 'package:construction_management_app/modules/site_diary/view/project_detalis_site.dart';
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
        appBar: AppBar(
          toolbarHeight: 100.h(context),
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.background,
          leadingWidth: 120.w(context),
          leading: Padding(
            padding: EdgeInsets.only(left: 20.lpm(context)),
            child: ImageHelperClass.customImageContainer(
              context: context,
              height: 67.h(context),
              width: 67.w(context),
              imagePath: AppImages.siteflow,
              imageFit: BoxFit.contain,
              fit: BoxFit.cover,
            ),
          ),
          actionsPadding: const EdgeInsets.all(20),
          actions: [
            ImageHelperClass.customImageButtonContainer(
              context: context,
              height: 42,
              width: 42,
              imagePath: AppImages.messageNotificationCircle,
              imageFit: BoxFit.contain,
              fit: BoxFit.cover,
              onPressed: () {
                Get.to(() => const SendMessage());
              },
            ),

            SpaceHelperClass.h(12.w(context)),

            ImageHelperClass.customImageButtonContainer(
              context: context,
              height: 42,
              width: 42,
              imagePath: AppImages.notificationCircle,
              imageFit: BoxFit.contain,
              fit: BoxFit.cover,
              onPressed: () {
                Get.to(() => const NotificationScreen());
              },
            ),

          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: homeController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  width: 375.w(context),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(15.r(context)),
                    border: Border.all(color: Color.fromRGBO(232, 232, 232, 0.7),width: 1.w(context))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.hpm(context),vertical: 24.vpm(context)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [


                      Row(
                        children: [


                          CircleAvatar(
                            radius: 48.r(context),
                            backgroundImage: homeController.profileResponseModel.value.data?.user?.logo != null ?
                            NetworkImage(homeController.profileResponseModel.value.data?.user?.logo) : null, // Set to null if no image URL
                            backgroundColor: Colors.grey[300], // Fallback background color
                            child: homeController.profileResponseModel.value.data?.user?.logo == null ?
                            Icon(
                              Icons.person, // Fallback icon if no image
                              size: 48.r(context),
                              color: Colors.white,
                            ) : null,
                          ),
                  
                  
                          SpaceHelperClass.h(12.w(context)),

                          
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                TextHelperClass.headingText(
                                  context: context,
                                  text: homeController.profileResponseModel.value.data?.user?.name ?? "",
                                  fontSize: 20,
                                  textColor: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                ),


                                TextHelperClass.headingText(
                                  context: context,
                                  text: 'Company Admin',
                                  fontSize: 16,
                                  textColor: AppColors.blue174,
                                  fontWeight: FontWeight.w400,
                                ),


                                TextHelperClass.headingText(
                                  context: context,
                                  text: 'Basic Account',
                                  fontSize: 14,
                                  textColor: AppColors.gray255,
                                  fontWeight: FontWeight.w400,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),

                      SpaceHelperClass.v(18.h(context)),


                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: 'Manage Subscription',
                        fontSize: 17,
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w500,
                        gradientColors: [Color.fromRGBO(38, 50, 56, 1), Color.fromRGBO(28, 59, 71, 1)],
                        onPressed: () async {
                          Get.off(()=>SubscriptionScreen(),preventDuplicates: false);
                        },
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const AddSiteDiary());
                      },
                      child: ContainerViewCard(
                        icon: const Icon(Icons.calendar_month_outlined),
                        text: "Add Site Diary",
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const AddDayWork());
                      },
                      child: ContainerViewCard(
                        icon: const Icon(Icons.watch_later_outlined),
                        text: "Add Dayworks",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: "Active Jobs",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.deepBlack,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const AllJobScreen());
                      },
                      child: CustomTextWidget(
                        title: "See All",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    //final datum = controller.myProjectList[0].data!.data[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ValleySchoolViewCard(
                        title:  "Unnamed Project",
                        subTitle:  "No Location",
                        text: "${0} daily Log",
                        text1: "${0} day work",
                        text2: "View Details",
                        // image: datum.dayWorkImages.isNotEmpty
                        //     ? datum.dayWorkImages[0]
                        //     : AppImages.placeholder,
                        onTap: () {
                          Get.to(() =>  ProjectDetalisSiteScreen(projectId: "",),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
