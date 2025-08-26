import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/calculator_tools/view/project_detalis_tool.dart';
import 'package:construction_management_app/modules/check_list/view/ducting_report_screen.dart';
import 'package:construction_management_app/modules/check_list/view/widget/check_list_team_card.dart';
import 'package:construction_management_app/modules/check_list/view/widget/check_list_timeline_card.dart';
import 'package:construction_management_app/modules/check_list/view/widget/checklist_inspection_card.dart';
import 'package:construction_management_app/modules/check_list/view/widget/project_detalis_checklist.dart';
import 'package:construction_management_app/modules/day_work/view/project_detalis_day_work.dart';
//import 'package:construction_management_app/modules/folder/view/all_folder_screen.dart';
import 'package:construction_management_app/modules/message/view/group_message.dart';
import 'package:construction_management_app/modules/resources/view/project_detalis_resources.dart';
import 'package:construction_management_app/modules/tomorrow_task/view/project_detalis_planning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetalisChecklist extends StatefulWidget {
  const ProjectDetalisChecklist({super.key});

  @override
  State<ProjectDetalisChecklist> createState() =>
      _ProjectDetalisChecklistState();
}

class _ProjectDetalisChecklistState extends State<ProjectDetalisChecklist> {
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
                      child: CheckListTimelineCard(
                        title: 'Timeline',
                        subTitle: 'May 1, 2025',
                        text: "to Dec 30, 2025",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CheckListTimelineCard(
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
                          CheckListTeamCard(
                            name: "Wade Warren",
                            subTile: "Supervisor",
                            imageUrl: AppImages.darleneprofile,
                          ),
                          SizedBox(height: 10),
                          CheckListTeamCard(
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
                          // Get.to(() => ProjectDetalisSiteScreen());
                        },
                        child: ProjectDetalisChecklistCard(
                          image: AppImages.planning,
                          name: "Site Diary",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisDayWorkScreen());
                        },
                        child: ProjectDetalisChecklistCard(
                          image: AppImages.clock,
                          name: "Dayworks",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisPlanningScreen());
                        },
                        child: ProjectDetalisChecklistCard(
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
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisResources());
                        },
                        child: ProjectDetalisChecklistCard(
                          image: AppImages.planning,
                          name: "Resources",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: ProjectDetalisChecklistCard(
                          image: AppImages.clock,
                          name: "Checksheet",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisTool());
                        },
                        child: ProjectDetalisChecklistCard(
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
                      title: "CheckSheets ",
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspection Report",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => DuctingReportScreen());
                          },
                          child: ChecklistInspectionCard(
                            image: AppImages.file,
                            text: "Drainage/Ducting Report",
                          ),
                        ),
                        SizedBox(height: 8),
                        ChecklistInspectionCard(
                          image: AppImages.file,
                          text: "EXCAVATION / HARDCORE / STONE\nFIL Report",
                        ),
                        SizedBox(height: 8),
                        ChecklistInspectionCard(
                          image: AppImages.file,
                          text: "Drainage/Ducting Report",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
