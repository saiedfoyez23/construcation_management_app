import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/home/controller/add_site_diary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AddSiteDiaryView  extends StatelessWidget {
  AddSiteDiaryView ({super.key});

  final AddSiteDiaryController addSiteDiaryController = Get.put(AddSiteDiaryController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
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
                    Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                  },
                  title: 'Upload New',
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SpaceHelperClass.v(24.h(context)),

                        Container(
                          width: 375.w(context),
                          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
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
                                fontSize: 20,
                                textColor: AppColors.black65,
                                fontWeight: FontWeight.w700,
                              ),


                              SpaceHelperClass.v(8.h(context)),


                              CustomDropdownHelperClass<String>(
                                value: addSiteDiaryController.project.value == "" ? null : addSiteDiaryController.project.value,
                                items:  addSiteDiaryController.projects,
                                onChanged: (value) {
                                  addSiteDiaryController.project.value = value!;
                                },
                                hintText: "Select project",
                              ),

                              SpaceHelperClass.v(16.h(context)),


                              TextHelperClass.headingText(
                                context: context,
                                text: "Supervisor\'s Name",
                                fontSize: 20,
                                textColor: AppColors.black65,
                                fontWeight: FontWeight.w700,
                              ),


                              SpaceHelperClass.v(8.h(context)),



                              TextHelperClass.headingText(
                                context: context,
                                text: "${addSiteDiaryController.supervisor.value}",
                                fontSize: 20,
                                textColor: AppColors.black38,
                                fontWeight: FontWeight.w500,
                              ),



                              SpaceHelperClass.v(16.h(context)),

                              Container(
                                width: 375.w(context),
                                padding: EdgeInsets.symmetric(horizontal: 8.hpm(context), vertical:  6.vpm(context),),
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
                                      fontSize: 20,
                                      textColor: AppColors.black65,
                                      fontWeight: FontWeight.w700,
                                    ),

                                    SpaceHelperClass.v(8.h(context)),

                                    CustomTextFormFieldClass.textFiledWithMaxLineBuild(
                                      context: context,
                                      controller: addSiteDiaryController.descriptionController.value,
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
                                            controller: addSiteDiaryController.audioController.value,
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
                                                print("hello");
                                                await addSiteDiaryController.speechListen();
                                              },
                                              icon: Icon(
                                                Icons.mic,
                                                color: addSiteDiaryController.isListening.value == true ? Colors.red : Color.fromRGBO(117, 131, 141, 1),
                                                size: 24.r(context),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SpaceHelperClass.h(8.w(context)),


                                        ImageHelperClass.customImageButtonContainer(
                                          onPressed: () async {
                                            if(addSiteDiaryController.audioController.value.text != "") {
                                              addSiteDiaryController.descriptionController.value.text += "${addSiteDiaryController.audioController.value.text} . ";
                                              addSiteDiaryController.audioController.value.clear();
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
                                fontSize: 20,
                                textColor: AppColors.black65,
                                fontWeight: FontWeight.w700,
                              ),
                              SpaceHelperClass.v(8.h(context)),


                              CustomTextFormFieldClass.build(
                                  context: context,
                                  controller: addSiteDiaryController.dateTimeController.value,
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
                                    await addSiteDiaryController.pickDateTime(context: context);
                                  }
                              ),

                              SpaceHelperClass.v(16.h(context)),


                              TextHelperClass.headingText(
                                context: context,
                                text: "Weather condition",
                                fontSize: 20,
                                textColor: AppColors.black65,
                                fontWeight: FontWeight.w700,
                              ),

                              SpaceHelperClass.v(8.h(context)),

                              CustomTextFormFieldClass.build(
                                context: context,
                                controller: addSiteDiaryController.weatherConditionController.value,
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
                        ),


                        SpaceHelperClass.v(24.h(context)),



                        Container(
                          width: 375.w(context),
                          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
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

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Expanded(
                                    child: TextHelperClass.headingText(
                                      context: context,
                                      text: "Add task",
                                      fontSize: 24,
                                      textColor: Color.fromRGBO(31, 41, 55, 1), // Border color
                                      fontWeight:FontWeight.w700,
                                    ),
                                  ),


                                  SizedBox(
                                    width: 74.w(context),
                                    height: 24.h(context),
                                    child: OutlinedButton(
                                      onPressed: () async {
                                        if(addSiteDiaryController.taskNameController.value.text == "") {
                                          kSnackBar(message: "Enter task name", bgColor: AppColors.red);
                                        } else if(addSiteDiaryController.workforceList.isEmpty == true) {
                                          kSnackBar(message: "Add workers", bgColor: AppColors.red);
                                        } else if(addSiteDiaryController.equipmentList.isEmpty == true) {
                                          kSnackBar(message: "Add equipment", bgColor: AppColors.red);
                                        } else {
                                          addSiteDiaryController.taskList.add(
                                            Task(
                                              addSiteDiaryController.taskNameController.value.text,
                                              addSiteDiaryController.workforceList,
                                              addSiteDiaryController.equipmentList,
                                            ),
                                          );
                                        }
                                      },
                                      style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 5.hpm(context),vertical: 4.vpm(context)), // left, top, right, bottom
                                          side: const BorderSide(
                                            color: Color.fromRGBO(24, 147, 248, 1), // Border color
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4.r(context)), // Border radius
                                          ),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Prevents extra padding
                                          minimumSize: Size(74.w(context),24.h(context),) // Forces exact size
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Icon(
                                            Icons.add,
                                            color: Color.fromRGBO(24, 147, 248, 1), // Border color
                                            size: 16.r(context),
                                          ),

                                          Expanded(
                                            child: TextHelperClass.headingText(
                                              context: context,
                                              text: "Add task",
                                              fontSize: 12,
                                              textColor: Color.fromRGBO(24, 147, 248, 1), // Border color
                                              fontWeight:FontWeight.w400,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                              SpaceHelperClass.v(12.h(context)),

                              TextHelperClass.headingText(
                                context: context,
                                text: "Task Name",
                                fontSize: 15,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w700,
                              ),

                              SpaceHelperClass.v(8.h(context)),

                              CustomTextFormFieldClass.build(
                                context: context,
                                controller: addSiteDiaryController.taskNameController.value,
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


                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.lpm(context),
                                  right: 16.rpm(context),
                                  top: 16.tpm(context),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    TextHelperClass.headingText(
                                      context: context,
                                      text: 'Workforce',
                                      fontSize: 24,
                                      textColor: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SpaceHelperClass.v(12.h(context)),


                                    Row(
                                      children: [

                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              TextHelperClass.headingText(
                                                context: context,
                                                text: 'Worker',
                                                fontSize: 15,
                                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                                fontWeight: FontWeight.w500,
                                              ),

                                              SpaceHelperClass.v(8.h(context)),


                                              CustomDropdownHelperClass<String>(
                                                contentPadding: EdgeInsets.symmetric(
                                                  horizontal: 16.hpm(context),
                                                  vertical: 8.vpm(context),
                                                ),
                                                value: addSiteDiaryController.selectedWorker.value == "" ? null : addSiteDiaryController.selectedWorker.value,
                                                items: ['Laborers', 'Engineer', 'Electrician'],
                                                onChanged: (value) {
                                                  addSiteDiaryController.selectedWorker.value = value!;
                                                },
                                              ),


                                            ],
                                          ),
                                        ),

                                        SpaceHelperClass.h(8.w(context)),


                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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

                                              CustomTextFormFieldClass.build(
                                                context: context,
                                                controller: addSiteDiaryController.workforceQuantityController.value,
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
                                              ),
                                            ],
                                          ),
                                        ),


                                      ],
                                    ),


                                    SpaceHelperClass.v(12.h(context)),

                                    TextHelperClass.headingText(
                                      context: context,
                                      text: 'Duration',
                                      fontSize: 15,
                                      textColor: Color.fromRGBO(75, 85, 99, 1),
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SpaceHelperClass.v(8.h(context)),

                                    CustomTextFormFieldClass.build(
                                      context: context,
                                      controller:  addSiteDiaryController.workForceDurationController.value,
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
                                    ),

                                    SpaceHelperClass.v(16.h(context)),


                                    SizedBox(
                                      width: 375.w(context),
                                      height: 50.h(context),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if(addSiteDiaryController.selectedWorker.value == "" ||
                                              addSiteDiaryController.workforceQuantityController.value.text == "" ||
                                              addSiteDiaryController.workForceDurationController.value.text == "") {
                                            kSnackBar(message: "Please fill all field", bgColor: AppColors.red);
                                          } else {
                                            addSiteDiaryController.workforceList.add(
                                              Workforce(
                                                addSiteDiaryController.selectedWorker.value,
                                                int.parse(addSiteDiaryController.workforceQuantityController.value.text),
                                                int.parse(addSiteDiaryController.workForceDurationController.value.text),
                                              ),
                                            );
                                            addSiteDiaryController.workforceList.refresh();
                                            addSiteDiaryController.selectedWorker.value = "";
                                            addSiteDiaryController.workforceQuantityController.value.clear();
                                            addSiteDiaryController.workForceDurationController.value.clear();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(24, 147, 248, 1), // Background color
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white, // White icon on blue background
                                              size: 16.r(context),
                                            ),

                                            SpaceHelperClass.h(8.w(context)),

                                            TextHelperClass.headingText(
                                              width: 69.w(context),
                                              context: context,
                                              text: "Add New",
                                              fontSize: 16,
                                              textColor: Colors.white, // White text
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SpaceHelperClass.v(12.h(context)),

                                    ...addSiteDiaryController.workforceList.map((item) => _buildAddedItem(
                                      '${item.quantity} ${item.type}',
                                      '${item.duration} hour',
                                      AppImages.workforceIcon,
                                          () {
                                        addSiteDiaryController.workforceList.remove(item);
                                      },
                                      true,
                                      context,
                                    )),


                                  ],
                                ),
                              ),


                              SpaceHelperClass.v(12.h(context)),

                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.lpm(context),
                                  right: 16.rpm(context),
                                  top: 16.tpm(context),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    TextHelperClass.headingText(
                                      context: context,
                                      text: 'Equipment',
                                      fontSize: 24,
                                      textColor: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SpaceHelperClass.v(12.h(context)),

                                    Row(
                                      children: [

                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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


                                              CustomDropdownHelperClass<String>(
                                                contentPadding: EdgeInsets.symmetric(
                                                  horizontal: 16.hpm(context),
                                                  vertical: 8.vpm(context),
                                                ),
                                                value: addSiteDiaryController.selectedEquipment.value == "" ? null : addSiteDiaryController.selectedEquipment.value,
                                                items: ['Excavator', 'Concrete Mixer'],
                                                onChanged: (value) {
                                                  addSiteDiaryController.selectedEquipment.value = value!;
                                                },
                                              ),


                                            ],
                                          ),
                                        ),

                                        SpaceHelperClass.h(8.w(context)),


                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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

                                              CustomTextFormFieldClass.build(
                                                context: context,
                                                controller: addSiteDiaryController.equipmentQuantityController.value,
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
                                              ),
                                            ],
                                          ),
                                        ),


                                      ],
                                    ),

                                    SpaceHelperClass.v(12.h(context)),


                                    TextHelperClass.headingText(
                                      context: context,
                                      text: 'Duration',
                                      fontSize: 15,
                                      textColor: Color.fromRGBO(75, 85, 99, 1),
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SpaceHelperClass.v(8.h(context)),

                                    CustomTextFormFieldClass.build(
                                      context: context,
                                      controller: addSiteDiaryController.equipmentDurationController.value,
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
                                    ),

                                    SpaceHelperClass.v(16.h(context)),



                                    SizedBox(
                                      width: 375.w(context),
                                      height: 50.h(context),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if(addSiteDiaryController.selectedEquipment.value == "" ||
                                              addSiteDiaryController.equipmentQuantityController.value.text == "" ||
                                              addSiteDiaryController.equipmentDurationController.value.text == "") {
                                            kSnackBar(message: "Please fill all field", bgColor: AppColors.red);
                                          } else {
                                            addSiteDiaryController.equipmentList.add(
                                                Equipment(
                                                  addSiteDiaryController.selectedEquipment.value,
                                                  int.parse(addSiteDiaryController.equipmentQuantityController.value.text),
                                                  int.parse(addSiteDiaryController.equipmentDurationController.value.text),
                                                )
                                            );
                                            addSiteDiaryController.equipmentList.refresh();
                                            addSiteDiaryController.selectedEquipment.value = "";
                                            addSiteDiaryController.equipmentQuantityController.value.clear();
                                            addSiteDiaryController.equipmentDurationController.value.clear();
                                          }

                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(24, 147, 248, 1), // Background color
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white, // White icon on blue background
                                              size: 16.r(context),
                                            ),

                                            SpaceHelperClass.h(8.w(context)),

                                            TextHelperClass.headingText(
                                              width: 69.w(context),
                                              context: context,
                                              text: "Add New",
                                              fontSize: 16,
                                              textColor: Colors.white, // White text
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SpaceHelperClass.v(12.h(context)),

                                    ...addSiteDiaryController.equipmentList.map((item) => _buildAddedItem(
                                      '${item.quantity} ${item.type}',
                                      '${item.duration} hour',
                                      AppImages.equipmentIcon, () {
                                      addSiteDiaryController.equipmentList.remove(item);
                                    },
                                      true,
                                      context,
                                    )),

                                  ],
                                ),
                              ),



                            ],
                          ),
                        ),

                        SpaceHelperClass.v(24.h(context)),


                        ...addSiteDiaryController.taskList.map((item) {
                          return Obx(()=>Container(
                            width: 375.w(context),
                            margin: EdgeInsets.only(bottom: 8.bpm(context)),
                            padding: EdgeInsets.symmetric(vertical: 14.vpm(context),horizontal: 16.hpm(context)),
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

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [


                                    Expanded(
                                      child: TextHelperClass.headingText(
                                        context: context,
                                        text: item.name,
                                        fontSize: 24,
                                        textColor: Color.fromRGBO(31, 41, 55, 1), // Border color
                                        fontWeight:FontWeight.w700,
                                      ),
                                    ),


                                    SizedBox(
                                      width: 74.w(context),
                                      height: 24.h(context),
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          addSiteDiaryController.taskList.remove(item);
                                        },
                                        style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(horizontal: 5.hpm(context),vertical: 4.vpm(context)), // left, top, right, bottom
                                            side: const BorderSide(
                                              color: Color.fromRGBO(239, 68, 68, 1), // Border color
                                              width: 1,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.r(context)), // Border radius
                                            ),
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Prevents extra padding
                                            minimumSize: Size(74.w(context),24.h(context),) // Forces exact size
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Icon(
                                              Icons.delete_outlined,
                                              color: Color.fromRGBO(239, 68, 68, 1), // Border color
                                              size: 16.r(context),
                                            ),

                                            Expanded(
                                              child: TextHelperClass.headingText(
                                                context: context,
                                                text: "Remove",
                                                fontSize: 12,
                                                textColor: Color.fromRGBO(239, 68, 68, 1), // Border color
                                                fontWeight:FontWeight.w400,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                                SpaceHelperClass.v(14.h(context)),

                                TextHelperClass.headingText(
                                  context: context,
                                  text: "Workforce",
                                  fontSize: 16,
                                  textColor: Color.fromRGBO(0, 0, 0, 1), // Border color
                                  fontWeight:FontWeight.w700,
                                ),


                                SpaceHelperClass.v(10.h(context)),


                                ...item.workforce.map((item) {
                                  return _buildAddedItem(
                                    '${item.quantity} ${item.type}',
                                    '${item.duration} hour',
                                    AppImages.workforceIcon, () {
                                    addSiteDiaryController.workforceList.remove(item);
                                  },
                                    false,
                                    context,
                                  );
                                }),




                                SpaceHelperClass.v(14.h(context)),


                                TextHelperClass.headingText(
                                  context: context,
                                  text: "Equipment",
                                  fontSize: 16,
                                  textColor: Color.fromRGBO(0, 0, 0, 1), // Border color
                                  fontWeight:FontWeight.w700,
                                ),

                                SpaceHelperClass.v(10.h(context)),


                                ...item.equipment.map((item) {
                                  return _buildAddedItem(
                                    '${item.quantity} ${item.type}',
                                    '${item.duration} hour',
                                    AppImages.equipmentIcon, () {
                                    addSiteDiaryController.workforceList.remove(item);
                                  },
                                    false,
                                    context,
                                  );
                                }),




                              ],
                            ),
                          ));
                        }),


                        SpaceHelperClass.v(24.h(context)),

                        Container(
                          width: 375.w(context),
                          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
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
                              /// Title

                              TextHelperClass.headingText(
                                context: context,
                                text: "Site Capture",
                                fontSize: 24,
                                textColor: Color.fromRGBO(31, 41, 55, 1), // Border color
                                fontWeight:FontWeight.w700,
                              ),




                              SpaceHelperClass.v(12.h(context)),

                              Container(
                                width: 375.w(context),
                                height: 160.h(context),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF3F4F6), // rgba(243, 244, 246, 1)
                                  borderRadius: BorderRadius.circular(10.r(context)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF04060F).withOpacity(0.03), // rgba(4, 6, 15, 0.03)
                                      blurRadius: 60,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    addSiteDiaryController.showImageSourceDialog(context: context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      ImageHelperClass.customImageContainer(
                                        context: context,
                                        height: 101.h(context),
                                        width: 101.w(context),
                                        imagePath: AppImages.imageIcon,
                                        imageFit: BoxFit.contain,
                                        fit: BoxFit.cover,
                                      ),

                                      TextHelperClass.headingText(
                                        alignment: Alignment.center,
                                        textAlign: TextAlign.center,
                                        context: context,
                                        text: "Capture Photo",
                                        fontSize: 16,
                                        textColor: Color.fromRGBO(107, 114, 128, 1), // Border color
                                        fontWeight:FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                              SpaceHelperClass.v(12.h(context)),


                              if (addSiteDiaryController.selectedImage.value.path != "")
                                ImageHelperClass.customFileImageContainer(
                                  context: context,
                                  height: 192.h(context),
                                  width: 374.w(context),
                                  imagePath: addSiteDiaryController.selectedImage.value,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),


                              SpaceHelperClass.v(12.h(context)),

                              /// Location Section
                              Container(
                                width: 375.w(context),
                                padding: EdgeInsets.symmetric(vertical: 8.vpm(context),horizontal: 16.hpm(context)),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB), // rgba(229, 231, 235, 1)
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r(context)),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ImageHelperClass.customImageContainer(
                                      context: context,
                                      height: 24.h(context),
                                      width: 24.w(context),
                                      imagePath: AppImages.locationIcon,
                                      imageFit: BoxFit.contain,
                                      fit: BoxFit.cover,
                                    ),

                                    SpaceHelperClass.h(8.w(context)),


                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          TextHelperClass.headingText(
                                            context: context,
                                            text: "Location",
                                            fontSize: 16,
                                            textColor: Color.fromRGBO(0, 0, 0, 1), // Border color
                                            fontWeight:FontWeight.w500,
                                          ),


                                          SpaceHelperClass.v(8.h(context)),

                                          CustomTextFormFieldClass.build(
                                            context: context,
                                            controller: addSiteDiaryController.locationController.value,
                                            hintText: "Enter Location",
                                            borderColor: Colors.transparent,
                                            contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.vpm(context),
                                            ),
                                            borderRadius: 8,
                                            keyboardType: TextInputType.text,
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SpaceHelperClass.v(15.h(context)),

                              CustomButtonHelper.customRoundedButton(
                                context: context,
                                text: "Recapture Photo",
                                fontSize: 16,
                                textColor: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600,
                                borderRadius: 8,
                                backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                onPressed: () {
                                  addSiteDiaryController.showImageSourceDialog(context: context);
                                },
                              ),


                            ],
                          ),
                        ),


                        SpaceHelperClass.v(35.h(context)),


                        Row(
                          children: [


                            Expanded(
                              child: CustomButtonHelper.customRoundedButton(
                                context: context,
                                text: "Save Log",
                                fontSize: 16,
                                textColor: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600,
                                borderRadius: 8,
                                backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                onPressed: () {
                                  Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                },
                              ),
                            ),


                            SpaceHelperClass.h(12.w(context)),

                            Expanded(
                              child: CustomButtonHelper.customRoundedButton(
                                context: context,
                                text: "Cancel",
                                fontSize: 16,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w600,
                                borderRadius: 8,
                                backgroundColor: Color.fromRGBO(234, 235, 235, 1),
                                borderWidth: 1,
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                                onPressed: () {
                                  Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                                },
                              ),
                            ),



                          ],
                        ),


                        SpaceHelperClass.v(35.h(context)),



                      ],
                    ),
                  ),
                )

              ],
            )
        )),
      ),
    );
  }

  Widget _buildAddedItem(String title, String subtitle, String icon, Function() onDelete,bool isActionButton,BuildContext context) {
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