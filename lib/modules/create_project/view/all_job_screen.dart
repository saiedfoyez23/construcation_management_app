import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/create_project/controller/my_project_controller.dart';
import 'package:construction_management_app/modules/create_project/view/create_project_screen.dart';
import 'package:construction_management_app/modules/create_project/view/widget/higway_bridge_project_widget.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/site_diary/view/project_detalis_site.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllJobScreen extends StatelessWidget {
  const AllJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProjectController controller = Get.put(MyProjectController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAll(DashboardView(index: 0,));
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    title: "All Jobs",
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const CreateProjectScreen());
                    },
                    child: CustomContainerTextView(
                      width: 120,
                      image: AppImages.add,
                      text: "Create Job",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 42,
                child: CustomTextField(
                  fillColor: AppColors.white,
                  hintText: "Search Project",
                  prefixIcon: Icon(Icons.search, color: AppColors.gray),
                  suffixIcon: Icon(
                    Icons.filter_list_outlined,
                    color: AppColors.gray,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Obx(
                  () =>
                      controller.isLoading.value == true
                          ? const Center(child: CircularProgressIndicator())
                          : controller.myProjectList.isEmpty
                          ? Center(
                            child: CustomTextWidget(
                              title: "No projects found",
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          )
                          : SingleChildScrollView(
                            child: Column(
                              children: [
                                // Static card (optional, remove if not needed)
                                Card(
                                  color: AppColors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 18,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(
                                          title:
                                              controller
                                                  .myProjectList[0]
                                                  .data
                                                  ?.data
                                                  .first
                                                  .name ??
                                              '',
                                          color: AppColors.deepBlack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: AppColors.lightGray,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 2),
                                            CustomTextWidget(
                                              title:
                                                  controller
                                                      .myProjectList[0]
                                                      .data
                                                      ?.data
                                                      .first
                                                      .location ??
                                                  '',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: AppColors.lightGray,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Card(
                                                color: AppColors.gray,
                                                child: SizedBox(
                                                  height: 35,
                                                  width: 130,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.calendar_month,
                                                        size: 15,
                                                      ),
                                                      CustomTextWidget(
                                                        title:
                                                            "${controller.myProjectList[0].data?.data.first.totalSiteDiary.toString() ?? ''} daily Log ",
                                                        color: AppColors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Card(
                                                color: AppColors.gray,
                                                child: SizedBox(
                                                  height: 35,
                                                  width: 130,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.add,
                                                        size: 15,
                                                      ),
                                                      CustomTextWidget(
                                                        title:
                                                            "${controller.myProjectList[0].data?.data.first.totalDayWork.toString() ?? ''} day work ",
                                                        color: AppColors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: SizedBox(
                                                height: 35,
                                                width: 90,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                      () =>
                                                           ProjectDetalisSiteScreen(projectId:  controller
                                                               .myProjectList[0]
                                                               .data
                                                               ?.data
                                                               .first
                                                               .id,),
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      CustomTextWidget(
                                                        title: "View Details",
                                                        color: AppColors.blue,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      const SizedBox(width: 3),
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        size: 15,
                                                        color: AppColors.blue,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                // Dynamic project list
                                ListView.builder(
                                  itemCount:
                                      controller.myProjectList.isNotEmpty
                                          ? controller
                                                  .myProjectList[0]
                                                  .data
                                                  ?.data
                                                  .length ??
                                              0
                                          : 0,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final datum =
                                        controller
                                            .myProjectList[0]
                                            .data!
                                            .data[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: HighwayBridgeProjectWidget(
                                        title: datum.name ?? "Unnamed Project",
                                        subTitle:
                                            datum.location ?? "No Location",
                                        text:
                                            "${datum.totalSiteDiary ?? 0} daily Log",
                                        text1:
                                            "${datum.totalDayWork ?? 0} day work",
                                        text2: "View Details",
                                        image:
                                            datum.dayWorkImages.isNotEmpty
                                                ? datum.dayWorkImages[0]
                                                : AppImages.planning,
                                        image1:
                                            datum.dayWorkImages.length > 1
                                                ? datum.dayWorkImages[1]
                                                : AppImages.planning,
                                        image2:
                                            datum.dayWorkImages.length > 2
                                                ? datum.dayWorkImages[2]
                                                : AppImages.planning,
                                        onTap: () {
                                          Get.to(
                                            () => ProjectDetalisSiteScreen(
                                              projectId: datum.id,
                                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
