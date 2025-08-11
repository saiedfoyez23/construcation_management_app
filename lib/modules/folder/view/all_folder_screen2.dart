import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/folder/view/widget/architectural_view_card.dart';
import 'package:construction_management_app/modules/folder/view/widget/edit_folder_dialog.dart';
import 'package:construction_management_app/modules/folder/view/widget/upload_file_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllFolderScreen2 extends StatefulWidget {
  const AllFolderScreen2({super.key});

  @override
  State<AllFolderScreen2> createState() => _AllFolderScreen2State();
}

class _AllFolderScreen2State extends State<AllFolderScreen2> {
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
                    title: "All Files",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          backgroundColor: AppColors.white,
                          content: UploadFileDialog(),
                        ),
                      );
                    },
                    child: CustomContainerTextView(
                      width: 120,
                      height: 30,
                      text: "Upload New",
                      image: AppImages.add,
                      imageColor: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
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
                          Image.asset(AppImages.folder, height: 40, width: 40),
                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                title: "Architectural",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.black,
                              ),
                              CustomTextWidget(
                                title: "12 files",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.linerColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.dialog(
                            AlertDialog(
                              backgroundColor: AppColors.white,
                              content: EditFolderDialog(),
                            ),
                          );
                        },
                        child: Image.asset(
                          AppImages.linedit,
                          height: 24,
                          width: 24,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ArchitecturalViewCard(),
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
