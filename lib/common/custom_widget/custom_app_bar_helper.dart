import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/notification/view/view/notification_view.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomAppBarHelper {

  static Widget authAppBar({
    required BuildContext context,
    required VoidCallback onBackPressed,
    double width = 375,
    double height = 58,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    double borderWidth = 1,
    EdgeInsetsGeometry? padding,
    String backButtonImage = AppImages.arrowImage,
    double backButtonSize = 34,
  }) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      primary: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      toolbarHeight: height.h(context),
      flexibleSpace: Container(
        width: width.w(context),
        height: height.h(context),
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: 20.hpm(context),
          vertical: 12.vpm(context),
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        child: ImageHelperClass.customImageButtonContainer(
          onPressed: onBackPressed,
          context: context,
          height: backButtonSize,
          width: backButtonSize,
          imagePath: backButtonImage,
          imageFit: BoxFit.cover,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget homePageAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100.h(context),
      toolbarHeight: 100.h(context),
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.background,
      leadingWidth: 120.w(context),
      leading: Padding(
        padding: EdgeInsets.only(left: 20.lpm(context)),
        child: ImageHelperClass.customImageContainer(
          context: context,
          height: 67.h(context),
          width: 67.w(context),
          imagePath: AppImages.siteflow,
          imageFit: BoxFit.contain,
          fit: BoxFit.cover,
        ),
      ),
      actionsPadding: const EdgeInsets.all(20),
      actions: [
        ImageHelperClass.customImageButtonContainer(
          context: context,
          height: 42,
          width: 42,
          imagePath: AppImages.messageNotificationCircle,
          imageFit: BoxFit.contain,
          fit: BoxFit.cover,
          onPressed: () {
            Get.off(()=>EmployeeDashboardView(index: 2,),preventDuplicates: false);
          },
        ),
        SpaceHelperClass.h(12.w(context)),
        ImageHelperClass.customImageButtonContainer(
          context: context,
          height: 42,
          width: 42,
          imagePath: AppImages.notificationCircle,
          imageFit: BoxFit.contain,
          fit: BoxFit.cover,
          onPressed: () {
            Get.off(()=>NotificationView(),preventDuplicates: false);
          },
        ),
      ],
      pinned: true,
      floating: false,
    );
  }


  static Widget normalAppBar({
    required BuildContext context,
    required VoidCallback onBackPressed,
    double width = 375,
    double height = 58,
    Color borderColor = const Color.fromRGBO(239, 239, 239, 1),
    double borderWidth = 1,
    EdgeInsetsGeometry? padding,
    String backButtonImage = AppImages.arrowImage,
    double backButtonSize = 34,
    String? title,
    TextStyle? titleStyle,
    bool centerTitle = false,
    Color containerColor = Colors.transparent,
    double fontSize = 20, // Reduced from 24 to match your usage
    Color textColor = const Color.fromRGBO(35, 47, 48, 1),
    FontWeight fontWeight = FontWeight.w700,
    FontStyle fontStyle = FontStyle.normal,
    TextOverflow textOverFlow = TextOverflow.visible,
    double horizontalSpacing = 12, // Added as parameter for flexibility
  }) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      primary: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      toolbarHeight: height.h(context),
      flexibleSpace: Container(
        width: width.w(context),
        height: height.h(context),
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: 20.hpm(context),
          vertical: 12.vpm(context),
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        child: Row(
          children: [
            ImageHelperClass.customImageButtonContainer(
              onPressed: onBackPressed,
              context: context,
              height: backButtonSize,
              width: backButtonSize,
              imagePath: backButtonImage,
              imageFit: BoxFit.cover,
              fit: BoxFit.contain,
            ),
            if (title != null) ...[
              SpaceHelperClass.h(horizontalSpacing.w(context)),
              Expanded(
                child: titleStyle != null ?
                Text(
                  title,
                  style: titleStyle,
                  textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                ) :
                TextHelperClass.headingText(
                  context: context,
                  text: title,
                  textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                  fontSize: fontSize,
                  textColor: textColor,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                  textOverFlow: textOverFlow,
                  containerColor: containerColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

}