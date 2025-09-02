import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/data/dummy_data.dart';
import 'package:construction_management_app/modules/company_user/check_list/view/project_detalis_checklist.dart';
import 'package:construction_management_app/modules/company_user/message/view/group_message.dart';
import 'package:construction_management_app/modules/company_user/tomorrow_task/view/tomorrow_task_screen.dart';
import 'package:construction_management_app/modules/company_user/tomorrow_task/view/widget/project_detalis_tomorrow_card.dart';
import 'package:construction_management_app/modules/company_user/tomorrow_task/view/widget/tomorrow_task_view_card.dart';
import 'package:construction_management_app/modules/company_user/tomorrow_task/view/widget/tomorrow_team_view.dart';
import 'package:construction_management_app/modules/company_user/tomorrow_task/view/widget/tomorrow_timeline_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProjectDetalisPlanningScreen extends StatefulWidget {
  const ProjectDetalisPlanningScreen({super.key});

  @override
  State<ProjectDetalisPlanningScreen> createState() =>
      _ProjectDetalisPlanningScreenState();
}

class _ProjectDetalisPlanningScreenState
    extends State<ProjectDetalisPlanningScreen> {
  final TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now(); // Default to current date

  @override
  void initState() {
    super.initState();
    // Set initial date in TextField
    _controller.text = DateFormat('dd MMMM, yyyy').format(_selectedDate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to show date picker and update TextField
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
                      child: TomorrowTimelineView(
                        title: 'Timeline',
                        subTitle: 'May 1, 2025',
                        text: "to Dec 30, 2025",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TomorrowTimelineView(
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
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.to(() => AllFolderScreen());
                        //   },
                        //   child: Icon(Icons.arrow_forward_ios, size: 18),
                        // ),
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
                          TomorrowTeamCard(
                            name: "Wade Warren",
                            subTile: "Supervisor",
                            imageUrl: AppImages.darleneprofile,
                          ),
                          SizedBox(height: 10),
                          TomorrowTeamCard(
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
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Get.to(() => ProjectDetalisSiteScreen());
                    //     },
                    //     child: ProjectDetalisTomorrowCard(
                    //       image: AppImages.planning,
                    //       name: "Site Diary",
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Get.to(() => ProjectDetalisDayWorkScreen());
                    //     },
                    //     child: ProjectDetalisTomorrowCard(
                    //       image: AppImages.clock,
                    //       name: "Dayworks",
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: ProjectDetalisTomorrowCard(
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
                    //     child: ProjectDetalisTomorrowCard(
                    //       image: AppImages.planning,
                    //       name: "Resources",
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProjectDetalisChecklist());
                        },
                        child: ProjectDetalisTomorrowCard(
                          image: AppImages.clock,
                          name: "Checksheet",
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Get.to(()=>ProjectDetalisTool());
                    //
                    //     },
                    //     child: ProjectDetalisTomorrowCard(
                    //       image: AppImages.planning,
                    //       name: "Tools",
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  width: 180,
                  child: TextField(
                    controller: _controller,
                    readOnly: true, // Prevent manual text input
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5, left: 8),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month),
                    ),
                    onTap:
                        () => _selectDate(context), // Show date picker on tap
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: "Tomorrow Task",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => TomorrowTaskScreen());
                      },
                      child: CustomTextWidget(
                        title: "See All",
                        color: AppColors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Card(
                  color: Color(0x1893F812),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: CustomTextWidget(
                      title: "Total Tasks 5",
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: DummyData.tomorrowList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = DummyData.tomorrowList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TomorrowTaskViewCard(
                        title: data["title"].toString(),
                        text1: data["text1"].toString(),
                        text2: data["text2"].toString(),
                        text3: data["text3"].toString(),
                        image1: data["image1"].toString(),
                        image2: data["image2"].toString(),
                        text: data["text"].toString(),
                        image: data["image"].toString(),
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
