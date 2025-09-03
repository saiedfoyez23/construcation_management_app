import 'package:construction_management_app/modules/employee_user/project_details/view/employee_project_details_view.dart';
import 'package:construction_management_app/modules/employee_user/resources/controller/employee_resources_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common.dart';


class EmployeeResourcesView extends StatelessWidget {
  EmployeeResourcesView({super.key,required this.projectId});

  final String projectId;
  @override
  Widget build(BuildContext context) {
    EmployeeResourcesController employeeResourcesController = Get.put(EmployeeResourcesController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=> employeeResourcesController.isLoading.value == true  ?
        CustomLoaderButton().customLoaderButton(
          backgroundColor: Colors.transparent,
          loaderColor: Color.fromRGBO(38, 50, 56, 1),
          height: 812,
          context: context,
        ) :
        Container(
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
                  Get.off(()=>EmployeeProjectDetailsView(projectId: projectId),preventDuplicates: false);
                },
                title: "Resources",
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(20.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: "Resources",
                        fontSize: 20,
                        textColor: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w700,
                      ),

                      SpaceHelperClass.v(20.h(context)),


                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(12.r(context)),
                        ),
                        child: Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [


                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: 'Workforce',
                                    fontSize: 17,
                                    textColor: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),



                                SizedBox(
                                  height: 40.h(context),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await employeeResourcesController.refreshVariable();
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) {
                                          return Obx(()=>AlertDialog(
                                            backgroundColor: AppColors.white,
                                            insetPadding: EdgeInsets.only(
                                              left: 21.lpm(context),
                                              right: 21.rpm(context),
                                              top: 56.tpm(context),
                                              bottom: 56.bpm(context),
                                            ),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 24.hpm(context),vertical: 24.vpm(context)),
                                            scrollable: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.r(context)),
                                              side: const BorderSide(
                                                color: Color.fromRGBO(229, 231, 235, 1),
                                                width: 1,
                                              ),
                                            ),
                                            content: SizedBox(
                                              width: 375.w(context),
                                              //height: 812.h(context),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  TextHelperClass.headingText(
                                                    context: context,
                                                    text: "Add New Workforce",
                                                    fontSize: 22,
                                                    textColor: AppColors.black255,
                                                    fontWeight: FontWeight.w700,
                                                  ),

                                                  SpaceHelperClass.v(16.h(context)),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            TextHelperClass.headingText(
                                                              context: context,
                                                              text: 'Workforce Type',
                                                              fontSize: 15,
                                                              textColor: Color.fromRGBO(75, 85, 99, 1),
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                            SpaceHelperClass.v(8.h(context)),

                                                            _buildDurationField(
                                                              hintText: "Workforce",
                                                              context: context,
                                                              controller: employeeResourcesController.workforceTypeController.value,
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
                                                              hintText: "Quantity",
                                                              controller: employeeResourcesController.workforceQuantityController.value,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SpaceHelperClass.v(16.h(context)),


                                                  Row(
                                                    children: [


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
                                                          onPressed: () async {
                                                            Get.back();
                                                            await employeeResourcesController.refreshVariable();
                                                          },
                                                        ),
                                                      ),

                                                      SpaceHelperClass.h(12.w(context)),


                                                      Expanded(
                                                        child: employeeResourcesController.isSubmit.value == true ?
                                                        CustomLoaderButton().customLoaderButton(
                                                          backgroundColor: Colors.transparent,
                                                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                          height: 50,
                                                          context: context,
                                                        ) :
                                                        CustomButtonHelper.customRoundedButton(
                                                          context: context,
                                                          text: "Save",
                                                          fontSize: 16,
                                                          textColor: Color.fromRGBO(255, 255, 255, 1),
                                                          fontWeight: FontWeight.w600,
                                                          borderRadius: 8,
                                                          backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                                          onPressed: () async {
                                                            if(employeeResourcesController.workforceTypeController.value.text == "") {
                                                              kSnackBar(message: "Please enter workforce type", bgColor: AppColors.red);
                                                            } else if(employeeResourcesController.workforceQuantityController.value.text == "") {
                                                              kSnackBar(message: "Please enter workforce quantity", bgColor: AppColors.red);
                                                            } else {
                                                              List<Map<String,dynamic>> data = [
                                                                {
                                                                  "project": projectId,
                                                                  "name": employeeResourcesController.workforceTypeController.value.text,
                                                                  "quantity": int.parse(employeeResourcesController.workforceQuantityController.value.text),
                                                                }
                                                              ];
                                                              print(data);
                                                              employeeResourcesController.isSubmit.value = true;
                                                              await employeeResourcesController.createEmployeeWorkforceController(data: data).then((_) async {
                                                                await employeeResourcesController.getEmployeeAllWorkforceController(projectId: projectId);
                                                              });
                                                            }
                                                          },
                                                        ),
                                                      ),



                                                    ],
                                                  ),


                                                  SpaceHelperClass.v(24.h(context)),

                                                ],
                                              ),
                                            ),
                                          ));
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(24, 147, 248, 1),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.hpm(context),
                                        vertical: 6.vpm(context),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r(context)),
                                      ),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add, color: Colors.white, size: 16.r(context)),
                                        SpaceHelperClass.h(4.w(context)),
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          text: "Add New",
                                          fontSize: 16,
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),

                            SpaceHelperClass.v(15.h(context)),


                            ...employeeResourcesController.getEmployeeAllWorkforcesResponseModel.value.data!.map((value) {
                              if(value.isDeleted == true) {
                                return SizedBox.shrink();
                              } else {
                                return _buildAddedItem(
                                  title: "${value.initialQuantity} ${value.name}",
                                  icon: AppImages.workforceIcon,
                                  context: context,
                                  isActionButton: true,
                                  onDelete: () async {
                                    await employeeResourcesController.deleteEmployeeWorkforceController(workforceId: value.sId).then((_) {
                                      Get.off(EmployeeResourcesView(projectId: projectId),preventDuplicates: false);
                                    });
                                  },
                                );
                              }
                            })






                          ],
                        ),
                      ),



                      SpaceHelperClass.v(20.h(context)),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(12.r(context)),
                        ),
                        child: Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [


                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: 'Equipments',
                                    fontSize: 17,
                                    textColor: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),



                                SizedBox(
                                  height: 40.h(context),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await employeeResourcesController.refreshVariable();
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) {
                                          return Obx(()=>AlertDialog(
                                            backgroundColor: AppColors.white,
                                            insetPadding: EdgeInsets.only(
                                              left: 21.lpm(context),
                                              right: 21.rpm(context),
                                              top: 56.tpm(context),
                                              bottom: 56.bpm(context),
                                            ),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 24.hpm(context),vertical: 24.vpm(context)),
                                            scrollable: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.r(context)),
                                              side: const BorderSide(
                                                color: Color.fromRGBO(229, 231, 235, 1),
                                                width: 1,
                                              ),
                                            ),
                                            content: SizedBox(
                                              width: 375.w(context),
                                              //height: 812.h(context),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  TextHelperClass.headingText(
                                                    context: context,
                                                    text: "Add New Equipments",
                                                    fontSize: 22,
                                                    textColor: AppColors.black255,
                                                    fontWeight: FontWeight.w700,
                                                  ),

                                                  SpaceHelperClass.v(16.h(context)),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            TextHelperClass.headingText(
                                                              context: context,
                                                              text: 'Equipments Type',
                                                              fontSize: 15,
                                                              textColor: Color.fromRGBO(75, 85, 99, 1),
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                            SpaceHelperClass.v(8.h(context)),

                                                            _buildDurationField(
                                                                context: context,
                                                                controller: employeeResourcesController.equipmentsTypeController.value,
                                                                hintText: "Equipments"
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
                                                                controller: employeeResourcesController.equipmentsQuantityController.value,
                                                                hintText: "Quantity"
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SpaceHelperClass.v(16.h(context)),


                                                  Row(
                                                    children: [


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
                                                          onPressed: () async {
                                                            Get.back();
                                                            await employeeResourcesController.refreshVariable();
                                                          },
                                                        ),
                                                      ),

                                                      SpaceHelperClass.h(12.w(context)),


                                                      Expanded(
                                                        child: employeeResourcesController.isSubmit.value == true ?
                                                        CustomLoaderButton().customLoaderButton(
                                                          backgroundColor: Colors.transparent,
                                                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                          height: 50,
                                                          context: context,
                                                        ) :
                                                        CustomButtonHelper.customRoundedButton(
                                                          context: context,
                                                          text: "Save",
                                                          fontSize: 16,
                                                          textColor: Color.fromRGBO(255, 255, 255, 1),
                                                          fontWeight: FontWeight.w600,
                                                          borderRadius: 8,
                                                          backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                                          onPressed: () async {
                                                            if(employeeResourcesController.equipmentsTypeController.value.text == "") {
                                                              kSnackBar(message: "Please enter equipments type", bgColor: AppColors.red);
                                                            } else if(employeeResourcesController.equipmentsQuantityController.value.text == "") {
                                                              kSnackBar(message: "Please enter equipments quantity", bgColor: AppColors.red);
                                                            } else {
                                                              List<Map<String,dynamic>> data = [
                                                                {
                                                                  "project": projectId,
                                                                  "name": employeeResourcesController.equipmentsTypeController.value.text,
                                                                  "quantity": int.parse(employeeResourcesController.equipmentsQuantityController.value.text),
                                                                }
                                                              ];
                                                              print(data);
                                                              employeeResourcesController.isSubmit.value = true;
                                                              await employeeResourcesController.createEmployeeEquipmentsController(data: data).then((_) async {
                                                                await employeeResourcesController.getEmployeeAllEquipmentsController(projectId: projectId);
                                                              });
                                                            }
                                                          },
                                                        ),
                                                      ),



                                                    ],
                                                  ),


                                                  SpaceHelperClass.v(24.h(context)),

                                                ],
                                              ),
                                            ),
                                          ));
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(24, 147, 248, 1),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.hpm(context),
                                        vertical: 6.vpm(context),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r(context)),
                                      ),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add, color: Colors.white, size: 16.r(context)),
                                        SpaceHelperClass.h(4.w(context)),
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          text: "Add New",
                                          fontSize: 16,
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),


                            SpaceHelperClass.v(15.h(context)),


                            ...employeeResourcesController.getEmployeeAllEquipmentsResponseModel.value.data!.map((value) {
                              if(value.isDeleted == false) {
                                return _buildAddedItem(
                                  title: "${value.initialQuantity} ${value.name}",
                                  icon: AppImages.equipmentIcon,
                                  context: context,
                                  isActionButton: true,
                                  onDelete: () async {
                                    await employeeResourcesController.deleteEmployeeEquipmentsController(equipmentId: value.sId).then((_) {
                                      Get.off(EmployeeResourcesView(projectId: projectId),preventDuplicates: false);
                                    });
                                  },
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            })


                          ],
                        ),
                      ),

                      SpaceHelperClass.v(20.h(context)),


                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 246, 255, 1),
                          borderRadius: BorderRadius.circular(12.r(context)),
                        ),
                        child: Column(
                          children: [

                            Row(
                              children: [
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imagePath: AppImages.delay,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),


                                SpaceHelperClass.h(12.w(context)),


                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: "Available Workforce",
                                    fontSize: 18,
                                    textColor: Color.fromRGBO(31, 41, 55, 1), // White text
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                              ],
                            ),

                            SpaceHelperClass.v(20.h(context)),

                            Container(
                              width: 375.w(context),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Wrap(

                                children: [
                              
                                  ...employeeResourcesController.getEmployeeAllWorkforcesResponseModel.value.data!.map((value) {
                                    if(value.isDeleted == true) {
                                      return SizedBox.shrink();
                                    } else {
                                      return TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        text: "${value.quantity} ${value.name} , ",
                                        fontSize: 18,
                                        textColor: Color.fromRGBO(31, 41, 55, 1), // White text
                                        fontWeight: FontWeight.w500,
                                      );
                                    }
                                  })


                                ],
                              ),
                            ),


                          ],
                        ),
                      ),

                      SpaceHelperClass.v(20.h(context)),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 246, 255, 1),
                          borderRadius: BorderRadius.circular(12.r(context)),
                        ),
                        child: Column(
                          children: [

                            Row(
                              children: [
                                ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 20.h(context),
                                  width: 20.w(context),
                                  imagePath: AppImages.delay,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.cover,
                                ),


                                SpaceHelperClass.h(12.w(context)),

                                Expanded(
                                  child: TextHelperClass.headingText(
                                    context: context,
                                    text: "Available Equipments",
                                    fontSize: 18,
                                    textColor: Color.fromRGBO(31, 41, 55, 1), // White text
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                              ],
                            ),

                            SpaceHelperClass.v(20.h(context)),


                            Container(
                              width: 375.w(context),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Wrap(

                                children: [

                                  ...employeeResourcesController.getEmployeeAllEquipmentsResponseModel.value.data!.map((value) {
                                    if(value.isDeleted == true) {
                                      return SizedBox.shrink();
                                    } else {
                                      return TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        text: "${value.quantity} ${value.name} , ",
                                        fontSize: 18,
                                        textColor: Color.fromRGBO(31, 41, 55, 1), // White text
                                        fontWeight: FontWeight.w500,
                                      );
                                    }
                                  })


                                ],
                              ),
                            ),


                          ],
                        ),
                      ),


                      SpaceHelperClass.v(20.h(context)),



                    ],
                  ),
                ),
              )

            ],
          ),
        )),
      ),
    );
  }


  Widget _buildQuantityField({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
  }) {
    return CustomTextFormFieldClass.build(
      context: context,
      controller: controller,
      hintText: hintText,
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
    required String hintText,
  }) {
    return CustomTextFormFieldClass.build(
      context: context,
      controller: controller,
      hintText: hintText,
      borderColor: Color.fromRGBO(229, 231, 235, 1),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.hpm(context),
        vertical: 8.vpm(context),
      ),
      borderRadius: 8,
      keyboardType: TextInputType.text,
    );
  }


  Widget _buildAddedItem({
    required String title,
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
