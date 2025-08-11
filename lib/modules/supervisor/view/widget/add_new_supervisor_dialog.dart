import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_form_field_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/supervisor/controller/create_employ_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddNewSupervisorDialog extends StatefulWidget {
  const AddNewSupervisorDialog({super.key});

  @override
  State<AddNewSupervisorDialog> createState() => _AddNewSupervisorDialogState();
}

class _AddNewSupervisorDialogState extends State<AddNewSupervisorDialog> {
  @override
  Widget build(BuildContext context) {
    CreateEmployController createEmployController = Get.put(
      CreateEmployController(),
    );
    return Container(
      height: 640,
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextWidget(
                  title: "Add New Supervisor",
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CustomTextWidget(
                  title: "type Employe",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(height: 5),
            CustomTextField(
              controller: createEmployController.type,
              hintText: "Enter Task type",
              fillColor: AppColors.white,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CustomTextWidget(
                  title: "User Name",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(height: 5),
            CustomTextField(
              controller: createEmployController.name,
              hintText: "Enter Task Name",
              fillColor: AppColors.white,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CustomTextWidget(
                  title: "Employe Id",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(height: 5),
            CustomTextField(
              controller: createEmployController.employeeId,
              hintText: "798240",
              fillColor: AppColors.white,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CustomTextWidget(
                  title: "Email",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(height: 5),
            CustomTextField(
              controller: createEmployController.email,
              hintText: "email@example.com",
              fillColor: AppColors.white,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CustomTextWidget(
                  title: "Phone",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(height: 5),
            CustomTextFromFieldWidget(
              controller: createEmployController.phone,
              hintText:
                  "+88012345678", // Updated hint to reflect the expected format
              maxLength: 11, // Restrict input to exactly 11 characters
              keyboardType:
                  TextInputType.phone, // Use phone keyboard for better input
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[+0-9]'),
                ), // Allow only + and digits
              ],
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number cannot be empty';
                } else if (value.length != 11) {
                  return 'Phone number must be exactly 11 characters';
                } else if (!RegExp(r'^\+880\d{8}$').hasMatch(value)) {
                  return 'Phone number must start with +880 followed by 8 digits';
                }
                return null; // Return null if validation passes
              },
              //fillColor: AppColors.white,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CustomTextWidget(
                  title: "Set Password",
                  color: AppColors.linerColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(height: 5),
            CustomTextFromFieldWidget(
              isPassword: true,
              controller: createEmployController.password,
              hintText: "Enter Password",
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null; // Return null if validation passes
              },
              //fillColor: AppColors.white,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomButtonWidget(
                    onTap: () {
                      Get.back();
                    },
                    width: 133,
                    height: 44,
                    title: "Cancel",
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    cardColor: AppColors.gray,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Obx(
                    () =>
                        createEmployController.isLoading.value
                            ? Center(child: CircularProgressIndicator())
                            : CustomButtonWidget(
                              onTap: () {
                                createEmployController.postCreateEmployee(
                                  type: createEmployController.type.text,
                                  name: createEmployController.name.text,
                                  employeeId:
                                      createEmployController.employeeId.text,
                                  email: createEmployController.email.text,
                                  phone: createEmployController.phone.text,
                                  password:
                                      createEmployController.password.text,
                                );
                              },
                              width: 140,
                              height: 44,
                              title: "Add Supervisor",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              cardColor: AppColors.blue,
                            ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
