import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/html_view.dart';
import 'package:construction_management_app/modules/setting/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamsConditionScreen extends StatefulWidget {
  const TeamsConditionScreen({super.key});

  @override
  State<TeamsConditionScreen> createState() => _TeamsConditionScreenState();
}

class _TeamsConditionScreenState extends State<TeamsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Terms & Conditions",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () =>
            controller.isLoading.value == true
                ? Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: HTMLView(htmlData: controller.termsConditions.value),
                  ),
                ),
      ),
    );
  }
}
