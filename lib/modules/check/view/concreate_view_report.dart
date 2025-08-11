import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_button.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/check/view/widget/concreate_view_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConcreateViewReport extends StatefulWidget {
  const ConcreateViewReport({super.key});

  @override
  State<ConcreateViewReport> createState() => _ConcreateViewReportState();
}

class _ConcreateViewReportState extends State<ConcreateViewReport> {
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
                      title: "Excavation / Hardcore / Stone Fill Report",
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
                        ConcreateViewCard(
                          text: 'Project',
                          text1: 'Green Valley School ',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'Pour No', text1: '123123'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Pour Date',
                          text1: 'May 10,2025',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Inspection date',
                          text1: 'May 10,2025',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Completion Status',
                          text1: 'Completed',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Drawing/Sketch\nNo. & Revision',
                          text1: '343556',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'GA Drawing',
                          text1: 'ga drawing',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Rebar Drgs',
                          text1: 'rebar drgs',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Temporary Works',
                          text1: 'temporary Work',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Pour Reference',
                          text1: 'refrence',
                        ),
                      ],
                    ),
                  ),
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
                        ConcreateViewCard(text: 'Setting Out', text1: 'Line'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                      ],
                    ),
                  ),
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
                        ConcreateViewCard(text: 'Setting Out', text1: 'Line'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                      ],
                    ),
                  ),
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
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Concrete Finish",
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Concrete Finish Type",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.lightGray,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Chamfers,Edging etc",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.lightGray,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
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
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Cast in items",
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Drainage Elements",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.lightGray,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Holding Down Bolts",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.lightGray,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Waterproofling membrane",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.lightGray,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Others",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.lightGray,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ConcreateViewCard(text: 'Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'CM Inspector', text1: 'Yes'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Comment',
                          text1: 'write comment',
                        ),
                      ],
                    ),
                  ),
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
                        SizedBox(height: 5),
                        ConcreateViewCard(text: 'Comment', text1: 'comment'),
                        SizedBox(height: 5),
                        ConcreateViewCard(
                          text: 'Client Approved',
                          text1: 'comment',
                        ),
                        SizedBox(height: 5),
                        ConcreateViewCard(
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
