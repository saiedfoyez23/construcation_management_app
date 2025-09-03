import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/day_work/controller/day_work_edit_controller.dart';
import 'package:flutter/material.dart';

class EditDayWorkMaterialUsedWidget {


  Widget editDayWorkMaterialsUsedSection({
    required BuildContext context,
    required DayWorkEditController controller,
    String hintText = "10 cubic meters of concrete",
    int maxLines = 3,
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
            text: "Materials Used",
            fontSize: 20,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          // Materials Input Field
          CustomTextFormFieldClass.textFiledWithMaxLineBuild(
            context: context,
            controller: controller.materialUsedController.value,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 9.hpm(context),
              vertical: 8.vpm(context),
            ),
            maxLines: maxLines,
            borderRadius: 8,
            borderColor: Color.fromRGBO(229, 231, 235, 1),
          ),
        ],
      ),
    );
  }



}