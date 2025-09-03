import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/create_project/model/get_all_project_response_model.dart';
import 'package:construction_management_app/modules/employee_user/home/controller/employee_add_day_work_controller.dart';
import 'package:flutter/material.dart';

class EmployeeAddDayWorkWidget {


  static Widget employeeProjectSelectionAndDescriptionDayWorkBuilder({
    required BuildContext context,
    required EmployeeAddDayWorkController controller,
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
          TextHelperClass.headingText(
            context: context,
            text: "Project Select",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomDropdownHelperClass<EmployeeGetAllProject>(
            value: controller.selectSingleProject.value.name == null ? null : controller.selectSingleProject.value,
            items: controller.employeeGetAllProjectResponseModel.value.data!.data!.toList(),
            onChanged: (value) async {
              controller.selectSingleProject.value = value!;
              controller.isLoading.value = true;
              await controller.getEmployeeProjectDetailsController(projectId: controller.selectSingleProject.value.sId);
              await controller.getEmployeeAllWorkforceController(projectId: controller.selectSingleProject.value.sId);
              await controller.getEmployeeAllEquipmentsController(projectId:  controller.selectSingleProject.value.sId);
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
            hintText: "Select project",
          ),

          SpaceHelperClass.v(16.h(context)),

          TextHelperClass.headingText(
            context: context,
            text: "Day work name",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomTextFormFieldClass.build(
            context: context,
            controller: controller.nameController.value,
            hintText: "name",
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
            text: "Supervisor's Name",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          TextHelperClass.headingText(
            context: context,
            text: controller.getEmployeeProjectDetailsResponseModel.value.data == null ? "" :
            controller.getEmployeeProjectDetailsResponseModel.value.data?.participants?.first.participants?.where((element)=> element.user?.type == "supervisor").first.user?.name,
            fontSize: 15,
            textColor: AppColors.black38,
            fontWeight: FontWeight.w500,
          ),

          SpaceHelperClass.v(16.h(context)),


          Container(
            width: 375.w(context),
            padding: EdgeInsets.symmetric(
              horizontal: 8.hpm(context),
              vertical: 6.vpm(context),
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
                TextHelperClass.headingText(
                  context: context,
                  text: "Description",
                  fontSize: 17,
                  textColor: AppColors.black65,
                  fontWeight: FontWeight.w700,
                ),

                SpaceHelperClass.v(8.h(context)),

                CustomTextFormFieldClass.textFiledWithMaxLineBuild(
                  context: context,
                  controller: controller.descriptionController.value,
                  hintText: "Write something.....",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 9.hpm(context),
                    vertical: 8.vpm(context),
                  ),
                  maxLines: 4,
                  borderRadius: 8,
                  borderColor: Color.fromRGBO(24, 147, 248, 1),
                ),

                SpaceHelperClass.v(16.h(context)),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFieldClass.textFiledWithMaxLineBuild(
                        context: context,
                        controller: controller.audioController.value,
                        maxLines: null,
                        minLines: null,
                        readOnly: true,
                        hintText: 'Ask Something...',
                        keyboardType: TextInputType.text,
                        borderRadius: 8,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpm(context),
                          vertical: 8.vpm(context),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            await controller.speechListen();
                          },
                          icon: Icon(
                            Icons.mic,
                            color: controller.isListening.value == true
                                ? Colors.red
                                : Color.fromRGBO(117, 131, 141, 1),
                            size: 24.r(context),
                          ),
                        ),
                      ),
                    ),

                    SpaceHelperClass.h(8.w(context)),

                    ImageHelperClass.customImageButtonContainer(
                      onPressed: () async {
                        if(controller.audioController.value.text != "") {
                          controller.descriptionController.value.text +=
                          "${controller.audioController.value.text} . ";
                          controller.audioController.value.clear();
                        }
                      },
                      context: context,
                      height: 55,
                      width: 50,
                      borderRadius: BorderRadius.circular(8.r(context)),
                      imagePath: AppImages.sendIcon,
                      imageFit: BoxFit.cover,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SpaceHelperClass.v(16.h(context)),

          TextHelperClass.headingText(
            context: context,
            text: "Date",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomTextFormFieldClass.build(
            context: context,
            controller: controller.dateTimeController.value,
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
            text: "Weather condition",
            fontSize: 17,
            textColor: AppColors.black65,
            fontWeight: FontWeight.w700,
          ),

          SpaceHelperClass.v(8.h(context)),

          CustomTextFormFieldClass.build(
            context: context,
            controller: controller.weatherConditionController.value,
            hintText: "Weather condition",
            borderColor: Color.fromRGBO(229, 231, 235, 1),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.hpm(context),
              vertical: 8.vpm(context),
            ),
            borderRadius: 8,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }



}