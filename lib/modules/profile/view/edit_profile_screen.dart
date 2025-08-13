import 'dart:developer';
import 'dart:io';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import "package:path/path.dart" as path;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // State variables to hold selected images
  File? _image;
  File? _logo;

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companynameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Get the ProfileController instance
  final ProfileController profileController = Get.find<ProfileController>();

  // Variable to store the complete phone number with country code
  String? completePhoneNumber;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with profile data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateControllers();
    });
  }

  void _updateControllers() {
    final controller = Get.find<ProfileController>();
    nameController.text = controller.profileData.value?.data?.user?.name ?? '';
    companynameController.text =
        controller.profileData.value?.data?.user?.companyName ?? '';
    emailController.text =
        controller.profileData.value?.data?.user?.email ?? '';
    phoneController.text =
        controller.profileData.value?.data?.user?.phone?.replaceAll(
          RegExp(r'^\+\d+'),
          '',
        ) ??
        '';
    completePhoneNumber = controller.profileData.value?.data?.user?.phone ?? '';
    locationController.text =
        controller.profileData.value?.data?.user?.location ?? '';
    // Reset local image files to avoid stale data
    setState(() {
      _image = null;
      _logo = null;
    });
  }

  // Function to validate file types
  bool _isValidFileType(File file) {
    final validMimeTypes = [
      'image/jpeg',
      'image/png',
      'image/jpg',
    ]; // Add video MIME types if needed
    final mimeType = lookupMimeType(file.path);
    final extension = path.extension(file.path).toLowerCase();
    log('File: ${file.path}, MIME: $mimeType, Extension: $extension');
    return mimeType != null &&
        validMimeTypes.contains(mimeType) &&
        ['.jpg', '.jpeg', '.png'].contains(extension);
  }

  // Function to show a bottom sheet for selecting image source
  Future<void> _showImageSourceDialog({required bool isProfile}) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.black),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(source: ImageSource.gallery, isProfile: isProfile);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt, color: AppColors.black),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(source: ImageSource.camera, isProfile: isProfile);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to pick an image from the selected source
  Future<void> _pickImage({
    required ImageSource source,
    required bool isProfile,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 512, // Reduce resolution for performance
        maxHeight: 512,
        imageQuality: 85, // Reduce quality for smaller file size
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        if (_isValidFileType(file)) {
          setState(() {
            if (isProfile) {
              _image = file;
            } else {
              _logo = file;
            }
          });
        } else {
          kSnackBar(
            message: 'Invalid file type. Please select a JPG or PNG image.',
            bgColor: AppColors.red,
          );
        }
      }
    } catch (e) {
      log('Error picking image: $e');
      kSnackBar(message: 'Failed to pick image: $e', bgColor: AppColors.red);
    }
  }

  // Validate phone number
  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 6) {
      return 'Phone number is too short';
    }
    return null;
  }

  // Validate text fields
  String? validateTextField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.background,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      body: Obx(
        () =>
            profileController.isLoading.value == true
                ? Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
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
                                        : AssetImage(AppImages.profile)
                                            as ImageProvider,
                              ),
                              Positioned(
                                left: 90,
                                top: 100,
                                child: IconButton(
                                  onPressed:
                                      () => _showImageSourceDialog(
                                        isProfile: true,
                                      ),
                                  icon: Image.asset(
                                    AppImages.edit,
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Personal Details",
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Full Name",
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            controller: nameController,
                            hintText: "Fahim",
                            fillColor: AppColors.white,
                            // validator: (value) => _validateTextField(value, "Full Name"),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Company Name",
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            controller: companynameController,
                            hintText: "bd calling",
                            fillColor: AppColors.white,
                            // validator: (value) => _validateTextField(value, "Company Name"),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Company Logo",
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              _logo != null
                                  ? Image.file(
                                    _logo!,
                                    height: 192,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                  : profileController
                                          .profileData
                                          .value
                                          ?.data
                                          ?.user
                                          ?.logo !=
                                      null
                                  ? Image.network(
                                    profileController
                                        .profileData
                                        .value!
                                        .data!
                                        .user!
                                        .logo!,
                                    height: 192,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(
                                    AppImages.companylogo,
                                    height: 192,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                              Positioned(
                                top: 15,
                                right: 15,
                                child: GestureDetector(
                                  onTap:
                                      () => _showImageSourceDialog(
                                        isProfile: false,
                                      ),
                                  child: Image.asset(
                                    AppImages.edit,
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Email",
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            controller: emailController,
                            hintText: "sta@gmail.com",
                            fillColor: AppColors.white,
                            readOnly: true,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Phone Number",
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          IntlPhoneField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              fillColor: AppColors.white,
                              filled: true,
                              hintText: 'Enter phone number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.gray),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.red),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 15,
                              ),
                            ),
                            initialCountryCode:
                                profileController
                                            .profileData
                                            .value
                                            ?.data
                                            ?.user
                                            ?.phone !=
                                        null
                                    ? null
                                    : 'IN',
                            initialValue:
                                profileController
                                    .profileData
                                    .value
                                    ?.data
                                    ?.user
                                    ?.phone,
                            onChanged: (PhoneNumber phone) {
                              log(
                                'Complete phone number: ${phone.completeNumber}',
                              );
                              completePhoneNumber = phone.completeNumber;
                            },
                            onCountryChanged: (country) {
                              log(
                                'Country changed to: ${country.name} (${country.code})',
                              );
                              phoneController.clear();
                              completePhoneNumber = null;
                            },
                            //validator: _validatePhoneNumber,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            dropdownIcon: Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.gray,
                            ),
                            dropdownTextStyle: TextStyle(
                              color: AppColors.black,
                            ),
                            style: TextStyle(color: AppColors.black),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomTextWidget(
                                title: "Location",
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            controller: locationController,
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: AppColors.gray,
                            ),
                            hintText: "London park",
                            fillColor: AppColors.white,
                            //validator: (value) => _validateTextField(value, "Location"),
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => CustomButtonWidget(
                              height: 45,
                              title:
                                  profileController.isLoading.value
                                      ? "Saving..."
                                      : "Save Changes",
                              borderRadius: BorderRadius.circular(22),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              //isLoading: profileController.isLoading.value,
                              onTap:
                                  profileController.isLoading.value
                                      ? null
                                      : () async {
                                        if (_formKey.currentState!.validate()) {
                                          // Additional file validation
                                          if (_image != null &&
                                              !_isValidFileType(_image!)) {
                                            kSnackBar(
                                              message:
                                                  'Invalid profile image type. Please select a JPG or PNG image.',
                                              bgColor: AppColors.red,
                                            );
                                            return;
                                          }
                                          if (_logo != null &&
                                              !_isValidFileType(_logo!)) {
                                            kSnackBar(
                                              message:
                                                  'Invalid company logo type. Please select a JPG or PNG image.',
                                              bgColor: AppColors.red,
                                            );
                                            return;
                                          }
                                          await profileController.putProfileController(
                                            image: _image,
                                            logo: _logo,
                                            name: nameController.text,
                                            phone:
                                                completePhoneNumber ??
                                                phoneController.text,
                                            companyname:
                                                companynameController.text,
                                            location: locationController.text,
                                            onSuccess: (message) {
                                              kSnackBar(
                                                message: message,
                                                bgColor: AppColors.green,
                                              );
                                              _updateControllers();
                                              Get.back();
                                            },
                                            onFail: (message) {
                                              kSnackBar(
                                                message:
                                                    'Failed to update profile: $message',
                                                bgColor: AppColors.red,
                                              );
                                            },
                                            onExceptionFail: (error) {
                                              kSnackBar(
                                                message:
                                                    'Error updating profile: $error',
                                                bgColor: AppColors.red,
                                              );
                                            },
                                          );
                                        }
                                      },
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    companynameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
