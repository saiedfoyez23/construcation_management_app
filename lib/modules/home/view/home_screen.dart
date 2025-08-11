import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/create_project/controller/my_project_controller.dart';
import 'package:construction_management_app/modules/create_project/view/all_job_screen.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MyProjectController controller = Get.put(MyProjectController());

  @override
  void initState() {
    super.initState();
    // Fetch projects when the screen initializes
    controller.getMyProject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.background,
        leading: Image.asset(AppImages.siteflow, height: 67, width: 70),
        actionsPadding: const EdgeInsets.all(20),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const SendMessage());
            },
            child: Image.asset(
              AppImages.message,
              height: 18,
              width: 18,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Get.to(() => const NotificationScreen());
            },
            child: Image.asset(
              AppImages.notification,
              height: 18,
              width: 18,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.gray),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              AppImages.darleneprofile,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  title: "Darlene Robertson",
                                  color: AppColors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                                CustomTextWidget(
                                  title: "Company Admin",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blue,
                                ),
                                CustomTextWidget(
                                  title: "Basic Account",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.subText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomButtonWidget(
                        onTap: () {
                          Get.to(() => const SubscriptionScreen());
                        },
                        height: 46,
                        title: "Management Subscription",
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        cardColor: AppColors.linerColor,
                      ),
                    ],
                  ),
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
              Obx(
                () =>
                    controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.myProjectList.isEmpty
                        ? Center(
                          child: CustomTextWidget(
                            title: "No active jobs found",
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                        )
                        : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.myProjectList.isNotEmpty
                                  ? controller
                                          .myProjectList[0]
                                          .data
                                          ?.data
                                          .length ??
                                      0
                                  : 0,
                          itemBuilder: (context, index) {
                            final datum =
                                controller.myProjectList[0].data!.data[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ValleySchoolViewCard(
                                title: datum.name ?? "Unnamed Project",
                                subTitle: datum.location ?? "No Location",
                                text: "${datum.totalSiteDiary ?? 0} daily Log",
                                text1: "${datum.totalDayWork ?? 0} day work",
                                text2: "View Details",
                                // image: datum.dayWorkImages.isNotEmpty
                                //     ? datum.dayWorkImages[0]
                                //     : AppImages.placeholder,
                                onTap: () {
                                  Get.to(
                                    () =>  ProjectDetalisSiteScreen(projectId: datum.id,),
                                  );
                                },
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
