import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/data/dummy_data.dart';
import 'package:construction_management_app/modules/company_user/tomorrow_task/view/widget/tomorrow_task_view_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TomorrowTaskScreen extends StatefulWidget {
  const TomorrowTaskScreen({super.key});

  @override
  State<TomorrowTaskScreen> createState() => _TomorrowTaskScreenState();
}

class _TomorrowTaskScreenState extends State<TomorrowTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
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
                Divider(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: "Tomorrow Task",
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: CustomTextWidget(
                          title: "04 April,2025",
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
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
                  ],
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: DummyData.tomorrowList.length,
                  shrinkWrap: true,
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
                        image: data["image"].toString(),
                        text: data["text"].toString(),
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
