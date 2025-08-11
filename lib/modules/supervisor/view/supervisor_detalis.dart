import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/message/view/send_message.dart';
import 'package:construction_management_app/modules/supervisor/controller/company_employees_controller.dart';
import 'package:construction_management_app/modules/supervisor/view/employ_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupervisorDetalis extends StatefulWidget {
  const SupervisorDetalis({super.key});

  @override
  State<SupervisorDetalis> createState() => _SupervisorDetalisState();
}

class _SupervisorDetalisState extends State<SupervisorDetalis> {
  @override
  Widget build(BuildContext context) {
    CompanyEmployeesController controller = Get.put(
      CompanyEmployeesController(),
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(EmployListScreen());
          },
        ),
        title: Text('View Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Obx(
          () =>
              controller.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(height: 1),
                      SizedBox(height: 10),
                      Card(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              Card(
                                color: AppColors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 20,
                                  ),
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
                                          SizedBox(width: 16.0),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomTextWidget(
                                                  title:
                                                      controller
                                                          .companyEmployeesList
                                                          .first
                                                          .data
                                                          .first
                                                          .name ??
                                                      '',
                                                  fontSize: 18,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                CustomTextWidget(
                                                  title:
                                                      controller
                                                          .companyEmployeesList
                                                          .first
                                                          .data
                                                          .first
                                                          .name ??
                                                      "Supervisor",
                                                  fontSize: 14,
                                                  color: AppColors.lightGray,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(() => SendMessage());
                                            },
                                            child: Image.asset(
                                              AppImages.message,
                                              color: AppColors.blue,
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: CustomTextWidget(
                                      title: "Active",
                                      color: Colors.green[800],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: CustomTextWidget(
                                      title:
                                          controller
                                              .companyEmployeesList
                                              .first
                                              .data
                                              .first
                                              .employeeId ??
                                          "ID: 79808",
                                      color: Colors.green[800],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Card(
                        color: AppColors.white,
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
                                    title: "Contact Information",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              ListTile(
                                title: CustomTextWidget(
                                  title: "Email",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray,
                                ),
                                leading: Icon(Icons.email, color: Colors.blue),
                                subtitle: CustomTextWidget(
                                  title:
                                      controller
                                          .companyEmployeesList
                                          .first
                                          .data
                                          .first
                                          .email ??
                                      '',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.phone, color: Colors.blue),
                                title: CustomTextWidget(
                                  title: "Phone",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray,
                                ),
                                subtitle: CustomTextWidget(
                                  title:
                                      controller
                                          .companyEmployeesList
                                          .first
                                          .data
                                          .first
                                          .phone ??
                                      '',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
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
