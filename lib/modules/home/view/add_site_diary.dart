import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_drop_down.dart';
import 'package:construction_management_app/common/custom_widget/custom_dropdown_button.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/common/common_container/up_container_view_card.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSiteDiary extends StatefulWidget {
  const AddSiteDiary({super.key});

  @override
  State<AddSiteDiary> createState() => _AddSiteDiaryState();
}

class _AddSiteDiaryState extends State<AddSiteDiary> {
  // Lists to store dynamic entries for workers and equipment
  List<Map<String, dynamic>> workerEntries = [
    {'worker': '', 'quantity': '1', 'duration': '4 hours'},
  ];
  List<Map<String, dynamic>> equipmentEntries = [
    {'equipment': '', 'quantity': '1', 'duration': '4 hours'},
  ];

  // Function to add a new worker entry
  void addWorker() {
    setState(() {
      workerEntries.add({'worker': '', 'quantity': '1', 'duration': '4 hours'});
    });
  }

  // Function to remove a worker entry
  void removeWorker(int index) {
    setState(() {
      if (workerEntries.length > 1) {
        workerEntries.removeAt(index);
      }
    });
  }

  // Function to add a new equipment entry
  void addEquipment() {
    setState(() {
      equipmentEntries.add({
        'equipment': '',
        'quantity': '1',
        'duration': '4 hours',
      });
    });
  }

  // Function to remove an equipment entry
  void removeEquipment(int index) {
    setState(() {
      if (equipmentEntries.length > 1) {
        equipmentEntries.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.background,
        leading: GestureDetector(
          onTap: () {
            Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Update Now"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: AppColors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Project Select",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomDropdownButton(),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Supervisors Name ",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Jane Cooper",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Description",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          height: 80,
                          fillColor: AppColors.white,
                          maxLines: 4,
                          hintText:
                              "Excavation of trench for pipeline along the eastern boundary",
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                fillColor: AppColors.white,
                                prefixIcon: Icon(Icons.mic_none_rounded),
                                hintText: "Ask Something",
                              ),
                            ),
                            SizedBox(width: 10),
                            Card(
                              color: AppColors.blue,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_upward,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Data",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "May 10, 2025",
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Weather condition",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Sunny",
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: AppColors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              title: "Add Task",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            CustomContainerTextView(
                              height: 30,
                              width: 110,
                              border: Border.all(
                                color: AppColors.blue,
                                width: 2,
                              ),
                              image: AppImages.add,
                              text: "Add task",
                              textColor: AppColors.blue,
                              imageColor: AppColors.blue,
                              cardColor: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Task Name",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter task Name",
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Workforce",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: workerEntries.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                            title: "Worker",
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            height: 50,
                                            width: 173,
                                            child: CustomDropdown(
                                              items: ["Worker", "Laborer"],
                                              hintText: "Worker",
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                            title: "Quantity",
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                          SizedBox(height: 10),
                                          CustomTextField(
                                            width: 173,
                                            fillColor: AppColors.white,
                                            hintText:
                                                workerEntries[index]['quantity'],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    CustomTextWidget(
                                      title: "Duration",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                CustomTextField(
                                  fillColor: AppColors.white,
                                  hintText: workerEntries[index]['duration'],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => removeWorker(index),
                                      child: UpContainerViewCard(
                                        text: "Remove",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: addWorker,

                              child: UpContainerViewCard(
                                icon: Icon(Icons.add, color: AppColors.blue),
                                border: Border.all(color: AppColors.blue),
                                text: "Add Worker",
                                color: AppColors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 45),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Equipments",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: equipmentEntries.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                            title: "Select",
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            height: 50,
                                            width: 173,
                                            child: CustomDropdown(
                                              items: ["Worker", "Laborer"],
                                              hintText: "Worker",
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                            title: "Quantity",
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                          SizedBox(height: 10),
                                          CustomTextField(
                                            width: 173,
                                            fillColor: AppColors.white,
                                            hintText:
                                                equipmentEntries[index]['quantity'],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    CustomTextWidget(
                                      title: "Duration",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                CustomTextField(
                                  fillColor: AppColors.white,
                                  hintText: equipmentEntries[index]['duration'],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => removeEquipment(index),
                                      child: UpContainerViewCard(
                                        text: "Remove",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: addEquipment,
                              child: UpContainerViewCard(
                                width: 130,
                                icon: Icon(Icons.add, color: AppColors.blue),
                                border: Border.all(color: AppColors.blue),
                                text: "Add Equipment",
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: AppColors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Site Capture",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: AppColors.gray,
                          child: SizedBox(
                            height: 120,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                  shape: StadiumBorder(),
                                  color: AppColors.blue,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                CustomTextWidget(
                                  title: "Capture Photo",
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              AppImages.adddaily,
                              height: 192,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 15,
                              left: 310,
                              child: Icon(
                                Icons.delete_outlined,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.gray),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: AppColors.black,
                                    ),
                                    SizedBox(width: 10),
                                    CustomTextWidget(
                                      title: "Location",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                CustomTextWidget(
                                  title: "Site 5 , Section A",
                                  color: AppColors.lightGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        CustomButtonWidget(
                          title: "Recapture Photo",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          cardColor: AppColors.blue,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Get.to(() => DairlyLogScreen());
                                },
                                child: CustomButtonWidget(
                                  height: 40,
                                  title: "Save Log",
                                  borderRadius: BorderRadius.circular(8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  cardColor: AppColors.blue,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: CustomButtonWidget(
                                  height: 40,
                                  borderRadius: BorderRadius.circular(8),
                                  title: "Cancel",
                                  color: AppColors.lightGray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  cardColor: AppColors.gray,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
