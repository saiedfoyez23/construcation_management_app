// import 'package:construction_management_app/common/app_color/app_color.dart';
// import 'package:construction_management_app/common/app_images/app_images.dart';
// import 'package:construction_management_app/common/common_container/container_view.dart';
// import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
// import 'package:construction_management_app/data/dummy_data.dart';
// import 'package:construction_management_app/modules/create_project/controller/my_project_controller.dart';
// import 'package:construction_management_app/modules/day_work/view/project_detalis_day_work.dart';
// import 'package:construction_management_app/modules/folder/view/all_folder_screen.dart';
// import 'package:construction_management_app/modules/resources/view/project_detalis_resources.dart';
// import 'package:construction_management_app/modules/site_diary/controller/singel_project_controller.dart';
// import 'package:construction_management_app/modules/site_diary/view/all_site_diary_screen.dart';
// import 'package:construction_management_app/modules/site_diary/view/edit_log_screen.dart';
// import 'package:construction_management_app/modules/site_diary/view/widget/project_detalis_card_view.dart';
// import 'package:construction_management_app/modules/site_diary/view/widget/site_diary_card_widget.dart';
// import 'package:construction_management_app/modules/site_diary/view/widget/team_member_card_widget.dart';
// import 'package:construction_management_app/modules/site_diary/view/widget/timeline_view_card.dart';
// import 'package:construction_management_app/modules/tomorrow_task/view/project_detalis_planning.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class ProjectDetalisSiteScreen extends StatefulWidget {
//   final String? projectId;
//   const ProjectDetalisSiteScreen({super.key, this.projectId});
//
//   @override
//   State<ProjectDetalisSiteScreen> createState() =>
//       _ProjectDetalisSiteScreenState();
// }
//
// class _ProjectDetalisSiteScreenState extends State<ProjectDetalisSiteScreen> {
//   final TextEditingController _controller = TextEditingController();
//   DateTime _selectedDate = DateTime.now(); // Default to current date
//
//   final SingleProjectController singleProjectController = Get.put(
//     SingleProjectController(),
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     // Set initial date in TextField
//     _controller.text = DateFormat('dd MMMM, yyyy').format(_selectedDate);
//     singleProjectController.getSingleProject(projectId: widget.projectId!);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   // Function to show date picker and update TextField
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _controller.text = DateFormat('dd MMMM, yyyy').format(_selectedDate);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     MyProjectController controller = Get.put(MyProjectController());
//     var list = controller.myProjectList.first.data?.data.first;
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(backgroundColor: AppColors.white),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Divider(),
//                 SizedBox(height: 2),
//                 Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomTextWidget(
//                           title: list?.name ?? '',
//                           color: AppColors.black,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 16,
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             Icon(Icons.location_on, color: AppColors.green),
//                             SizedBox(width: 5),
//                             CustomTextWidget(
//                               title: list?.location ?? "123 Oak St",
//                               color: AppColors.linerColor,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TimelineViewCard(
//                         title: 'Timeline',
//                         subTitle: list?.createdAt.toString() ?? "May 1, 2025",
//                         //text: "to Dec 30, 2025",
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Expanded(
//                       child: TimelineViewCard(
//                         title: 'Client Name',
//                         subTitle: list?.name ?? "",
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Container(
//                   height: 70,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.gray),
//                     borderRadius: BorderRadius.circular(8),
//                     color: AppColors.white,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 10,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Image.asset(
//                               AppImages.folder,
//                               height: 40,
//                               width: 40,
//                             ),
//                             SizedBox(width: 15),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CustomTextWidget(
//                                   title: "Folders",
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16,
//                                   color: AppColors.black,
//                                 ),
//                                 CustomTextWidget(
//                                   title: "12 folder",
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14,
//                                   color: AppColors.gray,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(() => AllFolderScreen());
//                           },
//                           child: Icon(Icons.arrow_forward_ios, size: 18),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Card(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 15,
//                       vertical: 20,
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             CustomTextWidget(
//                               title: "Team List",
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.lightGray,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         TeamMemberCardWidget(
//                           name: "Wade Warren",
//                           subTile: "Supervisor",
//                           imageUrl: AppImages.darleneprofile,
//                         ),
//                         SizedBox(height: 10),
//                         TeamMemberCardWidget(
//                           name: "Jane Cooper",
//                           subTile: "Project Manager",
//                           imageUrl: AppImages.darleneprofile,
//                         ),
//                         SizedBox(height: 18),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             CustomContainerTextView(
//                               image: AppImages.message,
//                               text: "Message Team",
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 SizedBox(
//                   height: 35,
//                   width: 180,
//                   child: TextField(
//                     controller: _controller,
//                     readOnly: true, // Prevent manual text input
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.only(bottom: 5, left: 8),
//                       border: OutlineInputBorder(),
//                       suffixIcon: Icon(Icons.calendar_month),
//                     ),
//                     onTap:
//                         () => _selectDate(context), // Show date picker on tap
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           //Get.to(() => AllSiteDiaryScreen());
//                         },
//                         child: ProjectDetalisCardView(
//                           image: AppImages.planning,
//                           name: "Site Diary",
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => ProjectDetalisDayWorkScreen());
//                         },
//                         child: ProjectDetalisCardView(
//                           image: AppImages.clock,
//                           name: "Dayworks",
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => ProjectDetalisPlanningScreen());
//                         },
//                         child: ProjectDetalisCardView(
//                           image: AppImages.planning,
//                           name: "Planning",
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.to(() => ProjectDetalisResources());
//                         },
//                         child: ProjectDetalisCardView(
//                           image: AppImages.planning,
//                           name: "Resources",
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: ProjectDetalisCardView(
//                           image: AppImages.clock,
//                           name: "Checksheet",
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {},
//                         child: ProjectDetalisCardView(
//                           image: AppImages.planning,
//                           name: "Tools",
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomTextWidget(
//                       title: "Site Diary",
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Get.to(() => AllSiteDiaryScreen());
//                       },
//                       child: CustomTextWidget(
//                         title: "See All",
//                         color: AppColors.blue,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: DummyData.sitediaryList.length,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     var data = DummyData.sitediaryList[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: SiteDiaryCardWidget(
//                         title: data["title"].toString(),
//                         subTitle: data["subTitle"].toString(),
//                         text: data["text"].toString(),
//                         text1: data["text1"].toString(),
//                         text2: data["text2"].toString(),
//                         text3: data["text3"].toString(),
//                         text4: data["text4"].toString(),
//                         image: data["image"].toString(),
//                         image1: data["image1"].toString(),
//                         image2: data["image2"].toString(),
//                         image3: data["image3"].toString(),
//                         onTap: () {
//                           Get.to(() => EditLogScreen());
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/data/dummy_data.dart';
//import 'package:construction_management_app/modules/folder/view/all_folder_screen.dart';
import 'package:construction_management_app/modules/site_diary/controller/singel_project_controller.dart';
import 'package:construction_management_app/modules/site_diary/view/all_site_diary_screen.dart';
import 'package:construction_management_app/modules/site_diary/view/edit_log_screen.dart';
import 'package:construction_management_app/modules/site_diary/view/widget/project_detalis_card_view.dart';
import 'package:construction_management_app/modules/site_diary/view/widget/site_diary_card_widget.dart';
import 'package:construction_management_app/modules/site_diary/view/widget/team_member_card_widget.dart';
import 'package:construction_management_app/modules/site_diary/view/widget/timeline_view_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProjectDetalisSiteScreen extends StatefulWidget {
  final String? projectId;
  const ProjectDetalisSiteScreen({super.key, this.projectId});

  @override
  State<ProjectDetalisSiteScreen> createState() =>
      _ProjectDetalisSiteScreenState();
}

class _ProjectDetalisSiteScreenState extends State<ProjectDetalisSiteScreen> {
  final TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final SingleProjectController singleProjectController = Get.put(
    SingleProjectController(),
  );

  @override
  void initState() {
    super.initState();
    _controller.text = DateFormat('dd MMMM, yyyy').format(_selectedDate);
    singleProjectController.getSingleProject(projectId: widget.projectId!);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat('dd MMMM, yyyy').format(_selectedDate);
      });
    }
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: Obx(() {
          if (singleProjectController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          final project = singleProjectController.myProject.value;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: project.data?.name ?? 'Skyline Construction',
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: AppColors.green),
                              SizedBox(width: 5),
                              CustomTextWidget(
                                title:
                                    project.data?.location ??
                                    '123 Oak St, New York, NY',
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
                        child: TimelineViewCard(
                          title: 'Timeline',
                          subTitle:
                              project.data?.timeline.toString() ??
                              'May 1, 2025 - Dec 30, 2025',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TimelineViewCard(
                          title: 'Client Name',
                          subTitle: project.data?.clientName ?? 'Acme Corp',
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
                          // GestureDetector(
                          //   onTap: () => Get.to(() => AllFolderScreen()),
                          //   child: Icon(Icons.arrow_forward_ios, size: 18),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
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
                          TeamMemberCardWidget(
                            name: "Wade Warren",
                            subTile: "Supervisor",
                            imageUrl: AppImages.darleneprofile,
                          ),
                          SizedBox(height: 10),
                          TeamMemberCardWidget(
                            name: "Jane Cooper",
                            subTile: "Project Manager",
                            imageUrl: AppImages.darleneprofile,
                          ),
                          SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomContainerTextView(
                                image: AppImages.message,
                                text: "Message Team",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    itemCount: DummyData.list.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      var data = DummyData.list[index];
                      bool isSelected =
                          selectedIndex ==
                          index; // Check if this item is selected
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = isSelected as int;
                          });
                        },
                        child: ProjectDetalisCardView(
                          image: data['image'].toString(),
                          name: data['name'].toString(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    width: 180,
                    child: TextField(
                      controller: _controller,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5, left: 8),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () => Get.to(() => AllSiteDiaryScreen()),
                  //         child: ProjectDetalisCardView(
                  //           image: AppImages.planning,
                  //           name: "Site Diary",
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap:
                  //             () => Get.to(() => ProjectDetalisDayWorkScreen()),
                  //         child: ProjectDetalisCardView(
                  //           image: AppImages.clock,
                  //           name: "Dayworks",
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap:
                  //             () =>
                  //                 Get.to(() => ProjectDetalisPlanningScreen()),
                  //         child: ProjectDetalisCardView(
                  //           image: AppImages.planning,
                  //           name: "Planning",
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 8),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () => Get.to(() => ProjectDetalisResources()),
                  //         child: ProjectDetalisCardView(
                  //           image: AppImages.planning,
                  //           name: "Resources",
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () {},
                  //         child: ProjectDetalisCardView(
                  //           image: AppImages.clock,
                  //           name: "Checksheet",
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () {},
                  //         child: ProjectDetalisCardView(
                  //           image: AppImages.planning,
                  //           name: "Tools",
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        title: "Site Diary",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => AllSiteDiaryScreen()),
                        child: CustomTextWidget(
                          title: "See All",
                          color: AppColors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: DummyData.sitediaryList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = DummyData.sitediaryList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: SiteDiaryCardWidget(
                          title: data["title"].toString(),
                          subTitle: data["subTitle"].toString(),
                          text: data["text"].toString(),
                          text1: data["text1"].toString(),
                          text2: data["text2"].toString(),
                          text3: data["text3"].toString(),
                          text4: data["text4"].toString(),
                          image: data["image"].toString(),
                          image1: data["image1"].toString(),
                          image2: data["image2"].toString(),
                          image3: data["image3"].toString(),
                          onTap: () => Get.to(() => EditLogScreen()),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
