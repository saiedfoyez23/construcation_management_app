import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/supervisor/controller/create_employee_controller.dart';
import 'package:construction_management_app/modules/company_user/supervisor/view/employee_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmployeeListView extends StatelessWidget {
  EmployeeListView({super.key});

  final CreateEmployeeController createEmployeeController = Get.put(CreateEmployeeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          child: createEmployeeController.isLoading.value == true ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          Column(
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
                    height: 40,
                    onPressed: () async {
                      await createEmployeeController.onRefresh();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
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
                                    hintText: "Enter Employee Id",
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
                                            await createEmployeeController.onRefresh();
                                            Get.back();
                                          },
                                        ),
                                      ),

                                      SpaceHelperClass.h(12.w(context)),


                                      Expanded(
                                        child: createEmployeeController.isLoading.value == true ?
                                        CustomLoaderButton().customLoaderButton(
                                          backgroundColor: Colors.transparent,
                                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                          height: 50,
                                          context: context,
                                        ) :
                                        CustomButtonHelper.customRoundedButton(
                                          context: context,
                                          text: "Add Employee",
                                          fontSize: 16,
                                          textColor: Color.fromRGBO(255, 255, 255, 1),
                                          fontWeight: FontWeight.w600,
                                          borderRadius: 8,
                                          backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                          onPressed: () async {
                                            if(createEmployeeController.nameController.value.text == "") {
                                              kSnackBar(message: "Please enter employee name", bgColor: AppColors.red);
                                            } else if(createEmployeeController.employeeIdController.value.text == "") {
                                              kSnackBar(message: "Please enter employee Id", bgColor: AppColors.red);
                                            } else if(createEmployeeController.emailController.value.text == "") {
                                              kSnackBar(message: "Please enter employee email", bgColor: AppColors.red);
                                            } else if(createEmployeeController.phoneController.value.text == "") {
                                              kSnackBar(message: "Please enter employee phone number", bgColor: AppColors.red);
                                            } else if(createEmployeeController.passwordController.value.text == "") {
                                              kSnackBar(message: "Please enter employee password", bgColor: AppColors.red);
                                            } else if(createEmployeeController.sendEmployeeType.value == "") {
                                              kSnackBar(message: "Please enter employee type", bgColor: AppColors.red);
                                            } else {
                                              createEmployeeController.selectedIndex.value = 3;
                                              Map<String,dynamic> data = {
                                                "type": createEmployeeController.sendEmployeeType.value, // supervisor or manager
                                                "name": createEmployeeController.nameController.value.text,
                                                "employee_id": createEmployeeController.employeeIdController.value.text,
                                                "email": createEmployeeController.emailController.value.text,
                                                "phone": createEmployeeController.phoneNumber.value,
                                                "password": createEmployeeController.passwordController.value.text,
                                              };
                                              print(data);
                                              createEmployeeController.isLoading.value = true;
                                              await createEmployeeController.createEmployeeController(data: data);
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
                hintText: "Search Employee...",
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
                onChanged: (value) async {
                  createEmployeeController.selectedIndex.value = 3;
                  if(value == "") {
                    await createEmployeeController.getAllCompanyEmployeeController();
                  } else {
                    await createEmployeeController.getAllCompanyEmployeeSearchController(name: value!);
                  }
                },
              ),

              SpaceHelperClass.v(18.h(context)),

              Container(
                width: 375.w(context),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.w(context),
                      color: Color.fromRGBO(216, 216, 216, 0.5),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Supervisor tab

                        Expanded(
                          child: Container(
                            height: 38.h(context),
                            decoration:BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.w(context),
                                  color: createEmployeeController.selectedIndex.value == 0 ? AppColors.black38 : Colors.transparent,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                createEmployeeController.selectedIndex.value = 0;
                                await createEmployeeController.getAllCompanyEmployeeByTypeController(type: "supervisor");
                              },
                              child: Column(
                                children: [
                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Supervisor",
                                    alignment: Alignment.center,
                                    textAlign: TextAlign.center,
                                    fontSize: 16,
                                    textColor: createEmployeeController.selectedIndex.value == 0 ? AppColors.black38 : Color.fromRGBO(114, 114, 114, 1),
                                    fontWeight: createEmployeeController.selectedIndex.value == 0 ? FontWeight.w700 : FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Project Manager tab

                        SpaceHelperClass.h(12.w(context)),

                        Expanded(
                          child: Container(
                            height: 38.h(context),
                            decoration:BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.w(context),
                                  color: createEmployeeController.selectedIndex.value == 1 ? AppColors.black38 : Colors.transparent,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                createEmployeeController.selectedIndex.value = 1;
                                await createEmployeeController.getAllCompanyEmployeeByTypeController(type: "manager");
                              },
                              child: Column(
                                children: [
                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Project Manager",
                                    alignment: Alignment.center,
                                    textAlign: TextAlign.center,
                                    fontSize: 16,
                                    textColor: createEmployeeController.selectedIndex.value == 1 ? AppColors.black38 : Color.fromRGBO(114, 114, 114, 1),
                                    fontWeight: createEmployeeController.selectedIndex.value == 1 ? FontWeight.w700 : FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

              SpaceHelperClass.v(18.h(context)),

              createEmployeeController.isTypeLoading.value == true ?
              Expanded(
                child: CustomLoaderButton().customLoaderButton(
                  backgroundColor: Colors.transparent,
                  loaderColor: Color.fromRGBO(38, 50, 56, 1),
                  height: 812,
                  context: context,
                ),
              ) :
              Expanded(
                child: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?.isEmpty == true ||
                    createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data == null ?
                TextHelperClass.headingText(
                  context: context,
                  text: "No Employee Available",
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  textColor: Color.fromRGBO(114, 114, 114, 1),
                  fontWeight: FontWeight.w700,
                ) :
                PageView(
                  controller: createEmployeeController.pageController.value,
                  onPageChanged: (index) async {
                    print(index);
                    if(createEmployeeController.selectedIndex.value == 1) {
                      createEmployeeController.selectedIndex.value = 0;
                      await createEmployeeController.getAllCompanyEmployeeByTypeController(type: "supervisor");
                    } else {
                      createEmployeeController.selectedIndex.value = 1;
                      await createEmployeeController.getAllCompanyEmployeeByTypeController(type: "manager");
                    }
                  },
                  children: [
                    ListView.builder(
                      itemCount: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?.length,
                      itemBuilder: (context,int index) {
                        return Container(
                          width: 375.w(context),
                          margin: EdgeInsets.only(
                              bottom: 12.bpm(context)
                          ),
                          padding: EdgeInsets.fromLTRB(
                            16.0.lpm(context),
                            12.0.tpm(context),
                            16.0.rpm(context),
                            12.0.bpm(context),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0.r(context)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(4, 6, 15, 0.05),
                                blurRadius: 60.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.r(context),
                                      backgroundImage: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].image != null
                                          ? NetworkImage(createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].image) : null,
                                      backgroundColor: Colors.grey[300],
                                      child: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].image == null ?
                                      Icon(
                                        Icons.person,
                                        size: 48.r(context),
                                        color: Colors.white,
                                      ) : null,
                                    ),
                                    SpaceHelperClass.h(8.w(context)),


                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextHelperClass.headingText(
                                            context: context,
                                            text: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].name ?? "" ,
                                            fontSize: 22,
                                            textColor: AppColors.black255,
                                            fontWeight: FontWeight.w500,
                                          ),

                                          TextHelperClass.headingText(
                                            context: context,
                                            text: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].type ?? "" ,
                                            fontSize: 16,
                                            textColor: Color.fromRGBO(75, 85, 99, 1),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ),

                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_outlined,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        createEmployeeController.isLoading.value = true;
                                        await createEmployeeController.deleteEmployeeDetailsController(
                                            employeeId: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].sId);
                                      },
                                      iconSize: 25.r(context),
                                    ),
                                  ],
                                ),


                                Padding(
                                  padding: EdgeInsets.only(left: 80.lpm(context)),
                                  child: CustomButtonHelper.customTextButton(
                                    context: context,
                                    textColor: Color.fromRGBO(37, 99, 235, 1),
                                    fontSize: 20,
                                    text: 'View Details >',
                                    onPressed: () {
                                      Get.off(()=>EmployeeDetailsView(employeeId: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].sId,), preventDuplicates: false,);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?.length,
                      itemBuilder: (context,int index) {
                        return Container(
                          width: 375.w(context),
                          margin: EdgeInsets.only(
                              bottom: 12.bpm(context)
                          ),
                          padding: EdgeInsets.fromLTRB(
                            16.0.lpm(context),
                            12.0.tpm(context),
                            16.0.rpm(context),
                            12.0.bpm(context),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0.r(context)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(4, 6, 15, 0.05),
                                blurRadius: 60.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.r(context),
                                      backgroundImage: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].image != null
                                          ? NetworkImage(createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].image) : null,
                                      backgroundColor: Colors.grey[300],
                                      child: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].image == null ?
                                      Icon(
                                        Icons.person,
                                        size: 48.r(context),
                                        color: Colors.white,
                                      ) : null,
                                    ),
                                    SpaceHelperClass.h(8.w(context)),


                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextHelperClass.headingText(
                                            context: context,
                                            text: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].name ?? "" ,
                                            fontSize: 22,
                                            textColor: AppColors.black255,
                                            fontWeight: FontWeight.w500,
                                          ),

                                          TextHelperClass.headingText(
                                            context: context,
                                            text: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].type ?? "" ,
                                            fontSize: 16,
                                            textColor: Color.fromRGBO(75, 85, 99, 1),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ),

                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_outlined,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        createEmployeeController.isLoading.value = true;
                                        await createEmployeeController.deleteEmployeeDetailsController(
                                            employeeId: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].sId);
                                      },
                                      iconSize: 25.r(context),
                                    ),
                                  ],
                                ),


                                Padding(
                                  padding: EdgeInsets.only(left: 80.lpm(context)),
                                  child: CustomButtonHelper.customTextButton(
                                    context: context,
                                    textColor: Color.fromRGBO(37, 99, 235, 1),
                                    fontSize: 20,
                                    text: 'View Details >',
                                    onPressed: () {
                                      Get.off(()=>EmployeeDetailsView(employeeId: createEmployeeController.getAllCompanyEmployeeResponseModel.value.data?.data?[index].sId,), preventDuplicates: false,);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),



            ],
          ),
        )),
      ),
    );
  }
}


