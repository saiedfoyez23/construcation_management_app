import 'dart:developer';

import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_dropdown_button.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class ConcreatePourSignature extends StatefulWidget {
  const ConcreatePourSignature({super.key});

  @override
  State<ConcreatePourSignature> createState() => _ConcreatePourSignatureState();
}

class _ConcreatePourSignatureState extends State<ConcreatePourSignature> {
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
                      horizontal: 12,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Cast in items",
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Drainage Elements",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 50, child: CustomDropdownButton()),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Write Comment",
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Holding Down Bolts",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 50, child: CustomDropdownButton()),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Write Comment",
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Crack Inducers",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 50, child: CustomDropdownButton()),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Write Comment",
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Waterproofling membrane",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 50, child: CustomDropdownButton()),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Write Comment",
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Others",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Inspector",
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 50, child: CustomDropdownButton()),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Comment:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          fillColor: AppColors.white,
                          hintText: "Write Comment",
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
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
                  title: "Save",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  borderRadius: BorderRadius.circular(8),
                  cardColor: AppColors.blue,
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
