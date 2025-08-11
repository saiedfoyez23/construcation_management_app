import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:construction_management_app/modules/setting/view/about_us.dart';
import 'package:construction_management_app/modules/setting/view/privacy_policy_screen.dart';
import 'package:construction_management_app/modules/profile/controller/profile_controller.dart';
import 'package:construction_management_app/modules/profile/view/edit_profile_screen.dart';
import 'package:construction_management_app/modules/profile/view/change_password_screen.dart';
import 'package:construction_management_app/modules/profile/view/widget/profile_view_card.dart';
import 'package:construction_management_app/modules/subscription/view/subscription_screen.dart';
import 'package:construction_management_app/modules/setting/view/teams_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image; // Store the selected image
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle errors (e.g., permission denied)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
    }
  }

  // Show dialog to choose between camera and gallery
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Select Image Source'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
                child: Text('Camera'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
                child: Text('Gallery'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.background,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // CircleAvatar(
                  //   radius: 70,
                  //   backgroundImage:
                  //       _image != null
                  //           ? FileImage(_image!)
                  //           : NetworkImage(
                  //                 profileController
                  //                         .profileData
                  //                         .value
                  //                         ?.data
                  //                         ?.user
                  //                         ?.image ??
                  //                     AppImages.profile,
                  //               )
                  //               as ImageProvider,
                  // ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        _image != null
                            ? FileImage(_image!)
                            : profileController
                                    .profileData
                                    .value
                                    ?.data
                                    ?.user
                                    ?.image !=
                                null
                            ? NetworkImage(
                              profileController
                                  .profileData
                                  .value!
                                  .data!
                                  .user!
                                  .image!,
                            )
                            : AssetImage(AppImages.profile) as ImageProvider,
                  ),

                  Positioned(
                    left: 90,
                    top: 100,
                    child: IconButton(
                      onPressed: _showImageSourceDialog, // Trigger image picker
                      icon: Image.asset(AppImages.edit, height: 22, width: 22),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Get.to(() => EditProfileScreen());
                },
                child: ProfileViewCard(text: 'Edit Profile'),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.to(() => ChangePasswordScreen());
                },
                child: ProfileViewCard(
                  icon: Icon(Icons.lock, color: AppColors.blue),
                  text: 'Change Password',
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.to(() => SubscriptionScreen());
                },
                child: ProfileViewCard(
                  icon: Icon(Icons.add_card_outlined, color: AppColors.blue),
                  text: 'Subscription',
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.to(() => TeamsConditionScreen());
                },
                child: ProfileViewCard(
                  icon: Icon(Icons.file_copy_outlined, color: AppColors.blue),
                  text: 'Terms and Conditions',
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.to(() => PrivacyPolicyScreen());
                },
                child: ProfileViewCard(
                  icon: Icon(Icons.security, color: AppColors.blue),
                  text: 'Privacy and Policy',
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.to(() => AboutUsScreen());
                },
                child: ProfileViewCard(
                  icon: Icon(Icons.outbond_outlined, color: AppColors.blue),
                  text: 'About Us',
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: AppColors.white,
                      content: Container(
                        height: 150,
                        width: 340,
                        decoration: BoxDecoration(color: AppColors.white),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomTextWidget(
                                  title: "Confirm logout",
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 15),
                            CustomTextWidget(
                              title: "Are you sure want to log out",
                              color: AppColors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: CustomButtonWidget(
                                    height: 35,
                                    width: 90,
                                    title: "Cancel",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    cardColor: AppColors.white,
                                    border: Border.all(
                                      color: AppColors.lightGray,
                                    ),
                                    color: AppColors.blue,
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => SignInScreen());
                                  },
                                  child: CustomButtonWidget(
                                    height: 35,
                                    width: 90,
                                    title: "Ok",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    cardColor: AppColors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: ProfileViewCard(
                  icon: Icon(Icons.logout, color: AppColors.blue),
                  text: 'Log Out',
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
