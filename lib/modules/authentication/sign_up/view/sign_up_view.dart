import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_email_verify_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

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
                        height: 87.h(context),
                        width: 87.w(context),
                        imagePath: AppImages.siteflow,
                      ),

                      SpaceHelperClass.v(20.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: 'Create Your Company Account',
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


                      DropdownHelperClass.customDropdown(
                        context: context,
                        items: signUpController.roles,
                        selectedValue: signUpController.selectedRole.value == "" ? null : signUpController.selectedRole.value,
                        onChanged: (String? newValue) {
                          signUpController.selectedRole.value = newValue!;
                        },
                        hintText: 'Select your role',
                        width: 375,
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      CustomTextFormFieldClass.build(
                        context: context,
                        controller: signUpController.nameController.value,
                        hintText: 'Enter your name',
                        keyboardType: TextInputType.text,
                      ),


                      SpaceHelperClass.v(16.h(context)),

                      CustomTextFormFieldClass.build(
                        context: context,
                        controller: signUpController.companyNameController.value,
                        hintText: 'Enter your company name',
                        keyboardType: TextInputType.text,
                      ),


                      SpaceHelperClass.v(16.h(context)),



                      CustomTextFormFieldClass.build(
                        context: context,
                        controller: signUpController.companyEmailController.value,
                        hintText: 'Enter your Company mail',
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SpaceHelperClass.v(16.h(context)),


                      CustomCompanyLogoPicker.companyLogoPickerBuild(
                        context: context,
                        signUpController: signUpController,
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      CustomTextFormFieldClass.buildIntlPhoneField(
                        context: context,
                        hintText: 'Phone number',
                        controller: signUpController.phoneNumberController.value,
                        initialCountryCode: 'US',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      CustomTextFormFieldClass.build(
                        context: context,
                        obscureText: signUpController.isObscureText.value,
                        controller: signUpController.passwordController.value,
                        hintText: 'Enter Password',
                        keyboardType: TextInputType.text,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if(signUpController.isObscureText.value == true) {
                              signUpController.isObscureText.value = false;
                            } else {
                              signUpController.isObscureText.value = true;
                            }
                          },
                          icon: Icon(
                            signUpController.isObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromRGBO(117, 131, 141, 1),
                            size: 24.r(context),
                          ),
                          padding: EdgeInsets.only(right: 16.w(context)),
                        ),
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      CustomTextFormFieldClass.build(
                        context: context,
                        obscureText: signUpController.isConfirmObscureText.value,
                        controller: signUpController.confirmPasswordController.value,
                        hintText: 'Confirmed Password',
                        keyboardType: TextInputType.text,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if(signUpController.isConfirmObscureText.value == true) {
                              signUpController.isConfirmObscureText.value = false;
                            } else {
                              signUpController.isConfirmObscureText.value = true;
                            }
                          },
                          icon: Icon(
                            signUpController.isConfirmObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromRGBO(117, 131, 141, 1),
                            size: 24.r(context),
                          ),
                          padding: EdgeInsets.only(right: 16.w(context)),
                        ),
                      ),

                      SpaceHelperClass.v(25.h(context)),




                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: 'Sign Up',
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w700,
                        gradientColors: [Color.fromRGBO(38, 50, 56, 1), Color.fromRGBO(28, 59, 71, 1)],
                        onPressed: () {
                          Get.off(()=>SignUpEmailVerifyView(email: signUpController.companyEmailController.value.text,),preventDuplicates: false);
                        },
                      ),


                      SpaceHelperClass.v(25.h(context)),


                      CustomButtonHelper.customRichTextButton(
                        context: context,
                        normalText: 'You don\'t have an account? ',
                        highlightedText: 'Login',
                        onPressed: () {
                          Get.off(()=>SignInScreen(),preventDuplicates: false);
                        },
                      ),

                      SpaceHelperClass.v(25.h(context)),







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
