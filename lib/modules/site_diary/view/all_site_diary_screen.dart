import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/data/dummy_data.dart';
import 'package:construction_management_app/modules/day_work/view/update_new.dart';
import 'package:construction_management_app/modules/site_diary/view/widget/all_site_view_card.dart';
import 'package:construction_management_app/modules/site_diary/view/widget/filter_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllSiteDiaryScreen extends StatefulWidget {
  const AllSiteDiaryScreen({super.key});

  @override
  State<AllSiteDiaryScreen> createState() => _AllSiteDiaryScreenState();
}

class _AllSiteDiaryScreenState extends State<AllSiteDiaryScreen> {
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
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: "All Site Diary",
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => UpdateNew());
                      },
                      child: CustomContainerTextView(
                        image: AppImages.add,
                        text: "Upload New Log ",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextField(
                  height: 50,
                  hintText: "Search Project...",
                  fillColor: AppColors.white,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          backgroundColor: AppColors.white,
                          content: FilterShowDialog(),
                        ),
                      );
                    },
                    child: Icon(Icons.filter_list_outlined),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: DummyData.allsiteList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = DummyData.allsiteList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AllSiteViewCard(
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
