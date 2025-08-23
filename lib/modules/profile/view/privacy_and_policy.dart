import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dashboard/view/dashboard_view.dart';

class PrivacyAndPolicy extends StatelessWidget {
  PrivacyAndPolicy({super.key});

  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [

              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>DashboardView(index: 4),preventDuplicates: false);
                },
                title: 'Privacy and Policy',
              ),


              SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SpaceHelperClass.v(20.h(context)),

                        Container(
                          width: 375.w(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          alignment: Alignment.center,
                          child: HtmlWidget(
                            '''${profileController.getAllSettingDataResponseModel.value.data?.privacyPolicy ?? "No Privacy and Policy"}''',
                            textStyle: GoogleFonts.albertSans(
                              fontSize: 16.sp(context),
                              color: AppColors.black38,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        )



                      ],
                    ),
                  )
              )

            ],
          ),
        ),
      )),
    );
  }
}
