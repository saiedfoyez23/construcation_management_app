import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_dropdown_button.dart';
import 'package:construction_management_app/common/custom_widget/custom_loader.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_form_field_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_otp_verify.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/widget/file_choose_view_card.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/widget/logo_file_view_card.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController sameController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add FormKey for validation

  @override
  Widget build(BuildContext context) {
    SignUpController signupController = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey, // Wrap with Form for validation
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.siteflow, height: 87, width: 87),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        title: "Create Your Company\nAccount",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      CustomTextWidget(
                        maxLines: 2,
                        title:
                            "It is quick and easy to log in. Enter your\nemail and password below ",
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: AppColors.lightGray,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CustomDropdownButton(),
                  SizedBox(height: 25),
                  CustomTextFromFieldWidget(
                    hintText: "Enter your name",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name can't be empty";
                      }
                      if (value.length < 2) {
                        return "Name must be at least 2 characters long";
                      }
                      if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value)) {
                        return "Name can only contain letters, spaces, hyphens, or apostrophes";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  CustomTextFromFieldWidget(
                    hintText: "Enter your Company name",
                    controller: companyName,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Company name can't be empty";
                      }
                      if (value.trim().length < 5) {
                        return "Company name must be at least 5 characters long";
                      }
                      if (value.length > 50) {
                        return "Company name can't exceed 50 characters";
                      }
                      if (!RegExp(r"^[a-zA-Z0-9\s&'-.,()]+$").hasMatch(value)) {
                        return "Company name can only contain letters, numbers, spaces, and &'-.,()";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  CustomTextFromFieldWidget(
                    hintText: "Enter Company email address",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email can't be empty";
                      }
                      final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (!emailRegex.hasMatch(value.trim())) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CustomTextWidget(
                        title: 'Logo',
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  FileChooseViewCard(onTap: () {}),
                  SizedBox(height: 20),
                  LogoFileViewCard(onPressed: () {}),
                  SizedBox(height: 25),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      log(phone.completeNumber);
                    },
                  ),
                  SizedBox(height: 25),
                  CustomTextFromFieldWidget(
                    isPassword: true,
                    hintText: "Enter Password",
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password can't be empty";
                      }
                      if (value.trim().length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      if (value.trim().length > 12) {
                        return "Password cannot exceed 12 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  CustomTextFromFieldWidget(
                    isPassword: true,
                    hintText: "Enter Password",
                    controller: sameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password can't be empty";
                      }
                      if (value.trim().length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      if (value.trim().length > 12) {
                        return "Password cannot exceed 12 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 35),
                  Obx(
                    () =>
                        signupController.isLoading.value
                            ? CustomLoaderButton()
                            : CustomButtonWidget(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  signupController
                                      .signupController(
                                        name: nameController.text.trim(),
                                        companyname: companyName.text.trim(),
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                      )
                                      .then((_) {
                                        // Navigate to OtpVerification with signup data
                                        Get.to(
                                          () => SignUpOtpVerification(
                                            name: nameController.text.trim(),
                                            companyName:
                                                companyName.text.trim(),
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          ),
                                        );
                                      });
                                }
                              },
                              title: "Sign Up",
                              cardColor: AppColors.linerColor,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: "Already have an account? ",
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColors.deepBlack,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignInScreen());
                        },
                        child: CustomTextWidget(
                          title: "Sign In",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColors.deepBlack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    nameController.text;
    companyName.text;
    emailController.text;
    passwordController.text;
    sameController.text;
    super.initState();
  }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   companyName.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   sameController.dispose();
  //   super.dispose();
  // }
}
