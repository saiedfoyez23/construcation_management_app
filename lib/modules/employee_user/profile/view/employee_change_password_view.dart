import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/profile/controller/employee_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class EmployeeChangePasswordView extends StatelessWidget {
  EmployeeChangePasswordView({super.key});

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
                title: 'Change Password',
              ),
        
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
        
                      SpaceHelperClass.v(20.h(context)),
        
                      Stack(
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
                                employeeProfileController.showImageSourceUploadDialog(
                                  context: context,
                                  name: employeeProfileController.employeeProfileResponseModel.value.data?.name ?? "",
                                  phone: employeeProfileController.employeeProfileResponseModel.value.data?.phone ?? "",
                                  email: employeeProfileController.employeeProfileResponseModel.value.data?.email ?? "",
                                  location: employeeProfileController.employeeProfileResponseModel.value.data?.location ?? "",
                                );
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
        
                      SpaceHelperClass.v(38.h(context)),
        
        
                      TextHelperClass.headingText(
                        context: context,
                        text: "Old Password",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),
        
                      SpaceHelperClass.v(8.h(context)),
        
        
        
                      CustomTextFormFieldClass.build(
                        context: context,
                        obscureText: employeeProfileController.isObscureText.value,
                        controller: employeeProfileController.passwordController.value,
                        hintText: 'Old Password',
                        keyboardType: TextInputType.text,
                        borderRadius: 10,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.vpm(context),
                          horizontal: 12.hpm(context),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if(employeeProfileController.isObscureText.value == true) {
                              employeeProfileController.isObscureText.value = false;
                            } else {
                              employeeProfileController.isObscureText.value = true;
                            }
                          },
                          icon: Icon(
                            employeeProfileController.isObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromRGBO(117, 131, 141, 1),
                            size: 24.r(context),
                          ),
                          padding: EdgeInsets.only(right: 16.w(context)),
                        ),
                      ),
        
        
                      SpaceHelperClass.v(16.h(context)),
        
                      TextHelperClass.headingText(
                        context: context,
                        text: "New Password",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),
        
                      SpaceHelperClass.v(8.h(context)),
        
        
        
                      CustomTextFormFieldClass.build(
                        context: context,
                        obscureText: employeeProfileController.isConfirmObscureText.value,
                        controller: employeeProfileController.confirmPasswordController.value,
                        hintText: 'New Password',
                        keyboardType: TextInputType.text,
                        borderRadius: 10,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.vpm(context),
                          horizontal: 12.hpm(context),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if(employeeProfileController.isConfirmObscureText.value == true) {
                              employeeProfileController.isConfirmObscureText.value = false;
                            } else {
                              employeeProfileController.isConfirmObscureText.value = true;
                            }
                          },
                          icon: Icon(
                            employeeProfileController.isConfirmObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromRGBO(117, 131, 141, 1),
                            size: 24.r(context),
                          ),
                          padding: EdgeInsets.only(right: 16.w(context)),
                        ),
                      ),

                      SpaceHelperClass.v(24.h(context)),


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
                          if(employeeProfileController.passwordController.value.text == "") {
                            kSnackBar(message: "Please enter old password", bgColor: AppColors.red);
                          } else if(employeeProfileController.confirmPasswordController.value.text == "") {
                            kSnackBar(message: "Please enter new password", bgColor: AppColors.red);
                          } else {
                            employeeProfileController.isSubmit.value = true;
                            await employeeProfileController.changePassword(
                              oldPassword: employeeProfileController.passwordController.value.text,
                              newPassword: employeeProfileController.confirmPasswordController.value.text,
                            );
                          }
                        },
                      ),
        
                    ],
                  ),
                ),
              )
        
            ],
          ),
        ),
      )),
    );
  }
}
