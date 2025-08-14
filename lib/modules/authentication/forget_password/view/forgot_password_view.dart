import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/authentication/forget_password/controller/forgot_password_controller.dart';
import 'package:construction_management_app/modules/authentication/forget_password/view/email_verify_view.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,result) {
        Get.off(()=>SignInView(),preventDuplicates: false);
      },
      child: Scaffold(
        body: SafeArea(
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
                          text: 'Forget Password',
                          fontSize: 24,
                          textColor: AppColors.black35,
                          fontWeight: FontWeight.w700,
                        ),

                        SpaceHelperClass.v(12.h(context)),

                        TextHelperClass.headingText(
                          context: context,
                          text: 'We will send the OTP code to your phone number for security in forgetting your password', fontSize: 16,
                          textColor: AppColors.gray131,
                          fontWeight: FontWeight.w400,
                        ),

                        SpaceHelperClass.v(24.h(context)),

                        CustomTextFormFieldClass.build(
                          context: context,
                          controller: forgotPasswordController.emailController.value,
                          hintText: 'Enter company email address',
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperClass.v(24.h(context)),


                        CustomButtonHelper.customRoundedButton(
                          context: context,
                          text: 'Send Verification Code',
                          textColor: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w700,
                          gradientColors: [Color.fromRGBO(38, 50, 56, 1), Color.fromRGBO(28, 59, 71, 1)],
                          onPressed: () {
                            Get.off(()=>EmailVerifyView(email: forgotPasswordController.emailController.value.text),preventDuplicates: false);
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
        ),
      ),
    );
  }
}
