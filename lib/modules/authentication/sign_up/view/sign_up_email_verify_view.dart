import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/authentication/sign_up/controller/sign_up_email_verify_controller.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/custom_widget/custom_snackbar.dart';


class SignUpEmailVerifyView extends StatelessWidget {
  SignUpEmailVerifyView({super.key,required this.email});

  final SignUpEmailVerifyController signUpEmailVerifyController = Get.put(SignUpEmailVerifyController());
  final String email;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,result) {
        Get.off(()=>SignUpView(),preventDuplicates: false);
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
                    Get.off(()=>SignUpView(),preventDuplicates: false);
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
                          text: 'OTP Verification',
                          fontSize: 24,
                          textColor: AppColors.black35,
                          fontWeight: FontWeight.w700,
                        ),

                        SpaceHelperClass.v(24.h(context)),


                        TextHelperClass.headingText(
                          context: context,
                          text: 'Enter 6-digit Code',
                          fontSize: 16,
                          textColor: AppColors.black36,
                          fontWeight: FontWeight.w700,
                        ),

                        SpaceHelperClass.v(4.h(context)),


                        TextHelperClass.headingText(
                          context: context,
                          text: 'We have sent code to ${email} to verify your registration',
                          fontSize: 16,
                          textColor: AppColors.gray145,
                          fontWeight: FontWeight.w400,
                        ),

                        SpaceHelperClass.v(20.h(context)),


                        CustomTextFormFieldClass.otpInputFiledBuild(
                          pinController: signUpEmailVerifyController.pinController.value,
                          context: context,
                          onCompleted: (pin) {
                            print(pin);
                          },
                        ),


                        SpaceHelperClass.v(14.h(context)),


                        signUpEmailVerifyController.timeCounter.value > 0 ?
                        CustomButtonHelper.customRichTextButton(
                          context: context,
                          normalTextColor: Color.fromRGBO(190, 190, 190, 1),
                          highlightedTextColor: Color.fromRGBO(152, 152, 152, 1),
                          normalText: 'Resend code',
                          highlightedText: ' ${signUpEmailVerifyController.timeCounter.value}s',
                          onPressed: null,
                        ) : signUpEmailVerifyController.isResendOtpSend.value == true ?
                        CustomButtonHelper.customRichTextButton(
                          context: context,
                          normalTextColor: Color.fromRGBO(190, 190, 190, 1),
                          highlightedTextColor: Color.fromRGBO(152, 152, 152, 1),
                          normalText: 'Resend code',
                          highlightedText: ' sending...',
                          onPressed: null,
                        ) :
                        CustomButtonHelper.customTextButton(
                          alignment: Alignment.center,
                          height: 30,
                          context: context,
                          text: 'Resend Otp',
                          onPressed: () async {
                            Map<String,dynamic> data = {
                              "email": "${email}"
                            };
                            await signUpEmailVerifyController.signUpResendOtpController(data: data);
                          },
                        ),


                        SpaceHelperClass.v(24.h(context)),

                        signUpEmailVerifyController.isLoading.value == true ?
                        CustomLoaderButton().customLoaderButton(
                          backgroundColor: Colors.transparent,
                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                          height: 50,
                          context: context,
                        ) :
                        CustomButtonHelper.customRoundedButton(
                          context: context,
                          text: 'Verify',
                          backgroundColor: Color.fromRGBO(220, 221, 223, 1),
                          fontWeight: FontWeight.w700,
                          onPressed: () async {
                            if( signUpEmailVerifyController.pinController.value.text == "") {
                              kSnackBar(message: "Please enter full otp", bgColor: AppColors.red);
                            } else {
                              Map<String,dynamic> data = {
                                "email": "${email}",
                                "otp": signUpEmailVerifyController.pinController.value.text,
                                "verify_account": true,
                              };
                              await signUpEmailVerifyController.signUpOtpVerifyController(data: data);
                            }
                          },
                        ),








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
