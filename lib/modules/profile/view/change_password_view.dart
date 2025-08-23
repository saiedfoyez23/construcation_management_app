import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final ProfileController profileController = Get.put(ProfileController());

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
          child:  profileController.isLoading.value == true  ?
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
                  Get.off(()=>DashboardView(index: 4),preventDuplicates: false);
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
                          profileController.imageFile.value.path == "" ?
                          CircleAvatar(
                            radius: 100.r(context),
                            backgroundImage: profileController.profileResponseModel.value.data?.user?.image != null
                                ? NetworkImage(profileController.profileResponseModel.value.data?.user?.image) : null,
                            backgroundColor: Colors.grey[300],
                            child: profileController.profileResponseModel.value.data?.user?.image == null ?
                            Icon(
                              Icons.person,
                              size: 48.r(context),
                              color: Colors.white,
                            ) : null,
                          ) :
                          CircleAvatar(
                            radius: 100.r(context),
                            backgroundImage: FileImage(profileController.imageFile.value),
                            backgroundColor: Colors.grey,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 111.lpm(context),
                            right: 10.rpm(context),
                            child: ImageHelperClass.customImageButtonContainer(
                              onPressed: () async {
                                profileController.showImageSourceUploadDialog(
                                  context: context,
                                  name: profileController.profileResponseModel.value.data?.user?.name ?? "",
                                  phone: profileController.profileResponseModel.value.data?.user?.phone ?? "",
                                  companyName: profileController.profileResponseModel.value.data?.user?.companyName ?? "",
                                  email: profileController.profileResponseModel.value.data?.user?.email ?? "",
                                  location: profileController.profileResponseModel.value.data?.user?.location ?? "",
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
                        text: profileController.profileResponseModel.value.data?.user?.name ?? "",
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
                        obscureText: profileController.isObscureText.value,
                        controller: profileController.passwordController.value,
                        hintText: 'Old Password',
                        keyboardType: TextInputType.text,
                        borderRadius: 10,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.vpm(context),
                          horizontal: 12.hpm(context),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if(profileController.isObscureText.value == true) {
                              profileController.isObscureText.value = false;
                            } else {
                              profileController.isObscureText.value = true;
                            }
                          },
                          icon: Icon(
                            profileController.isObscureText.value == true ? Icons.visibility_off : Icons.visibility,
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
                        obscureText: profileController.isConfirmObscureText.value,
                        controller: profileController.confirmPasswordController.value,
                        hintText: 'New Password',
                        keyboardType: TextInputType.text,
                        borderRadius: 10,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.vpm(context),
                          horizontal: 12.hpm(context),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if(profileController.isConfirmObscureText.value == true) {
                              profileController.isConfirmObscureText.value = false;
                            } else {
                              profileController.isConfirmObscureText.value = true;
                            }
                          },
                          icon: Icon(
                            profileController.isConfirmObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                            color: const Color.fromRGBO(117, 131, 141, 1),
                            size: 24.r(context),
                          ),
                          padding: EdgeInsets.only(right: 16.w(context)),
                        ),
                      ),

                      SpaceHelperClass.v(24.h(context)),


                      profileController.isSubmit.value == true ?
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
                          if(profileController.passwordController.value.text == "") {
                            kSnackBar(message: "Please enter old password", bgColor: AppColors.red);
                          } else if(profileController.confirmPasswordController.value.text == "") {
                            kSnackBar(message: "Please enter new password", bgColor: AppColors.red);
                          } else {
                            profileController.isSubmit.value = true;
                            await profileController.changePassword(
                              oldPassword: profileController.passwordController.value.text,
                              newPassword: profileController.confirmPasswordController.value.text,
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
