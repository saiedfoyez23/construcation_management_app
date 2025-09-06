import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/planning/controller/employee_edit_planing_controller.dart';
import 'package:flutter/material.dart';

class EmployeeEditPlaningWidget {

  static Widget employeeEditPlaningProjectSelectionAndDescriptionBuilder({
    required BuildContext context,
    required EmployeeEditPlaningController controller,
  }) {
    return Container(
      width: 375.w(context),
      padding: EdgeInsets.symmetric(
        vertical: 16.vpm(context),
        horizontal: 16.hpm(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r(context)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceHelperClass.v(16.h(context)),

          TextHelperClass.headingText(
            context: context,
            text: "Task Name",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomTextFormFieldClass.build(
            context: context,
            controller: controller.taskController.value,
            hintText: "Enter Log Name",
            borderColor: Color.fromRGBO(229, 231, 235, 1),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.hpm(context),
              vertical: 8.vpm(context),
            ),
            borderRadius: 8,
            keyboardType: TextInputType.text,
          ),

          SpaceHelperClass.v(16.h(context)),

          TextHelperClass.headingText(
            context: context,
            text: "Due Date",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomTextFormFieldClass.build(
            context: context,
            controller: controller.dueDateController.value,
            hintText: "Select A Date",
            borderColor: Color.fromRGBO(229, 231, 235, 1),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.hpm(context),
              vertical: 8.vpm(context),
            ),
            borderRadius: 8,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.vpm(context),
                horizontal: 16.hpm(context),
              ),
              child: ImageHelperClass.customImageContainer(
                context: context,
                height: 24.h(context),
                width: 24.w(context),
                imagePath: AppImages.addSiteDiary,
                imageFit: BoxFit.contain,
                fit: BoxFit.contain,
              ),
            ),
            keyboardType: TextInputType.text,
            readOnly: true,
            onTap: () async {
              await controller.pickDateTime(context: context);
            },
          ),

          SpaceHelperClass.v(16.h(context)),

          TextHelperClass.headingText(
            context: context,
            text: "Due Time",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomTextFormFieldClass.build(
            context: context,
            controller: controller.dueTimeController.value,
            hintText: "Due Time",
            borderColor: Color.fromRGBO(229, 231, 235, 1),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.hpm(context),
              vertical: 8.vpm(context),
            ),
            borderRadius: 8,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.vpm(context),
                horizontal: 16.hpm(context),
              ),
              child: ImageHelperClass.customImageContainer(
                context: context,
                height: 24.h(context),
                width: 24.w(context),
                imagePath: AppImages.clock,
                imageFit: BoxFit.contain,
                fit: BoxFit.contain,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }



}


