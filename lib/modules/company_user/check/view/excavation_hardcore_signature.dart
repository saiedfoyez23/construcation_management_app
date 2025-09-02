import 'dart:developer';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_dropdown_button.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class ExcavationHardcoreSignature extends StatefulWidget {
  const ExcavationHardcoreSignature({super.key});

  @override
  State<ExcavationHardcoreSignature> createState() =>
      _ExcavationHardcoreSignatureState();
}

class _ExcavationHardcoreSignatureState
    extends State<ExcavationHardcoreSignature> {
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
                Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 10),
                    CustomTextWidget(
                      title: "Excavation / Hardcore / Stone Fill Report",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.text,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(thickness: 2),
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
                              title: "Contract:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          hintText: "Enter contract number",
                          fillColor: AppColors.white,
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
                              title: "Date:                            ",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          hintText: "May 10, 2025",
                          fillColor: AppColors.white,
                          suffixIcon: Icon(Icons.calendar_month),
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
                              title: "Drawing Reference  Incl Revision:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Enter drawing  reference",
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
                              title: "Revision:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          hintText: "Enter drawing  reference",
                          fillColor: AppColors.white,
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
                              title: "Location of work:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          hintText: "Enter work  location",
                          fillColor: AppColors.white,
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
                              title: "Completion Status:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdownButton(),
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
                              title: "Sub-Contractor:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: 'Enter sub-contractor',
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
                              title: "Compliance Check:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdownButton(),
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
                              title: "Check for Underground Services:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomDropdownButton(),
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
                CustomButtonWidget(
                  onTap: () {
                    //Get.to(() => DuctingReportSignature());
                  },
                  height: 40,
                  borderRadius: BorderRadius.circular(8),
                  title: "Save",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  cardColor: AppColors.blue,
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
