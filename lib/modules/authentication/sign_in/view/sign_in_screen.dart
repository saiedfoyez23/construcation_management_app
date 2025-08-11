import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/screen_utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(()=>Container(
            height: 812.h(context),
            width: 375.w(context),
            decoration: BoxDecoration(
                color: AppColors.scaffoldBackGroundColor
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w(context),
              vertical: 20.h(context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h(context)),
        
                Container(
                  height: 102.h(context),
                  width: 102.w(context),
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      AppImages.siteflow1, // Replace with actual logo asset path
                      height: 102.h(context),
                      width: 102.w(context),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        
                SizedBox(height: 20.h(context)),
        
        
                Text(
                  'Sign In to Manage Projects',
                  style: GoogleFonts.albertSans(
                    fontSize: 24.sp(context),
                    color: Color.fromRGBO(35, 47, 48, 1),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 10.hpm(context)),
                Text(
                  'It is quick and easy to log in. Enter your email and password below.',
                  style: GoogleFonts.albertSans(
                    fontSize: 16.sp(context),
                    color: Color.fromRGBO(117, 131, 141, 1),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20.h(context)),
                Container(
                  width: 329.w(context),
                  height: 60.h(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r(context)),
                    border: Border.all(
                      color: const Color.fromRGBO(239, 239, 239, 1),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: signInController.selectedRole.value == "" ? null : signInController.selectedRole.value,
                      hint: Text(
                        'Select your role',
                        style: GoogleFonts.albertSans(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp(context),
                          color: Color.fromRGBO(117, 131, 141, 1),
                        ),
                      ),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 8.w(context)),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 24.r(context),
                          color: const Color.fromRGBO(117, 131, 141, 1),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        right: 16.w(context),
                        top: 11.h(context),
                        bottom: 11.h(context),
                        left: 16.w(context),
                      ),
                      isExpanded: true,
                      items: signInController.roles.map((String role) {
                        return DropdownMenuItem<String>(
                          value: role,
                          child: Text(
                            role,
                            style: GoogleFonts.albertSans(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp(context),
                              color: Color.fromRGBO(117, 131, 141, 1),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        signInController.selectedRole.value = newValue!;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.h(context)),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter company email address', // Hint text
                    hintStyle: GoogleFonts.albertSans(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp(context),
                      color: Color.fromRGBO(117, 131, 141, 1),
                    ),
                    contentPadding: EdgeInsets.only(
                      right: 16.w(context),
                      top: 11.h(context),
                      bottom: 11.h(context),
                      left: 16.w(context),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r(context)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r(context)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r(context)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        width: 1,
                      ),
                    ),
                    fillColor: Color.fromRGBO(255, 255, 255, 1), // Updated background color
                    filled: true,
                  ),
                  style: GoogleFonts.albertSans(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp(context),
                    color: Color.fromRGBO(117, 131, 141, 1),
                  ),
                ),
                SizedBox(height: 10.h(context)),
                TextFormField(
                  obscureText: signInController.isObscureText.value,
                  decoration: InputDecoration(
                    hintText: 'Enter Password', // Hint text
                    hintStyle: GoogleFonts.albertSans(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp(context),
                      color: Color.fromRGBO(117, 131, 141, 1),
                    ),
                    contentPadding: EdgeInsets.only(
                      right: 16.w(context),
                      top: 11.h(context),
                      bottom: 11.h(context),
                      left: 16.w(context),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r(context)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r(context)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.r(context)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(239, 239, 239, 1),
                        width: 1,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if(signInController.isObscureText.value == true) {
                          signInController.isObscureText.value = false;
                        } else {
                          signInController.isObscureText.value = true;
                        }
                      },
                      icon: Icon(
                        signInController.isObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromRGBO(117, 131, 141, 1),
                        size: 24.r(context),
                      ),
                      padding: EdgeInsets.only(right: 16.w(context)),
                    ),
                    fillColor: Color.fromRGBO(255, 255, 255, 1), // Updated background color
                    filled: true,
                  ),
                  style: GoogleFonts.albertSans(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp(context),
                    color: Color.fromRGBO(117, 131, 141, 1),
                  ),
                ),
                SizedBox(height: 10.h(context)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 24.h(context),
                    child: TextButton(
                      onPressed: () {
                        print('Button pressed!');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // Optional border radius
                        ),
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.albertSans(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700, // Bold
                          fontSize: 17.sp(context),
                          color: Color(0xFF1F93FF),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h(context)),
                // Custom text button
                SizedBox(
                  width: 329.w(context),
                  height: 50.h(context),
                  child: TextButton(
                    onPressed: () {
                      print('Button pressed!');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: const Color(0xFFDCDDDF), // rgba(220, 221, 223, 1)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r(context)), // 100px border radius
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
                        style: GoogleFonts.albertSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.sp(context),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h(context)),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child:  RichText(
                      text: TextSpan(
                        style: GoogleFonts.albertSans(
                          fontSize: 17.sp(context),
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(9, 44, 76, 1), // Gray color
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'You don\'t Have an account? ',
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: GoogleFonts.albertSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 17.sp(context),
                              fontWeight: FontWeight.w700, // Bold
                              color: Color.fromRGBO(68, 77, 98, 1),
        
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}