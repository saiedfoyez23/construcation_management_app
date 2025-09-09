import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/day_work/controller/new_day_work_controller.dart';
import 'package:flutter/material.dart';

class PostPourInspectionReportWidget {


  Widget postPourInspectionReportWidget({
    required BuildContext context,
    required TextEditingController controller,
    String label = "10 cubic meters of concrete",
    String hintText = "10 cubic meters of concrete",
    void Function()? onTap,
    bool readOnly = false,
    Widget? suffixIcon,
  }) {
    return Container(
      width: 375.w(context),
      padding: EdgeInsets.symmetric(
        horizontal: 12.hpm(context),
        vertical: 12.vpm(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r(context)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(4, 6, 15, 0.05),
            blurRadius: 60,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          TextHelperClass.headingText(
            context: context,
            text: "${label}",
            fontSize: 20,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          // Materials Input Field
          CustomTextFormFieldClass.build(
            context: context,
            onTap: onTap,
            controller: controller,
            hintText: hintText,
            readOnly: readOnly,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 9.hpm(context),
              vertical: 8.vpm(context),
            ),
            borderRadius: 8,
            suffixIcon: suffixIcon,
            borderColor: Color.fromRGBO(229, 231, 235, 1),
          ),
        ],
      ),
    );
  }



}