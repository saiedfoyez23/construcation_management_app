import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/project_details/view/employee_project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeHomeWidgets {

  static Widget profileCard({
    required BuildContext context,
    required String userName,
    required String userRole,
    required String accountType,
    String? profileImageUrl,
    double? width,
  }) {
    return Container(
      width: width ?? 375.w(context),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(15.r(context)),
        border: Border.all(
          color: const Color.fromRGBO(232, 232, 232, 0.7),
          width: 1.w(context),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.hpm(context),
        vertical: 24.vpm(context),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 48.r(context),
                backgroundImage: profileImageUrl != null
                    ? NetworkImage(profileImageUrl)
                    : null,
                backgroundColor: Colors.grey[300],
                child: profileImageUrl == null
                    ? Icon(
                  Icons.person,
                  size: 48.r(context),
                  color: Colors.white,
                )
                    : null,
              ),
              SpaceHelperClass.h(12.w(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHelperClass.headingText(
                      context: context,
                      text: userName,
                      fontSize: 20,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    TextHelperClass.headingText(
                      context: context,
                      text: userRole,
                      fontSize: 16,
                      textColor: AppColors.blue174,
                      fontWeight: FontWeight.w400,
                    ),
                    TextHelperClass.headingText(
                      context: context,
                      text: accountType,
                      fontSize: 14,
                      textColor: AppColors.gray255,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  static Widget projectDetailsCard({
    required BuildContext context,
    required String projectName,
    required String projectAddress,
    required int dailyLogsCount,
    required int dayWorksCount,
    required String projectId,
    String locationIconPath = AppImages.location,
    String logsIconPath = AppImages.addSiteDiary,
    Color backgroundColor = Colors.white,
    Color shadowColor = const Color.fromRGBO(4, 6, 15, 0.05),
    Color statsBackgroundColor = const Color.fromRGBO(242, 243, 245, 1),
    double? width,
    EdgeInsetsGeometry? margin,
    List<String>? images,
  }) {
    return Container(
      width: width,
      margin: margin ?? EdgeInsets.only(bottom: 18.bpm(context)),
      padding: EdgeInsets.symmetric(
        horizontal: 16.hpm(context),
        vertical: 16.vpm(context),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r(context)),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: const Offset(0, 4),
            blurRadius: 60,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Name
          TextHelperClass.headingText(
            context: context,
            text: projectName,
            fontSize: 20,
            textColor: AppColors.black38,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(6.h(context)),

          // Project Address with Location Icon
          Row(
            children: [
              ImageHelperClass.customImageContainer(
                context: context,
                height: 18.h(context),
                width: 18.w(context),
                imagePath: locationIconPath,
                imageFit: BoxFit.contain,
                fit: BoxFit.cover,
              ),

              SpaceHelperClass.h(4.w(context)),

              Expanded(
                child: TextHelperClass.headingText(
                  context: context,
                  text: projectAddress,
                  fontSize: 16,
                  textColor: AppColors.gray107,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          SpaceHelperClass.v(12.h(context)),

          // Stats and View Details Button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Daily Logs Count
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.vpm(context),
                    horizontal: 6.hpm(context),
                  ),
                  decoration: BoxDecoration(
                    color: statsBackgroundColor,
                    borderRadius: BorderRadius.circular(4.r(context)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageHelperClass.customImageContainer(
                        context: context,
                        height: 12.h(context),
                        width: 12.w(context),
                        imagePath: logsIconPath,
                        imageFit: BoxFit.contain,
                        fit: BoxFit.cover,
                      ),
                      SpaceHelperClass.h(8.w(context)),
                      Expanded(
                        child: TextHelperClass.headingText(
                          context: context,
                          text: '$dailyLogsCount daily Logs',
                          fontSize: 14,
                          textColor: AppColors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SpaceHelperClass.h(8.w(context)),

              // Day Works Count
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.vpm(context),
                    horizontal: 6.hpm(context),
                  ),
                  decoration: BoxDecoration(
                    color: statsBackgroundColor,
                    borderRadius: BorderRadius.circular(4.r(context)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 12.r(context),
                        color: const Color.fromRGBO(41, 45, 50, 1),
                      ),
                      SpaceHelperClass.h(8.w(context)),
                      Expanded(
                        child: TextHelperClass.headingText(
                          context: context,
                          text: '$dayWorksCount day work',
                          fontSize: 14,
                          textColor: AppColors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SpaceHelperClass.h(16.w(context)),

              // View Details Button
              if(images == null || images.isEmpty == true) ...[
                Expanded(
                  child: CustomButtonHelper.customTextButton(
                    context: context,
                    fontSize: 14,
                    text: 'View Details →',
                    onPressed: () {
                      Get.off(()=>EmployeeProjectDetailsView(projectId: projectId), preventDuplicates: false,);
                    },
                  ),
                ),
              ] else...[
                SpaceHelperClass.h(45.w(context)),
              ]
            ],
          ),


          if (images != null && images.isNotEmpty) ...[
            SpaceHelperClass.v(12.h(context)),
            SizedBox(
              height: 90.h(context),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (_, __) => SpaceHelperClass.h(8.w(context)),
                itemBuilder: (ctx, i) { 
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5.r(context)),
                    child: Image.network(
                      images[i],
                      width: 120.w(context),
                      height: 90.h(context),
                      fit: BoxFit.cover,
                    ),
                  );
                }
              ),
            ),
            SpaceHelperClass.v(12.h(context)),
            CustomButtonHelper.customTextButton(
              context: context,
              fontSize: 18,
              text: 'View Details →',
              onPressed: () {
                Get.off(()=>EmployeeProjectDetailsView(projectId: projectId), preventDuplicates: false,);
              },
            ),
          ],

        ],
      ),
    );
  }


}