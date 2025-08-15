import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_loader.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/create_project/controller/create_project_controller.dart';
import 'package:construction_management_app/modules/create_project/view/widget/add_project_manager_dialog.dart';
import 'package:construction_management_app/modules/create_project/view/widget/add_supervisor_dialog.dart';
import 'package:construction_management_app/modules/create_project/view/widget/supervisor_view_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  @override
  Widget build(BuildContext context) {
    CreateProjectController controller = Get.put(
      CreateProjectController(),
    ); // Use Get.find
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Create Job"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Obx(
            () => controller.isLoading.value ?
            CustomLoaderButton().customLoaderButton(
              backgroundColor: Colors.blue,
              loaderColor: Colors.yellow,
              height: 50,
              context: context,
            ) : Column(
              children: [
                        Card(
                          color: AppColors.white,
                          child: SizedBox(
                            width: double.infinity,
                            height: 380,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        title: "Client Name",
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      controller: controller.clientName,
                                      fillColor: AppColors.white,
                                      hintText: "Enter Task Name",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        title: "Project Name",
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      controller: controller.name,
                                      fillColor: AppColors.white,
                                      hintText: "Enter Project Name",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        title: "Location",
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      controller: controller.location,
                                      fillColor: AppColors.white,
                                      hintText: "Enter Location",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        title: "Timeline",
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 48,
                                    child: CustomTextField(
                                      controller: controller.timeline,
                                      fillColor: AppColors.white,
                                      hintText: "yyyy-mm-day",
                                    ),
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
                            height: 135,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        title: "Add Supervisor",
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Obx(
                                    () =>
                                        controller.selectedSupervisor.value ==
                                                null
                                            ? CustomTextWidget(
                                              title: "No Supervisor Selected",
                                              color: AppColors.lightGray,
                                              fontSize: 14,
                                            )
                                            : Row(
                                              children: [
                                                SupervisorViewCard(
                                                  text:
                                                      controller
                                                          .selectedSupervisor
                                                          .value!
                                                          .name ??
                                                      '',
                                                  image:
                                                      AppImages.darleneprofile,
                                                ),
                                              ],
                                            ),
                                  ),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      controller
                                          .getCompanyEmploye(); // Fetch supervisors before showing dialog
                                      Get.dialog(
                                        AlertDialog(
                                          backgroundColor: AppColors.white,
                                          content: AddSupervisorDialog(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.add, color: AppColors.blue),
                                        CustomTextWidget(
                                          title: "Add Supervisor",
                                          fontSize: 16,
                                          color: AppColors.blue,
                                        ),
                                      ],
                                    ),
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
                            height: 135,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        title: "Add Project Manager",
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Obx(
                                    () =>
                                        controller.selectedManager.value == null
                                            ? CustomTextWidget(
                                              title: "No Supervisor Selected",
                                              color: AppColors.lightGray,
                                              fontSize: 14,
                                            )
                                            : Row(
                                              children: [
                                                SupervisorViewCard(
                                                  text:
                                                      controller
                                                          .selectedManager
                                                          .value!
                                                          .name ??
                                                      '',
                                                  image:
                                                      AppImages.darleneprofile,
                                                ),
                                              ],
                                            ),
                                  ),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      controller.getCompanyEmploye();
                                      Get.dialog(
                                        AlertDialog(
                                          backgroundColor: AppColors.white,
                                          content: AddProjectManagerDialog(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.add, color: AppColors.blue),
                                        CustomTextWidget(
                                          title: "Add Project Manager",
                                          fontSize: 16,
                                          color: AppColors.blue,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomTextWidget(
                                      title: "Note",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                CustomTextField(
                                  height: 100,
                                  maxLines: 8,
                                  controller: controller.note,
                                  fillColor: AppColors.white,
                                  hintText: "Write note",
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Obx(
                          () =>
                              controller.isLoading.value
                                  ? CustomLoaderButton().customLoaderButton(
                                backgroundColor: Colors.blue,
                                loaderColor: Colors.yellow,
                                height: 50,
                                context: context,
                              ) : CustomButtonWidget(
                                    onTap: () {
                                      if (controller.selectedSupervisor.value ==
                                          null) {
                                        Get.snackbar(
                                          'Error',
                                          'Please select a supervisor',
                                        );
                                        return;
                                      }
                                      controller.postCreateProject(
                                        clientname: controller.clientName.text,
                                        name: controller.name.text,
                                        location: controller.location.text,
                                        timeline: controller.timeline.text,
                                        note: controller.note.text,
                                        supervisor:
                                            controller
                                                .selectedSupervisor
                                                .value!
                                                .id
                                                .toString(),
                                        manager:
                                            controller.selectedManager.value!.id
                                                .toString(),
                                      );
                                    },
                                    title: "Create Project",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    cardColor: AppColors.black,
                                  ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
