import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/check_list/view/project_detalis_checklist.dart';
import 'package:construction_management_app/modules/day_work/view/project_detalis_day_work.dart';
import 'package:construction_management_app/modules/resources/view/widget/new_equipment_dialog.dart';
import 'package:construction_management_app/modules/resources/view/widget/new_workforce_dailog.dart';
import 'package:construction_management_app/modules/resources/view/widget/project_detalis_resource_card.dart';
import 'package:construction_management_app/modules/resources/view/widget/resources_available_card.dart';
import 'package:construction_management_app/modules/site_diary/view/project_detalis_site.dart';
import 'package:construction_management_app/modules/tomorrow_task/view/project_detalis_planning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetalisResources extends StatefulWidget {
  const ProjectDetalisResources({super.key});

  @override
  State<ProjectDetalisResources> createState() =>
      _ProjectDetalisResourcesState();
}

class _ProjectDetalisResourcesState extends State<ProjectDetalisResources> {
  @override
  Widget build(BuildContext context) {
    //WorkforceController controller = Get.put(WorkforceController());
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
                // Row(
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         CustomTextWidget(
                //           title: "Green Valley School",
                //           color: AppColors.black,
                //           fontWeight: FontWeight.w700,
                //           fontSize: 16,
                //         ),
                //         SizedBox(height: 5),
                //         Row(
                //           children: [
                //             Icon(Icons.location_on, color: AppColors.gray),
                //             SizedBox(width: 5),
                //             CustomTextWidget(
                //               title: "123 Oak St",
                //               color: AppColors.linerColor,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 14,
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // SizedBox(height: 16),
                // Row(
                //   children: [
                //     Expanded(
                //       child: GreenViewCard(
                //         title: 'Timeline',
                //         subTitle: 'May 1, 2025',
                //         text: "to Dec 30, 2025",
                //       ),
                //     ),
                //     SizedBox(width: 20),
                //     Expanded(
                //       child: GreenViewCard(
                //         title: 'Client Name',
                //         subTitle: 'Esther Howard',
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 16),
                // Container(
                //   height: 70,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: AppColors.gray),
                //     borderRadius: BorderRadius.circular(8),
                //     color: AppColors.white,
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //       vertical: 10,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             Image.asset(
                //               AppImages.folder,
                //               height: 40,
                //               width: 40,
                //             ),
                //             SizedBox(width: 15),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 CustomTextWidget(
                //                   title: "Folders",
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 16,
                //                   color: AppColors.black,
                //                 ),
                //                 CustomTextWidget(
                //                   title: "12 folder",
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 14,
                //                   color: AppColors.gray,
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             Get.to(() => AllFolderScreen());
                //           },
                //           child: Icon(Icons.arrow_forward_ios, size: 18),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 16),
                // Card(
                //   color: Colors.white,
                //   child: SizedBox(
                //     height: 290,
                //     width: double.infinity,
                //     child: Padding(
                //       padding: const EdgeInsets.all(12),
                //       child: Column(
                //         children: [
                //           Row(
                //             children: [
                //               CustomTextWidget(
                //                 title: "Team List",
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w500,
                //                 color: AppColors.lightGray,
                //               ),
                //             ],
                //           ),
                //           SizedBox(height: 15),
                //           ResourcesTeamCard(
                //             name: "Wade Warren",
                //             subTile: "Supervisor",
                //             imageUrl: AppImages.darleneprofile,
                //           ),
                //           SizedBox(height: 10),
                //           ResourcesTeamCard(
                //             name: "Jane Cooper",
                //             subTile: "Project Manager",
                //             imageUrl: AppImages.darleneprofile,
                //           ),
                //           SizedBox(height: 18),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               GestureDetector(
                //                 onTap: () {
                //                   Get.to(() => GroupMessage());
                //                 },
                //                 child: CustomContainerTextView(
                //                   image: AppImages.message,
                //                   text: "Message Team",
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisSiteScreen());
                        },
                        child: ProjectDetalisResourcesCard(
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
                        child: ProjectDetalisResourcesCard(
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
                        child: ProjectDetalisResourcesCard(
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
                        onTap: () {},
                        child: ProjectDetalisResourcesCard(
                          image: AppImages.planning,
                          name: "Resources",
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisChecklist());
                        },
                        child: ProjectDetalisResourcesCard(
                          image: AppImages.clock,
                          name: "Checksheet",
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Get.to(() => ProjectDetalisTool());
                    //     },
                    //     child: ProjectDetalisResourcesCard(
                    //       image: AppImages.planning,
                    //       name: "Tools",
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: "Resources",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              title: "Workforce",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    backgroundColor: AppColors.white,
                                    content: NewWorkforceDialog(),
                                  ),
                                );
                              },
                              child: CustomContainerTextView(
                                height: 30,
                                width: 90,
                                image: AppImages.add,
                                text: "Add",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Obx(
                        //   () => ListView.builder(
                        //     itemCount: controller.workforceList.length,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     itemBuilder: (context, index) {
                        //       var workforce = controller.workforceList[index];
                        //       return Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //           vertical: 5,
                        //         ),
                        //         child: ResourcesViewCard(
                        //           image: AppImages.person,
                        //           text: workforce.data?.name ?? "",
                        //           title:
                        //               workforce.data?.quantity.toString() ?? '',
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              title: "Equipment",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    backgroundColor: AppColors.white,
                                    content: NewEquipmentDialog(),
                                  ),
                                );
                              },
                              child: CustomContainerTextView(
                                height: 30,
                                width: 90,
                                image: AppImages.add,
                                text: "Add",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ResourcesAvailableCard(
                  text: '3 Labour,2 Enginner,1 Electrician ',
                  title: 'Available Workforce',
                ),
                SizedBox(height: 10),
                ResourcesAvailableCard(
                  text: '3 Labour,2 Enginner,1 Electrician ',
                  title: 'Available Workforce',
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
