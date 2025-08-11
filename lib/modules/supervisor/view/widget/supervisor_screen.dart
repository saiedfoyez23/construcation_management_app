import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/supervisor/controller/company_employees_controller.dart';
import 'package:construction_management_app/modules/supervisor/view/supervisor_detalis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupervisorScreen extends StatefulWidget {
  const SupervisorScreen({super.key});

  @override
  State<SupervisorScreen> createState() => _SupervisorScreenState();
}

class _SupervisorScreenState extends State<SupervisorScreen> {
  @override
  Widget build(BuildContext context) {
    CompanyEmployeesController controller = Get.put(
      CompanyEmployeesController(),
    );
    return ListView.builder(
      itemCount: controller.companyEmployeesList.length,
      itemBuilder: (context, index) {
        return Card(
          color: AppColors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.darleneprofile),
              radius: 30,
              backgroundColor: AppColors.white,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title:
                      controller.companyEmployeesList.first.data.first.name ??
                      '',
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextWidget(
                  title:
                      controller.companyEmployeesList.first.data.first.name ??
                      "Supervisor",
                  color: AppColors.lightGray,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outlined, color: Colors.red),
              onPressed: () {
                // Add delete logic here
              },
            ),
            onTap: () {
              Get.to(() => SupervisorDetalis());
            },
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SupervisorDetalis());
                  },
                  child: Row(
                    children: [
                      CustomTextWidget(
                        title: "View Details",
                        color: AppColors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
