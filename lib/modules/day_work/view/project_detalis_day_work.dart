import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/data/dummy_data.dart';
import 'package:construction_management_app/modules/day_work/view/all_day_work_screen.dart';
import 'package:construction_management_app/modules/day_work/view/widget/day_work_view_card.dart';
import 'package:construction_management_app/modules/day_work/view/widget/green_view_card.dart';
import 'package:construction_management_app/modules/day_work/view/widget/project_detalis_day_card.dart';
import 'package:construction_management_app/modules/day_work/view/widget/team_view_card.dart';
//import 'package:construction_management_app/modules/folder/view/all_folder_screen.dart';
import 'package:construction_management_app/modules/message/view/group_message.dart';
import 'package:construction_management_app/modules/site_diary/view/project_detalis_site.dart';
import 'package:construction_management_app/modules/tomorrow_task/view/project_detalis_planning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetalisDayWorkScreen extends StatefulWidget {
  const ProjectDetalisDayWorkScreen({super.key});

  @override
  State<ProjectDetalisDayWorkScreen> createState() =>
      _ProjectDetalisDayWorkScreenState();
}

class _ProjectDetalisDayWorkScreenState
    extends State<ProjectDetalisDayWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 2),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: "Green Valley School",
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.gray),
                            SizedBox(width: 5),
                            CustomTextWidget(
                              title: "123 Oak St",
                              color: AppColors.linerColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: GreenViewCard(
                        title: 'Timeline',
                        subTitle: 'May 1, 2025',
                        text: "to Dec 30, 2025",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: GreenViewCard(
                        title: 'Client Name',
                        subTitle: 'Esther Howard',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gray),
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImages.folder,
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextWidget(
                                  title: "Folders",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.black,
                                ),
                                CustomTextWidget(
                                  title: "12 folder",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.gray,
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            //Get.to(() => AllFolderScreen());
                          },
                          child: Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Card(
                  color: Colors.white,
                  child: SizedBox(
                    height: 290,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Team List",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightGray,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          TeamViewCard(
                            name: "Wade Warren",
                            subTile: "Supervisor",
                            imageUrl: AppImages.darleneprofile,
                          ),
                          SizedBox(height: 10),
                          TeamViewCard(
                            name: "Jane Cooper",
                            subTile: "Project Manager",
                            imageUrl: AppImages.darleneprofile,
                          ),
                          SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => GroupMessage());
                                },
                                child: CustomContainerTextView(
                                  image: AppImages.message,
                                  text: "Message Team",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisSiteScreen());
                        },
                        child: ProjectDetalisDayCard(
                          image: AppImages.planning,
                          name: "Site Diary",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: ProjectDetalisDayCard(
                          image: AppImages.clock,
                          name: "Daywork",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisPlanningScreen());
                        },
                        child: ProjectDetalisDayCard(
                          image: AppImages.planning,
                          name: "Planning",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Get.to(() => ProjectDetalisResources());
                    //     },
                    //     child: ProjectDetalisDayCard(
                    //       image: AppImages.planning,
                    //       name: "Resources",
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: ProjectDetalisDayCard(
                          image: AppImages.clock,
                          name: "Checksheet",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: ProjectDetalisDayCard(
                          image: AppImages.planning,
                          name: "Tools",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: "Daywork",
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => AllDayWorkScreen());
                      },
                      child: CustomTextWidget(
                        title: "See All",
                        color: AppColors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: DummyData.dayworkList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = DummyData.dayworkList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: DayWorkViewCard(
                        title: data["title"].toString(),
                        text: data["text"].toString(),
                        text1: data["text1"].toString(),
                        text2: data["text2"].toString(),
                        text3: data["text3"].toString(),
                        text4: data["text4"].toString(),
                        image: data["image"].toString(),
                        image1: data["image1"].toString(),
                        image2: data["image2"].toString(),
                        image3: data["image3"].toString(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
