import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/authentication/forget_password/controller/new_password_controller.dart';
import 'package:construction_management_app/modules/authentication/forget_password/view/password_success_full_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sign_in/view/sign_in_screen.dart';

class NewPasswordView extends StatelessWidget {
  NewPasswordView({super.key,required this.email});

  final NewPasswordController newPasswordController = Get.put(NewPasswordController());
  final String email;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,result) {
        Get.off(()=>SignInView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 812.h(context),
            width: 375.w(context),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackGroundColor,
            ),
            child: CustomScrollView(
              slivers: [

                CustomAppBarHelper.authAppBar(
                  context: context,
                  onBackPressed: () async {
                    Get.off(()=>SignInView(),preventDuplicates: false);
                  },
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w(context),
                      vertical: 20.h(context),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        SpaceHelperClass.v(24.h(context)),


                        TextHelperClass.headingText(
                          context: context,
                          text: 'Set New Password',
                          fontSize: 24,
                          textColor: AppColors.black35,
                          fontWeight: FontWeight.w700,
                        ),

                        SpaceHelperClass.v(12.h(context)),

                        TextHelperClass.headingText(
                          context: context,
                          text: 'Enter your new password and make sure you remember it',
                          fontSize: 16,
                          textColor: AppColors.gray131,
                          fontWeight: FontWeight.w400,
                        ),

                        SpaceHelperClass.v(16.h(context)),


                        CustomTextFormFieldClass.build(
                          context: context,
                          obscureText: newPasswordController.isObscureText.value,
                          controller: newPasswordController.passwordController.value,
                          hintText: 'Enter Password',
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              if(newPasswordController.isObscureText.value == true) {
                                newPasswordController.isObscureText.value = false;
                              } else {
                                newPasswordController.isObscureText.value = true;
                              }
                            },
                            icon: Icon(
                              newPasswordController.isObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                              color: const Color.fromRGBO(117, 131, 141, 1),
                              size: 24.r(context),
                            ),
                            padding: EdgeInsets.only(right: 16.w(context)),
                          ),
                        ),


                        SpaceHelperClass.v(16.h(context)),



                        CustomTextFormFieldClass.build(
                          context: context,
                          obscureText: newPasswordController.isConfirmObscureText.value,
                          controller: newPasswordController.confirmPasswordController.value,
                          hintText: 'Confirmed Password',
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              if(newPasswordController.isConfirmObscureText.value == true) {
                                newPasswordController.isConfirmObscureText.value = false;
                              } else {
                                newPasswordController.isConfirmObscureText.value = true;
                              }
                            },
                            icon: Icon(
                              newPasswordController.isConfirmObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                              color: const Color.fromRGBO(117, 131, 141, 1),
                              size: 24.r(context),
                            ),
                            padding: EdgeInsets.only(right: 16.w(context)),
                          ),
                        ),


                        SpaceHelperClass.v(24.h(context)),

                        newPasswordController.isLoading.value == true ?
                        CustomLoaderButton().customLoaderButton(
                          backgroundColor: Colors.transparent,
                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                          height: 50,
                          context: context,
                        ) :
                        CustomButtonHelper.customRoundedButton(
                          context: context,
                          text: 'Reset Password',
                          textColor: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w700,
                          gradientColors: [Color.fromRGBO(38, 50, 56, 1), Color.fromRGBO(28, 59, 71, 1)],
                          onPressed: () async {
                            if(newPasswordController.passwordController.value.text == "") {
                              kSnackBar(message: "Please enter password", bgColor: AppColors.red);
                            } else if(newPasswordController.confirmPasswordController.value.text == "") {
                              kSnackBar(message: "Please enter confirm password", bgColor: AppColors.red);
                            } else if(newPasswordController.confirmPasswordController.value.text != newPasswordController.passwordController.value.text) {
                              kSnackBar(message: "Password is not match", bgColor: AppColors.red);
                            } else {
                              Map<String,dynamic> data = {
                                "email": email,
                                "password": newPasswordController.passwordController.value.text
                              };
                              await newPasswordController.setPasswordController(data: data);
                            }
                          },
                        ),


                        SpaceHelperClass.v(24.h(context)),




                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        )),
      ),
    );
  }
}
