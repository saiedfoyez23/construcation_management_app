import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/day_work/controller/get_employee_day_work_details_controller.dart';
import 'package:flutter/material.dart';

class DayEmployeeWorkDetailsTaskDetailsWidget {

  Widget dayEmployeeWorkDetailsTaskDetailsBuilder({
    required BuildContext context,
    required GetEmployeeDayWorkDetailsController controller,
    required EmployeeDayWorkDetailsTask item,
  }) {
    return Container(
      width: 375.w(context),
      margin: EdgeInsets.only(bottom: 8.bpm(context)),
      padding: EdgeInsets.symmetric(
        vertical: 14.vpm(context),
        horizontal: 16.hpm(context),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Task Header with Remove Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextHelperClass.headingText(
                  context: context,
                  text: item.name,
                  fontSize: 24,
                  textColor: Color.fromRGBO(31, 41, 55, 1),
                  fontWeight: FontWeight.w700,
                ),
              ),

              // Remove Task Button
              // _buildRemoveTaskButton(
              //   context: context,
              //   controller: controller,
              //   item: item,
              // ),
            ],
          ),

          SpaceHelperClass.v(14.h(context)),

          // Workforce Section
          _buildWorkforceDetailsSection(
            context: context,
            item: item,
            controller: controller,
          ),

          SpaceHelperClass.v(14.h(context)),

          // Equipment Section
          _buildEquipmentDetailsSection(
            context: context,
            item: item,
            controller: controller,
          ),
        ],
      ),
    );
  }

// Helper Widget for Remove Task Button
  Widget _buildRemoveTaskButton({
    required BuildContext context,
    required GetEmployeeDayWorkDetailsController controller,
    required EmployeeDayWorkDetailsTask item,
  }) {
    return SizedBox(
      width: 74.w(context),
      height: 24.h(context),
      child: OutlinedButton(
        onPressed: () {
          controller.taskList.remove(item);
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 5.hpm(context),
            vertical: 4.vpm(context),
          ),
          side: const BorderSide(
            color: Color.fromRGBO(239, 68, 68, 1),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r(context)),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(74.w(context), 24.h(context)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outlined,
              color: Color.fromRGBO(239, 68, 68, 1),
              size: 16.r(context),
            ),
            Expanded(
              child: TextHelperClass.headingText(
                context: context,
                text: "Remove",
                fontSize: 12,
                textColor: Color.fromRGBO(239, 68, 68, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

// Helper Widget for Workforce Details Section
  Widget _buildWorkforceDetailsSection({
    required BuildContext context,
    required GetEmployeeDayWorkDetailsController controller,
    required EmployeeDayWorkDetailsTask item,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHelperClass.headingText(
          context: context,
          text: "Workforce",
          fontSize: 16,
          textColor: Color.fromRGBO(0, 0, 0, 1),
          fontWeight: FontWeight.w700,
        ),

        SpaceHelperClass.v(10.h(context)),

        ...item.workforce.map((workforceItem) => _buildAddedItem(
          title: '${workforceItem.quantity} ${controller.getEmployeeAllWorkforcesResponseModel.value.data?.where((value)=> value.sId == workforceItem.typeId).first.name}',
          subtitle: '${workforceItem.duration} hour',
          icon: AppImages.workforceIcon,
          onDelete: () {}, // No onDelete callback since it's false in original
          isActionButton: false,
          context: context,
        )),
      ],
    );
  }

// Helper Widget for Equipment Details Section
  Widget _buildEquipmentDetailsSection({
    required BuildContext context,
    required GetEmployeeDayWorkDetailsController controller,
    required EmployeeDayWorkDetailsTask item,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHelperClass.headingText(
          context: context,
          text: "Equipment",
          fontSize: 16,
          textColor: Color.fromRGBO(0, 0, 0, 1),
          fontWeight: FontWeight.w700,
        ),

        SpaceHelperClass.v(10.h(context)),

        ...item.equipment.map((equipmentItem) => _buildAddedItem(
          title: '${equipmentItem.quantity} ${controller.getEmployeeAllEquipmentsResponseModel.value.data?.where((value)=> value.sId == equipmentItem.typeId).first.name}',
          subtitle: '${equipmentItem.duration} hour',
          icon: AppImages.equipmentIcon,
          onDelete: () {}, // No onDelete callback since it's false in original
          isActionButton: false,
          context: context,
        )),
      ],
    );
  }

// Reusable Item Widget (assuming this exists from previous implementation)
  Widget _buildAddedItem({
    required String title,
    required String subtitle,
    required String icon,
    Function()? onDelete,
    bool? isActionButton,
    required BuildContext context,
  }) {
    return Container(
      width: 375.w(context),
      margin: EdgeInsets.only(bottom: 8.bpm(context)),
      padding: EdgeInsets.only(
        top: 9.tpm(context),
        bottom: 9.bpm(context),
        left: 12.lpm(context),
        right: 12.r(context),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFDFDFD), // rgba(253, 253, 253, 1)
        borderRadius: BorderRadius.circular(8.r(context)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          ImageHelperClass.customImageContainer(
            context: context,
            height: 20.h(context),
            width: 20.w(context),
            imagePath: icon,
            imageFit: BoxFit.contain,
            fit: BoxFit.cover,
          ),



          SpaceHelperClass.h(12.w(context)),



          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TextHelperClass.headingText(
                  context: context,
                  text: title,
                  fontSize: 16,
                  textColor: Colors.black, // White text
                  fontWeight: FontWeight.w500,
                ),

                TextHelperClass.headingText(
                  context: context,
                  text: subtitle,
                  fontSize: 14,
                  textColor: Colors.black, // White text
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),

          if(isActionButton == true)...[
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.delete_outlined, color: Colors.red, size: 20),
              onPressed: onDelete,
            ),
          ] else...[
            SizedBox.shrink(),
          ]

        ],
      ),
    );
  }




}