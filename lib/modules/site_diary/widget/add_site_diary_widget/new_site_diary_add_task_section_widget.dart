import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/home/controller/add_day_work_controller.dart';
import 'package:construction_management_app/modules/home/controller/add_site_diary_controller.dart';
import 'package:construction_management_app/modules/home/widget/add_site_diary_widget/add_site_diary_widget.dart';
import 'package:construction_management_app/modules/resources/model/get_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/resources/model/get_all_workforces_response_model.dart';
import 'package:construction_management_app/modules/site_diary/controller/new_site_diary_controller.dart';
import 'package:construction_management_app/modules/site_diary/widget/add_site_diary_widget/new_site_diary_widget.dart';
import 'package:flutter/material.dart';

class NewSiteDiaryAddTaskSectionWidget {

  Widget newSiteDiaryAddTaskSectionBuilder({
    required BuildContext context,
    required NewSiteDiaryController controller,
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
          // Header Row with "Add task" title and button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextHelperClass.headingText(
                  context: context,
                  text: "Add task",
                  fontSize: 24,
                  textColor: Color.fromRGBO(31, 41, 55, 1),
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(
                width: 74.w(context),
                height: 24.h(context),
                child: OutlinedButton(
                  onPressed: () {
                    _handleAddTask(controller: controller);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.hpm(context),
                      vertical: 4.vpm(context),
                    ),
                    side: const BorderSide(
                      color: Color.fromRGBO(24, 147, 248, 1),
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
                        Icons.add,
                        color: Color.fromRGBO(24, 147, 248, 1),
                        size: 16.r(context),
                      ),
                      Expanded(
                        child: TextHelperClass.headingText(
                          context: context,
                          text: "Add task",
                          fontSize: 12,
                          textColor: Color.fromRGBO(24, 147, 248, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SpaceHelperClass.v(12.h(context)),

          // Task Name Section
          TextHelperClass.headingText(
            context: context,
            text: "Task Name",
            fontSize: 17,
            textColor: Color.fromRGBO(75, 85, 99, 1),
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomTextFormFieldClass.build(
            context: context,
            controller: controller.taskNameController.value,
            hintText: "Enter task Name",
            borderColor: Color.fromRGBO(229, 231, 235, 1),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.hpm(context),
              vertical: 8.vpm(context),
            ),
            borderRadius: 8,
            keyboardType: TextInputType.text,
          ),

          SpaceHelperClass.v(12.h(context)),

          // Workforce Section
          _buildWorkforceSection(
            context: context,
            controller: controller,
          ),

          SpaceHelperClass.v(12.h(context)),

          // Equipment Section
          _buildEquipmentSection(
            context: context,
            controller: controller,
          ),
        ],
      ),
    );
  }

// Helper function for Workforce section
  Widget _buildWorkforceSection({
    required BuildContext context,
    required NewSiteDiaryController controller,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.lpm(context),
        right: 16.rpm(context),
        top: 16.tpm(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHelperClass.headingText(
            context: context,
            text: 'Workforce',
            fontSize: 17,
            textColor: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(12.h(context)),

          // Worker and Quantity Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHelperClass.headingText(
                      context: context,
                      text: 'Worker',
                      fontSize: 15,
                      textColor: Color.fromRGBO(75, 85, 99, 1),
                      fontWeight: FontWeight.w700,
                    ),
                    SpaceHelperClass.v(8.h(context)),

                    CustomDropdownHelperClass<GetAllWorkforcesResponse>(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.hpm(context),
                        vertical: 8.vpm(context),
                      ),
                      value: controller.selectedWorkforces.value.name == null ? null : controller.selectedWorkforces.value,
                      items: controller.getAllWorkforcesResponseModel.value.data?.toList() ?? [],
                      onChanged: (value) async {
                        controller.selectedWorkforces.value = value!;
                      },
                      itemBuilder: (value) {
                        return TextHelperClass.headingText(
                          context: context,
                          text: value.name,
                          fontSize: 20.sp(context),
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w700,
                        );
                      },
                      hintText: "Select",
                    ),
                  ],
                ),
              ),
              SpaceHelperClass.h(8.w(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHelperClass.headingText(
                      context: context,
                      text: 'Quantity',
                      fontSize: 15,
                      textColor: Color.fromRGBO(75, 85, 99, 1),
                      fontWeight: FontWeight.w500,
                    ),
                    SpaceHelperClass.v(8.h(context)),
                    _buildQuantityField(
                      context: context,
                      controller: controller.workforceQuantityController.value,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SpaceHelperClass.v(12.h(context)),

          // Duration Field
          TextHelperClass.headingText(
            context: context,
            text: 'Duration',
            fontSize: 15,
            textColor: Color.fromRGBO(75, 85, 99, 1),
            fontWeight: FontWeight.w500,
          ),
          SpaceHelperClass.v(8.h(context)),
          _buildDurationField(
            context: context,
            controller: controller.workForceDurationController.value,
          ),

          SpaceHelperClass.v(16.h(context)),

          // Add Workforce Button
          _buildAddButton(
            context: context,
            text: "Add New",
            onPressed: () {
              _handleAddWorkforce(controller: controller);
            },
          ),

          SpaceHelperClass.v(12.h(context)),

          // Workforce List
          ...controller.workforceList.map((item) => _buildAddedItem(
            title: '${item.quantity} ${controller.getAllWorkforcesResponseModel.value.data?.where((value)=> value.sId == item.typeId).first.name}',
            subtitle: '${item.duration} hour',
            icon: AppImages.workforceIcon,
            onDelete: () {
              controller.workforceList.remove(item);
            },
            isActionButton: true,
            context: context,
          )),
        ],
      ),
    );
  }

// Helper function for Equipment section
  Widget _buildEquipmentSection({
    required BuildContext context,
    required NewSiteDiaryController controller,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.lpm(context),
        right: 16.rpm(context),
        top: 16.tpm(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHelperClass.headingText(
            context: context,
            text: 'Equipment',
            fontSize: 17,
            textColor: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(12.h(context)),

          // Equipment and Quantity Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHelperClass.headingText(
                      context: context,
                      text: 'Select',
                      fontSize: 15,
                      textColor: Color.fromRGBO(75, 85, 99, 1),
                      fontWeight: FontWeight.w500,
                    ),
                    SpaceHelperClass.v(8.h(context)),
                    CustomDropdownHelperClass<GetAllEquipmentsResponse>(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.hpm(context),
                        vertical: 8.vpm(context),
                      ),
                      value: controller.selectedEquipment.value.name == null ? null : controller.selectedEquipment.value,
                      items: controller.getAllEquipmentsResponseModel.value.data?.toList() ?? [],
                      onChanged: (value) async {
                        controller.selectedEquipment.value = value!;
                      },
                      itemBuilder: (value) {
                        return TextHelperClass.headingText(
                          context: context,
                          text: value.name,
                          fontSize: 20.sp(context),
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w700,
                        );
                      },
                      hintText: "Select",
                    ),
                  ],
                ),
              ),
              SpaceHelperClass.h(8.w(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHelperClass.headingText(
                      context: context,
                      text: 'Quantity',
                      fontSize: 15,
                      textColor: Color.fromRGBO(75, 85, 99, 1),
                      fontWeight: FontWeight.w500,
                    ),
                    SpaceHelperClass.v(8.h(context)),
                    _buildQuantityField(
                      context: context,
                      controller: controller.equipmentQuantityController.value,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SpaceHelperClass.v(12.h(context)),

          // Duration Field
          TextHelperClass.headingText(
            context: context,
            text: 'Duration',
            fontSize: 15,
            textColor: Color.fromRGBO(75, 85, 99, 1),
            fontWeight: FontWeight.w500,
          ),
          SpaceHelperClass.v(8.h(context)),

          _buildDurationField(
            context: context,
            controller: controller.equipmentDurationController.value,
          ),

          SpaceHelperClass.v(16.h(context)),

          // Add Equipment Button
          _buildAddButton(
            context: context,
            text: "Add New",
            onPressed: () {
              _handleAddEquipment(controller: controller);
            },
          ),

          SpaceHelperClass.v(12.h(context)),

          // Equipment List
          ...controller.equipmentList.map((item) => _buildAddedItem(
            title: '${item.quantity} ${controller.getAllEquipmentsResponseModel.value.data?.where((value)=> value.sId == item.typeId).first.name}',
            subtitle: '${item.duration} hour',
            icon: AppImages.equipmentIcon,
            onDelete: () {
              controller.equipmentList.remove(item);
            } ,
            isActionButton: true,
            context:context,
          )),
        ],
      ),
    );
  }

// Helper function for quantity field
  Widget _buildQuantityField({
    required BuildContext context,
    required TextEditingController controller,
  }) {
    return CustomTextFormFieldClass.build(
      context: context,
      controller: controller,
      hintText: 'Quantity',
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
          height: 12.h(context),
          width: 12.w(context),
          imagePath: AppImages.arrowSwapIcon,
          imageFit: BoxFit.contain,
          fit: BoxFit.contain,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

// Helper function for duration field
  Widget _buildDurationField({
    required BuildContext context,
    required TextEditingController controller,
  }) {
    return CustomTextFormFieldClass.build(
      context: context,
      controller: controller,
      hintText: 'Duration',
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
          height: 12.h(context),
          width: 12.w(context),
          imagePath: AppImages.arrowSwapIcon,
          imageFit: BoxFit.contain,
          fit: BoxFit.contain,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

// Helper function for add button
  Widget _buildAddButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 375.w(context),
      height: 50.h(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(24, 147, 248, 1),
          padding: EdgeInsets.symmetric(
            horizontal: 8.hpm(context),
            vertical: 6.vpm(context),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r(context)),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(265.w(context), 28.h(context)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.white, size: 16.r(context)),
            SpaceHelperClass.h(8.w(context)),
            TextHelperClass.headingText(
              width: 69.w(context),
              context: context,
              text: text,
              fontSize: 16,
              textColor: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }

// Helper function for added items list
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

// Handler functions
  void _handleAddTask({
    required NewSiteDiaryController controller,
  }) {
    if (controller.taskNameController.value.text.isEmpty) {
      kSnackBar(message: "Enter task name", bgColor: AppColors.red);
    } else if (controller.workforceList.isEmpty) {
      kSnackBar(message: "Add workers", bgColor: AppColors.red);
    } else if (controller.equipmentList.isEmpty) {
      kSnackBar(message: "Add equipment", bgColor: AppColors.red);
    } else {
      controller.taskList.add(
        NewSiteDiaryTask(
          controller.taskNameController.value.text,
          List.from(controller.workforceList),
          List.from(controller.equipmentList),
        ),
      );
      controller.taskNameController.value.clear();
      controller.workforceList.clear();
      controller.equipmentList.clear();
    }
  }

  void _handleAddWorkforce({
    required NewSiteDiaryController controller,
  }) {
    if (controller.selectedWorkforces.value.name == null ||
        controller.workforceQuantityController.value.text.isEmpty ||
        controller.workForceDurationController.value.text.isEmpty) {
      kSnackBar(message: "Please fill all field", bgColor: AppColors.red);
    } else if (controller.selectedWorkforces.value.quantity < int.parse(controller.workforceQuantityController.value.text)) {
      kSnackBar(message: "${controller.selectedWorkforces.value.quantity} ${controller.selectedWorkforces.value.name} is available", bgColor: AppColors.red);
    } else {
      controller.workforceList.add(
        NewSiteDiaryWorkforce(
          controller.selectedWorkforces.value.sId,
          int.parse(controller.workforceQuantityController.value.text),
          int.parse(controller.workForceDurationController.value.text),
        ),
      );
      controller.workforceList.refresh();
      controller.selectedWorkforces.value = GetAllWorkforcesResponse();
      controller.workforceQuantityController.value.clear();
      controller.workForceDurationController.value.clear();
    }
  }

  void _handleAddEquipment({
    required NewSiteDiaryController controller,
  }) {
    if (controller.selectedEquipment.value.name == null ||
        controller.equipmentQuantityController.value.text.isEmpty ||
        controller.equipmentDurationController.value.text.isEmpty) {
      kSnackBar(message: "Please fill all field", bgColor: AppColors.red);
    }  else if (controller.selectedEquipment.value.quantity < int.parse(controller.equipmentQuantityController.value.text)) {
      kSnackBar(message: "${controller.selectedEquipment.value.quantity} ${controller.selectedEquipment.value.name} is available", bgColor: AppColors.red);
    } else {
      controller.equipmentList.add(
        NewSiteDiaryEquipment(
          controller.selectedEquipment.value.sId,
          int.parse(controller.equipmentQuantityController.value.text),
          int.parse(controller.equipmentDurationController.value.text),
        ),
      );
      controller.equipmentList.refresh();
      controller.selectedEquipment.value = GetAllEquipmentsResponse();
      controller.equipmentQuantityController.value.clear();
      controller.equipmentDurationController.value.clear();
    }
  }




}