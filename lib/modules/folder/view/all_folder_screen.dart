import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/folder/view/widget/create_folder_dialog.dart';
import 'package:construction_management_app/modules/folder/view/widget/folder_view_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllFolderScreen extends StatefulWidget {
  const AllFolderScreen({super.key});

  @override
  State<AllFolderScreen> createState() => _AllFolderScreenState();
}

class _AllFolderScreenState extends State<AllFolderScreen> {
  static List<Map<String, String>> folder = [
    {
      "image": AppImages.folder,
      "title": "Architectural",
      "subtitle": "12 files",
    },
    {
      "image": AppImages.folder,
      "title": "Architectural",
      "subtitle": "12 files",
    },
    {
      "image": AppImages.folder,
      "title": "Architectural",
      "subtitle": "12 files",
    },
    {
      "image": AppImages.folder,
      "title": "Architectural",
      "subtitle": "12 files",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 5),
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
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    title: "Folders",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          backgroundColor: AppColors.white,
                          content: CreateFolderDialog(),
                        ),
                      );
                    },
                    child: CustomContainerTextView(
                      width: 120,
                      height: 33,
                      text: "Create folder",
                      image: AppImages.add,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomTextField(
                borderRadius: BorderRadius.circular(25),
                fillColor: AppColors.white,
                hintText: "Search Folder...",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: folder.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: FolderViewCard(
                        image: folder[index]['image'].toString(),
                        title: folder[index]['title'].toString(),
                        subtitle: folder[index]['subtitle'].toString(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
