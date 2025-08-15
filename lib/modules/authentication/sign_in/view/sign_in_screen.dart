import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/authentication/forget_password/view/forgot_password_view.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sign_in_controller.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [

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

                      SpaceHelperClass.v(20.h(context)),

                      ImageHelperClass.customImageContainer(
                        context: context,
                        height: 102.h(context),
                        width: 102.w(context),
                        imagePath: AppImages.siteflow1,
                      ),

                      SpaceHelperClass.v(20.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: 'Sign In to Manage Projects',
                        fontSize: 24,
                        textColor: AppColors.black35,
                        fontWeight: FontWeight.w700,
                      ),


                      SpaceHelperClass.v(10.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: 'It is quick and easy to log in. Enter your email and password below.',
                        fontSize: 16,
                        textColor: AppColors.gray131,
                        fontWeight: FontWeight.w400,
                      ),

                      SpaceHelperClass.v(20.h(context)),


                      // DropdownHelperClass.customDropdown(
                      //   context: context,
                      //   items: signInController.roles,
                      //   selectedValue: signInController.selectedRole.value == "" ? null : signInController.selectedRole.value,
                      //   onChanged: (String? newValue) {
                      //     signInController.selectedRole.value = newValue!;
                      //   },
                      //   hintText: 'Select your role',
                      //   width: 375,
                      // ),


                      //SpaceHelperClass.v(16.h(context)),

                      CustomTextFormFieldClass.build(
                        context: context,
                        controller: signInController.emailController.value,
                        hintText: 'Enter your email address',
                        keyboardType: TextInputType.emailAddress,
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      CustomTextFormFieldClass.build(
                        context: context,
                        obscureText: signInController.isObscureText.value,
                        controller: signInController.passwordController.value,
                        hintText: 'Enter your password Password',
                        keyboardType: TextInputType.text,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if(signInController.isObscureText.value == true) {
                              signInController.isObscureText.value = false;
                            } else {
                              signInController.isObscureText.value = true;
                            }
                          },
                          icon: Icon(
                            signInController.isObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromRGBO(117, 131, 141, 1),
                            size: 24.r(context),
                          ),
                          padding: EdgeInsets.only(right: 16.w(context)),
                        ),
                      ),

                      SpaceHelperClass.v(16.h(context)),


                      CustomButtonHelper.customTextButton(
                        context: context,
                        text: 'Forgot Password?',
                        onPressed: () {
                          Get.off(()=>ForgotPasswordView(),preventDuplicates: false);
                        },
                      ),

                      SpaceHelperClass.v(20.h(context)),

                      // Custom text button

                      signInController.isLoading.value == true ?
                      CustomLoaderButton().customLoaderButton(
                        backgroundColor: Colors.transparent,
                        loaderColor: Color.fromRGBO(38, 50, 56, 1),
                        height: 50,
                        context: context,
                      ) :
                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: 'Log In',
                        backgroundColor: Color.fromRGBO(220, 221, 223, 1),
                        fontWeight: FontWeight.w700,
                        onPressed: () async {
                          if(signInController.emailController.value.text == "") {
                            kSnackBar(message: "Please enter email", bgColor: AppColors.red);
                          } else if(signInController.passwordController.value.text == "") {
                            kSnackBar(message: "Please enter password", bgColor: AppColors.red);
                          } else {
                            await signInController.signInController(
                              email: signInController.emailController.value.text,
                              password: signInController.passwordController.value.text,
                            );
                          }
                          print('Login button pressed');
                          // Add your login logic here
                        },
                      ),


                      SpaceHelperClass.v(20.h(context)),

                      CustomButtonHelper.customRichTextButton(
                        context: context,
                        normalText: 'You don\'t have an account? ',
                        highlightedText: 'Sign Up',
                        onPressed: () {
                          Get.off(()=>SignUpView(),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperClass.v(20.h(context)),

                    ],
                  ),
                ),
              )


            ],
          ),
        )),
      ),
    );
  }
}