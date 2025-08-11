import 'dart:developer';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_drop_down.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/check_list/view/view_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class DuctingReportSignature extends StatefulWidget {
  const DuctingReportSignature({super.key});

  @override
  State<DuctingReportSignature> createState() => _DuctingReportSignatureState();
}

class _DuctingReportSignatureState extends State<DuctingReportSignature> {
  final _controller1 = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );
  final _controller2 = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    _controller1.addListener(() => setState(() {}));
    _controller2.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _clearSignature(SignatureController controller) => controller.clear();

  void _submitSignature(SignatureController controller, String logMessage) {
    if (controller.isNotEmpty) {
      controller.toImage();
      log(logMessage);
    }
  }

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
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "pipe haunching / surrounding",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', "No"],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Pipe Type",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', "No"],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Compaction",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', 'No'],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Backfil",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', 'No'],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Thickness",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', 'No'],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Type",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', 'No'],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Marker Tape",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          items: ['Yes', 'No'],
                          hintText: 'Yes',
                          onChanged: (String value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Install By:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: 'Enter Name',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Write Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          height: 80,
                          maxLines: 2,
                          fillColor: AppColors.white,
                          hintText: 'Add additional comments...',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _buildSignatureCard(
                  "Signed on Completion :",
                  _controller1,
                  "First signature submitted",
                ),
                _buildSignatureCard(
                  "Client Approved :",
                  _controller2,
                  "Second signature submitted",
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomButtonWidget(
                        onTap: () {
                          Get.back();
                        },
                        height: 40,
                        title: "Previous",
                        borderRadius: BorderRadius.circular(8),
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        cardColor: AppColors.gray,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CustomButtonWidget(
                        onTap: () {
                          Get.to(() => ViewReportScreen());
                        },
                        height: 40,
                        borderRadius: BorderRadius.circular(8),
                        title: "Save",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        cardColor: AppColors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignatureCard(
    String title,
    SignatureController controller,
    String submitLog,
  ) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextWidget(
                  title: title,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Signature(
              controller: controller,
              height: 100,
              backgroundColor: AppColors.gray,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  width: 100,
                  height: 40,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () => _clearSignature(controller),
                  title: "Clear",
                  color: AppColors.black,
                ),
                CustomButtonWidget(
                  width: 150,
                  height: 40,
                  borderRadius: BorderRadius.circular(5),
                  cardColor: AppColors.blue,
                  onTap: () => _submitSignature(controller, submitLog),
                  title: "Submit Signature",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
