import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/supervisor/controller/create_employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmployeeListView extends StatelessWidget {
  EmployeeListView({super.key});


  final CreateEmployeeController createEmployeeController = Get.put(CreateEmployeeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          child: Column(
            children: [

              SpaceHelperClass.v(30.h(context)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Expanded(
                    child: TextHelperClass.headingText(
                      context: context,
                      text: "Employee List",
                      fontSize: 22,
                      textColor: AppColors.black255,
                      fontWeight: FontWeight.w700,
                    ),
                  ),



                  CustomButtonHelper.textWithIconButton(
                    context: context,
                    width: 105,
                    height: 40,
                    minHeight: 40,
                    minWidth: 105,
                    textContainerWidth: 69.w(context),
                    onPressed: () async {
                      showDialog(
                        context: context,
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
                              height: 812.h(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Add New Employee",
                                    fontSize: 22,
                                    textColor: AppColors.black255,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  SpaceHelperClass.v(16.h(context)),


                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Select Employee",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SpaceHelperClass.v(8.h(context)),
                                  CustomDropdownHelperClass<String>(
                                    value: createEmployeeController.selectEmployeeType.value == "" ? null : createEmployeeController.selectEmployeeType.value,
                                    items: createEmployeeController.employeeType,
                                    onChanged: (value) {
                                      createEmployeeController.selectEmployeeType.value = value!;
                                      if(value == "Supervisor") {
                                        createEmployeeController.sendEmployeeType.value = "supervisor";
                                      } else {
                                        createEmployeeController.sendEmployeeType.value = "manager";
                                      }
                                    },
                                    hintText: "Select Employee",
                                  ),


                                  SpaceHelperClass.v(16.h(context)),
                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "User Name",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SpaceHelperClass.v(8.h(context)),
                                  CustomTextFormFieldClass.build(
                                    context: context,
                                    controller: createEmployeeController.nameController.value,
                                    hintText: "Enter user Name",
                                    textColor: Color.fromRGBO(173, 174, 188, 1),
                                    borderColor: Color.fromRGBO(229, 231, 235, 1),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.hpm(context),
                                      vertical: 12.vpm(context),
                                    ),
                                    borderRadius: 8,
                                    keyboardType: TextInputType.text,
                                  ),


                                  SpaceHelperClass.v(16.h(context)),
                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Employee Id",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SpaceHelperClass.v(8.h(context)),
                                  CustomTextFormFieldClass.build(
                                    context: context,
                                    controller: createEmployeeController.employeeIdController.value,
                                    hintText: "798240",
                                    textColor: Color.fromRGBO(173, 174, 188, 1),
                                    borderColor: Color.fromRGBO(229, 231, 235, 1),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.hpm(context),
                                      vertical: 12.vpm(context),
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
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SpaceHelperClass.v(8.h(context)),
                                  CustomTextFormFieldClass.build(
                                    context: context,
                                    controller: createEmployeeController.emailController.value,
                                    hintText: "email@example.com",
                                    textColor: Color.fromRGBO(173, 174, 188, 1),
                                    borderColor: Color.fromRGBO(229, 231, 235, 1),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.hpm(context),
                                      vertical: 12.vpm(context),
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
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SpaceHelperClass.v(8.h(context)),
                                  CustomTextFormFieldClass.buildIntlPhoneField(
                                    context: context,
                                    controller: createEmployeeController.phoneController.value,
                                    hintText: "XXXXXXXXXXX",
                                    textColor: Color.fromRGBO(173, 174, 188, 1),
                                    borderColor: Color.fromRGBO(229, 231, 235, 1),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.hpm(context),
                                      vertical: 12.vpm(context),
                                    ),
                                    borderRadius: 8,
                                    initialCountryCode: 'US',
                                    onChanged: (phone) {
                                      createEmployeeController.phoneNumber.value = phone.completeNumber;
                                    },
                                  ),


                                  SpaceHelperClass.v(16.h(context)),
                                  TextHelperClass.headingText(
                                    context: context,
                                    text:"Set Password",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(75, 85, 99, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SpaceHelperClass.v(8.h(context)),
                                  CustomTextFormFieldClass.build(
                                    context: context,
                                    obscureText: createEmployeeController.isObscureText.value,
                                    controller: createEmployeeController.passwordController.value,
                                    hintText: 'Set Password', textColor: Color.fromRGBO(173, 174, 188, 1),
                                    borderColor: Color.fromRGBO(229, 231, 235, 1),
                                    keyboardType: TextInputType.text,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.hpm(context),
                                      vertical: 12.vpm(context),
                                    ),
                                    borderRadius: 8,
                                    suffixIcon: IconButton(
                                      onPressed: () async {
                                        if(createEmployeeController.isObscureText.value == true) {
                                          createEmployeeController.isObscureText.value = false;
                                        } else {
                                          createEmployeeController.isObscureText.value = true;
                                        }
                                      },
                                      icon: Icon(
                                        createEmployeeController.isObscureText.value == true ? Icons.visibility_off : Icons.visibility,
                                        color: const Color.fromRGBO(117, 131, 141, 1),
                                        size: 24.r(context),
                                      ),
                                      padding: EdgeInsets.only(right: 16.w(context)),
                                    ),
                                  ),


                                  const Spacer(),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text("Cancel"),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF007BFF),
                                          ),
                                          onPressed: () {},
                                          child: const Text("Add Employee"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                        },
                      );
                    },
                    text: "Add New",
                    icon: Icons.add,
                    iconSize: 19.r(context),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),


                ],
              ),

              SpaceHelperClass.v(18.h(context)),

              CustomTextFormFieldClass.build(
                context: context,
                controller: createEmployeeController.searchController.value,
                hintText: "Search Project...",
                textColor: Color.fromRGBO(173, 174, 188, 1),
                borderColor: Color.fromRGBO(229, 231, 235, 1),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.hpm(context),
                  vertical: 10.vpm(context),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.vpm(context),
                    horizontal: 12.hpm(context),
                  ),
                  child: ImageHelperClass.customImageContainer(
                    context: context,
                    height: 16.h(context),
                    width: 16.w(context),
                    imagePath: AppImages.searchNormal,
                    imageFit: BoxFit.contain,
                    fit: BoxFit.contain,
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              ),

              // Container(
              //   width: 375.w(context),
              //   height: 50.h(context),
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: const Color(0xFFD8D8D8).withOpacity(0.5),
              //         width: 1,
              //       ),
              //     ),
              //   ),
              //   child: TabBar(
              //     controller: _tabController,
              //     labelColor: Color.fromRGBO(38, 50, 56, 1),
              //     unselectedLabelColor: Color.fromRGBO(114, 114, 114, 1),
              //     indicatorColor: Color.fromRGBO(38, 50, 56, 1),
              //     tabAlignment: TabAlignment.center,
              //     indicatorWeight: 1,
              //     tabs: roles.map((e) => Tab(
              //       text: "${e}",
              //     )).toList(),
              //   ),
              // )



            ],
          ),
        ),
      ),
    );
  }
}


