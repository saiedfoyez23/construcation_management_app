import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

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
          child: profileController.isLoading.value == true  ?
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
                                  profileController.showImageSourceDialog(context: context);
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
                        text: profileController.profileResponseModel.value.data?.user?.name ?? "",
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
                        controller: profileController.nameController.value,
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
                        controller: profileController.companyController.value,
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
                        text: "Company logo",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),

                      SpaceHelperClass.v(8.h(context)),


                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          profileController.logoFile.value.path == "" ?
                          Container(
                            height: 180.h(context),
                            width: 375.w(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.black38,
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${profileController.profileResponseModel.value.data?.user?.logo ?? ""}', // VW logo URL
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ) : Container(
                            height: 180.h(context),
                            width: 375.w(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.black38,
                              image: DecorationImage(
                                image: FileImage(profileController.logoFile.value),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 142.bpm(context),
                            right: 4.rpm(context),
                            child: ImageHelperClass.customImageButtonContainer(
                              onPressed: () async {
                                await profileController.pickFile();
                              },
                              context: context,
                              height: 35.h(context),
                              width: 35.w(context),
                              imagePath: AppImages.whiteEditIcon,
                              imageFit: BoxFit.contain,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
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
                        controller: profileController.emailController.value,
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
                      CustomTextFormFieldClass.buildIntlPhoneField(
                        context: context,
                        controller: profileController.phoneNumberController.value,
                        hintText: "Phone number",
                        textColor: Color.fromRGBO(173, 174, 188, 1),
                        borderColor: Color.fromRGBO(229, 231, 235, 1),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.hpm(context),
                          vertical: 12.vpm(context),
                        ),
                        borderRadius: 8,
                        initialCountryCode: 'US',
                        onChanged: (phone) {
                          profileController.phoneNumber.value = phone.completeNumber;
                        },
                      ),


                      SpaceHelperClass.v(16.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: "Location",
                        fontSize: 16,
                        textColor: Color.fromRGBO(75, 85, 99, 1),
                        fontWeight: FontWeight.w600,
                      ),

                      SpaceHelperClass.v(8.h(context)),

                      CustomTextFormFieldClass.build(
                        context: context,
                        controller: profileController.locationController.value,
                        hintText: "Enter company location",
                        borderColor: Color.fromRGBO(229, 231, 235, 1),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.hpm(context),
                          vertical: 8.vpm(context),
                        ),
                        borderRadius: 8,
                        keyboardType: TextInputType.text,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.vpm(context),
                            horizontal: 16.hpm(context),
                          ),
                          child: ImageHelperClass.customImageContainer(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imagePath: AppImages.locationIconLight,
                            imageFit: BoxFit.contain,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SpaceHelperClass.v(32.h(context)),


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
                          // if(createProjectController.clientNameController.value.text == "") {
                          //   kSnackBar(message: "Please enter client name", bgColor: AppColors.red);
                          // } else if(createProjectController.projectNameController.value.text == "") {
                          //   kSnackBar(message: "Please enter project name", bgColor: AppColors.red);
                          // } else if(createProjectController.locationController.value.text == "") {
                          //   kSnackBar(message: "Please enter project location", bgColor: AppColors.red);
                          // } else if(createProjectController.timelineController.value.text == "") {
                          //   kSnackBar(message: "Please enter timeline", bgColor: AppColors.red);
                          // } else if(createProjectController.supervisorCompanyEmployee.value.name == null) {
                          //   kSnackBar(message: "Please select supervisor", bgColor: AppColors.red);
                          // } else if(createProjectController.managerCompanyEmployee.value.name == null) {
                          //   kSnackBar(message: "Please select manager", bgColor: AppColors.red);
                          // } else {
                          //   Map<String,dynamic> data = {
                          //     "client_name": createProjectController.clientNameController.value.text,
                          //     "name": createProjectController.projectNameController.value.text,
                          //     "location": createProjectController.locationController.value.text,
                          //     "timeline": createProjectController.timelineController.value.text,
                          //     "note": createProjectController.noteController.value.text,
                          //     "supervisor": createProjectController.supervisorCompanyEmployee.value.sId,
                          //     "manager": createProjectController.managerCompanyEmployee.value.sId
                          //   };
                          //   print(data);
                          //   createProjectController.isSubmit.value = true;
                          //   await createProjectController.createProjectController(data: data);
                          // }
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
