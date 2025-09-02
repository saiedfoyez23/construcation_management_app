import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_button.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/company_user/check_list/view/widget/ducting_report_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewReportScreen extends StatefulWidget {
  const ViewReportScreen({super.key});

  @override
  State<ViewReportScreen> createState() => _ViewReportScreenState();
}

class _ViewReportScreenState extends State<ViewReportScreen> {
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
                  children: [
                    CustomTextWidget(
                      title: "Drainage/Ducting Report",
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 25,
                      top: 12,
                      bottom: 12,
                    ),
                    child: Column(
                      children: [
                        DuctingReportView(
                          text: 'Contract',
                          text1: 'Enter contract number',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Date', text1: 'May 10, 2025'),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Drawing Reference\nIncl Revision',
                          text1: 'rwrwetre',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Location of work',
                          text1: 'Saint Barthélemy',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Saint Barthélemy',
                          text1: 'Completed',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Sub-Contractor',
                          text1: 'rwrwetre',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Bed Type and\nThickness',
                          text1: 'Yes',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Pipe Type', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Line', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Level', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Position', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Gradient', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Pop up dealed off',
                          text1: 'Yes',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Test(Air/Water/\nCCTV/Mandrill)',
                          text1: 'Yes',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Test Certificate\nReference',
                          text1: 'Reference',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Pipe Haunching \nSurrounding',
                          text1: 'Yes',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Compaction', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Backfil', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Thickness', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Type', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Marker type', text1: 'Yes'),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Install By',
                          text1: 'Cody Fisher',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(text: 'Comment', text1: 'comment'),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Client Approved',
                          text1: 'comment',
                        ),
                        SizedBox(height: 5),
                        DuctingReportView(
                          text: 'Signed on\nCompletion',
                          text1: 'comment',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ContainerButton(
                  title: 'Export as pdf',
                  fontWeight: FontWeight.w400,
                  cardColor: AppColors.white,
                  border: Border.all(color: AppColors.red),
                  fontSize: 14,
                  color: AppColors.red,
                  image: AppImages.pdf,
                ),
                SizedBox(height: 15),
                ContainerButton(
                  title: 'Export as Excell',
                  fontWeight: FontWeight.w400,
                  cardColor: AppColors.white,
                  border: Border.all(color: Colors.green),
                  fontSize: 14,
                  color: Colors.green,
                  image: AppImages.excell,
                ),
                SizedBox(height: 10),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
