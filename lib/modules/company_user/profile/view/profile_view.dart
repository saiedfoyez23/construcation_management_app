import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/profile/controller/profile_controller.dart';
import 'package:construction_management_app/modules/company_user/profile/view/change_password_view.dart';
import 'package:construction_management_app/modules/company_user/profile/view/edit_profile_view.dart';
import 'package:construction_management_app/modules/company_user/profile/view/privacy_and_policy.dart';
import 'package:construction_management_app/modules/company_user/profile/view/terms_and_condition_view.dart';
import 'package:construction_management_app/modules/company_user/subscription/view/subscription_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

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
          child: RefreshIndicator(
            onRefresh: () async {
              Get.off(()=>DashboardView(index: 4),preventDuplicates: false);
            },
            child: profileController.isLoading.value == true  ?
            CustomLoaderButton().customLoaderButton(
              backgroundColor: Colors.transparent,
              loaderColor: Color.fromRGBO(38, 50, 56, 1),
              height: 812,
              context: context,
            ) :
            CustomScrollView(
              slivers: [
        
                SliverAppBar(
                  primary: true,
                  pinned: true,
                  floating: false,
                  centerTitle: true,
                  backgroundColor: AppColors.scaffoldBackGroundColor,
                  title: TextHelperClass.headingText(
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    context: context,
                    text: "Profile",
                    fontSize: 20,
                    textColor: Color.fromRGBO(27, 27, 27, 1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
        
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpaceHelperClass.v(20.h(context)),
                        // Profile picture with edit icon
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
        
                        SpaceHelperClass.v(20.h(context)),
        
                        // List of options
                        _buildListItem(
                          icon: AppImages.editProfileIcon,
                          title: 'Edit Profile',
                          iconColor: Color.fromRGBO(41, 45, 50, 1),
                          onTap: () async {
                            Get.off(()=>EditProfileView(),preventDuplicates: false);
                          },
                          context: context,
                        ),
                        _buildListItem(
                          icon: AppImages.changePasswordIcon,
                          title: 'Change Password',
                          iconColor: Color.fromRGBO(41, 45, 50, 1),
                          onTap: () async {
                            Get.off(()=>ChangePasswordView(),preventDuplicates: false);
                          },
                          context: context,
                        ),
                        _buildListItem(
                          icon: AppImages.subscriptionIcon,
                          title: 'Subscription',
                          iconColor: Color.fromRGBO(41, 45, 50, 1),
                          onTap: () async {
                            Get.off(()=>SubscriptionView(isHome: false),preventDuplicates: false);
                          },
                          context: context,
                        ),
                        _buildListItem(
                          icon: AppImages.termsAndConditionsIcon,
                          title: 'Terms and conditions',
                          iconColor: Color.fromRGBO(41, 45, 50, 1),
                          onTap: () async {
                            Get.off(()=>TermsAndConditionView(),preventDuplicates: false);
                          },
                          context: context,
                        ),
                        _buildListItem(
                          icon: AppImages.privacyAndPolicyIcon,
                          title: 'Privacy and Policy',
                          iconColor: Color.fromRGBO(41, 45, 50, 1),
                          onTap: () async {
                            Get.off(()=>PrivacyAndPolicy(),preventDuplicates: false);
                          },
                          context: context,
                        ),
                        _buildListItem(
                          icon: AppImages.logOutIcon,
                          title: 'Log Out',
                          iconColor: Color.fromRGBO(41, 45, 50, 1),
                          onTap: () async {
                            showLogoutDialog(context);
                          },
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ),
        
        
        
              ],
            ),
          ),
        ),
      ))
    );
  }

  Widget _buildListItem({
    required BuildContext context,
    required String icon,
    required String title,
    required Color iconColor,
    required Function() onTap
  }) {
    return Container(
      width: 375.w(context), // Using fixed width for demonstration
      margin: EdgeInsets.only(bottom: 12.bpm(context)), // Using fixed margin for demo
      padding: EdgeInsets.fromLTRB(
          16.0.lpm(context), 
          8.0.tpm(context),
          16.0.rpm(context),
          8.0.bpm(context)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r(context)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(4, 6, 15, 0.05),
            blurRadius: 60.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ImageHelperClass.customImageContainer(
          context: context,
          height: 32.h(context),
          width: 36.w(context),
          imagePath: icon,
          imageFit: BoxFit.contain,
          fit: BoxFit.cover,
        ),
        title: TextHelperClass.headingTextWithoutWidth(
          textAlign: TextAlign.center,
          context: context,
          text: title,
          fontSize: 17,
          textColor: Color.fromRGBO(6, 55, 73, 1),
          fontWeight: FontWeight.w600,
        ),
        trailing: Icon(Icons.chevron_right, color: iconColor,size: 32.r(context),),
        onTap: onTap,
      ),
    );
  }


  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure you want to logout?"),
          content: Text("You will be logged out of the app."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                LocalStorage.removeData(key: AppConstant.token);
                LocalStorage.removeData(key: AppConstant.getProfileResponse);
                Get.offAll(()=>SignInView());
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
