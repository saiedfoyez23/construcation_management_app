import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/profile/controller/employee_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class EmployeeEditProfileView extends StatelessWidget {
  EmployeeEditProfileView({super.key});

  final EmployeeProfileController employeeProfileController = Get.put(EmployeeProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: employeeProfileController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          CustomScrollView(
            slivers: [
        
              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>EmployeeDashboardView(index: 3),preventDuplicates: false);
                },
                title: 'Edit Profile',
              ),
        
        
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceHelperClass.v(20.h(context)),
                      // Profile picture with edit icon
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            employeeProfileController.imageFile.value.path == "" ?
                            CircleAvatar(
                              radius: 100.r(context),
                              backgroundImage: employeeProfileController.employeeProfileResponseModel.value.data?.image != null
                                  ? NetworkImage(employeeProfileController.employeeProfileResponseModel.value.data?.image) : null,
                              backgroundColor: Colors.grey[300],
                              child: employeeProfileController.employeeProfileResponseModel.value.data?.image == null ?
                              Icon(
                                Icons.person,
                                size: 48.r(context),
                                color: Colors.white,
                              ) : null,
                            ) :
                            CircleAvatar(
                              radius: 100.r(context),
                              backgroundImage: FileImage(employeeProfileController.imageFile.value),
                              backgroundColor: Colors.grey,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 111.lpm(context),
                              right: 10.rpm(context),
                              child: ImageHelperClass.customImageButtonContainer(
                                onPressed: () async {
                                  employeeProfileController.showImageSourceDialog(context: context);
                                },
                                context: context,
                                height: 42.h(context),
                                width: 42.w(context),
                                imagePath: AppImages.editBlueIcon,
                                imageFit: BoxFit.contain,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SpaceHelperClass.v(15.h(context)),
                      // Name with edit icon

                      TextHelperClass.headingTextWithoutWidth(
                        alignment: Alignment.center,
                        textAlign: TextAlign.center,
                        context: context,
                        text: employeeProfileController.employeeProfileResponseModel.value.data?.name ?? "",
                        fontSize: 20,
                        textColor: Color.fromRGBO(29, 36, 45, 1),
                        fontWeight: FontWeight.w700,
                      ),

                      SpaceHelperClass.v(35.h(context)),

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        text: 'Personal Details',
                        fontSize: 22,
                        textColor: Color.fromRGBO(28, 64, 74, 1),
                        fontWeight: FontWeight.w700,
                      ),

                      SpaceHelperClass.v(16.h(context)),


                      TextHelperClass.headingText(
                        context: context,
                        text: "Full Name",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),

                      SpaceHelperClass.v(8.h(context)),

                      CustomTextFormFieldClass.build(
                        context: context,
                        controller: employeeProfileController.nameController.value,
                        hintText: "Enter full Name",
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
                        text: "Company Name",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),

                      SpaceHelperClass.v(8.h(context)),

                      CustomTextFormFieldClass.build(
                        context: context,
                        readOnly: true,
                        controller: employeeProfileController.companyController.value,
                        hintText: "Enter company name",
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
                        text: "Email",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),

                      SpaceHelperClass.v(8.h(context)),

                      CustomTextFormFieldClass.build(
                        context: context,
                        readOnly: true,
                        controller: employeeProfileController.emailController.value,
                        hintText: "Enter company email",
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
                        text: "Phone Number",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),


                      SpaceHelperClass.v(8.h(context)),

                      CustomTextFormFieldClass.build(
                        context: context,
                        controller: employeeProfileController.phoneNumberController.value,
                        hintText: "Phone number",
                        borderColor: Color.fromRGBO(229, 231, 235, 1),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.hpm(context),
                          vertical: 8.vpm(context),
                        ),
                        borderRadius: 8,
                        keyboardType: TextInputType.text,
                      ),

                      SpaceHelperClass.v(32.h(context)),


                      employeeProfileController.isSubmit.value == true ?
                      CustomLoaderButton().customLoaderButton(
                        backgroundColor: Colors.transparent,
                        loaderColor: Color.fromRGBO(38, 50, 56, 1),
                        height: 50,
                        context: context,
                      ) :
                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: 'Save',
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        gradientColors: [Color.fromRGBO(38, 50, 56, 1), Color.fromRGBO(28, 59, 71, 1)],
                        onPressed: () async {
                          if(employeeProfileController.nameController.value.text == "") {
                            kSnackBar(message: "Please enter name", bgColor: AppColors.red);
                          } else if(employeeProfileController.phoneNumberController.value.text == "") {
                            kSnackBar(message: "Please enter phone number", bgColor: AppColors.red);
                          } else if(employeeProfileController.emailController.value.text == "") {
                            kSnackBar(message: "Please enter email", bgColor: AppColors.red);
                          } else {
                            employeeProfileController.isSubmit.value = true;
                            await employeeProfileController.updateProfileController(
                              name: employeeProfileController.nameController.value.text,
                              phone: employeeProfileController.phoneNumberController.value.text,
                              email: employeeProfileController.emailController.value.text,
                              image: employeeProfileController.imageFile.value,
                            );
                          }
                        },
                      ),

                      SpaceHelperClass.v(32.h(context)),
                    ],
                  ),
                ),
              )
        
        
            ],
          )
        ),
      )),
    );
  }
}
