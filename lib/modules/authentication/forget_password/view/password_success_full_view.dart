import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PasswordSuccessFullView extends StatelessWidget {
  const PasswordSuccessFullView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [


              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w(context),
                    vertical: 20.h(context),
                  ),
                  child: Column(
                    children: [

                      SpaceHelperClass.v(100.h(context)),


                      // Icon with background
                      Container(
                        height: 120.h(context),
                        width: 120.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 120.h(context),
                              width: 120.w(context),
                            ),

                            ImageHelperClass.customImageContainer(
                              context: context,
                              height: 82.h(context),
                              width: 82.w(context),
                              imagePath: AppImages.success,
                              fit: BoxFit.cover,
                              imageFit: BoxFit.contain,
                            ),
                            Positioned(
                              top: 59.2.h(context),
                              left: 79.2.w(context),
                              child: ImageHelperClass.customImageContainer(
                                context: context,
                                height: 32.8.h(context),
                                width: 32.8.w(context),
                                imagePath: AppImages.successCheckImage,
                                fit: BoxFit.cover,
                                imageFit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),


                      SpaceHelperClass.v(24.h(context)),

                      TextHelperClass.headingText(
                        alignment: Alignment.center,
                        context: context,
                        text: 'Success',
                        fontSize: 24,
                        textColor: AppColors.black255,
                        fontWeight: FontWeight.w700,
                      ),

                      SpaceHelperClass.v(12.h(context)),

                      TextHelperClass.headingText(
                        alignment: Alignment.center,
                        context: context,
                        text: 'Your password has been successfully reset',
                        fontSize: 16,
                        textColor: AppColors.gray131,
                        fontWeight: FontWeight.w400,
                      ),


                      SpaceHelperClass.v(24.h(context)),


                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: 'Back to Log In',
                        textColor: Color.fromRGBO(38, 50, 56, 1),
                        fontWeight: FontWeight.w700,
                        hasBorder: true,
                        borderColor: Color.fromRGBO(38, 50, 56, 1),
                        borderWidth: 1,
                        onPressed: () {
                          Get.off(()=>SignInView(),preventDuplicates: false);
                        },
                      ),




                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
