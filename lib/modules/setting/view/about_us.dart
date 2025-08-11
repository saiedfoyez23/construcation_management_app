import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/html_view.dart';
import 'package:construction_management_app/modules/setting/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
        title: Text("About Us ", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Obx(
        () =>
            controller.isLoading.value == true
                ? Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: HTMLView(htmlData: controller.aboutUs.value),
                  ),
                ),
      ),
    );
  }
}
