import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/authentication/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenView extends StatelessWidget {
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h(context),
        width: 375.w(context),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.background2)),
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

                    SpaceHelperClass.v(154.h(context)),

                    TextHelperClass.headingText(
                      context: context,
                      text: 'Master Your Construction Workflow',
                      fontSize: 40,
                      textColor: AppColors.black30,
                      fontWeight: FontWeight.w500,
                    ),


                    SpaceHelperClass.v(10.h(context)),

                    TextHelperClass.headingText(
                      context: context,
                      text: 'Log Tasks, Track Day Works – Plan Efficiently with Ease',
                      fontSize: 16,
                      textColor: AppColors.gray132,
                      fontWeight: FontWeight.w500,
                    ),


                    SpaceHelperClass.v(92.h(context)),


                    CustomButtonHelper.customRoundedButton(
                      context: context,
                      height: 65,
                      text: 'Log In',
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w700,
                      gradientColors: [Color.fromRGBO(38, 50, 56, 1), Color.fromRGBO(28, 59, 71, 1)],
                      onPressed: () {
                        Get.off(()=>SignInView(),preventDuplicates: false);
                      },
                    ),


                    SpaceHelperClass.v(16.h(context)),


                    CustomButtonHelper.customRoundedButton(
                      context: context,
                      height: 65,
                      text: 'Open Account',
                      textColor: AppColors.black16,
                      fontWeight: FontWeight.w700,
                      hasBorder: true,
                      borderColor: AppColors.gray193,
                      borderWidth: 1,
                      onPressed: () {
                        Get.off(()=>SignUpView(),preventDuplicates: false);
                      },
                    ),






                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
