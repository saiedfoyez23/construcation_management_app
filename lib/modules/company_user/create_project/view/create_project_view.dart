import 'dart:convert';
import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/create_project/controller/create_project_controller.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/company_user/supervisor/model/get_all_company_employee_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProjectView extends StatelessWidget {
  CreateProjectView({super.key});
  final CreateProjectController createProjectController = Get.put(CreateProjectController(),);

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
          child: CustomScrollView(
              slivers: [

                CustomAppBarHelper.normalAppBar(
                  context: context,
                  onBackPressed: () {
                    Get.off(()=>DashboardView(index: 1),preventDuplicates: false);
                  },
                  title: 'Create Job',
                ),

        
        
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SpaceHelperClass.v(12.h(context)),


                        Container(
                          width: 375.w(context),
                          padding: EdgeInsets.fromLTRB(
                            16.0.lpm(context),
                            16.0.tpm(context),
                            16.0.rpm(context),
                            16.0.bpm(context),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0.r(context)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(4, 6, 15, 0.05),
                                blurRadius: 60.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [

                              TextHelperClass.headingText(
                                context: context,
                                text: "Client Name",
                                fontSize: 14,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w500,
                              ),

                              SpaceHelperClass.v(8.h(context)),

                              CustomTextFormFieldClass.build(
                                context: context,
                                controller: createProjectController.clientNameController.value,
                                hintText: "Enter Client Name",
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.hpm(context),
                                  vertical: 8.vpm(context),
                                ),
                                borderRadius: 8,
                                keyboardType: TextInputType.text,
                              ),


                              SpaceHelperClass.v(12.h(context)),

                              TextHelperClass.headingText(
                                context: context,
                                text: "Project Name",
                                fontSize: 14,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w500,
                              ),

                              SpaceHelperClass.v(8.h(context)),

                              CustomTextFormFieldClass.build(
                                context: context,
                                controller: createProjectController.projectNameController.value,
                                hintText: "Enter Project Name",
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.hpm(context),
                                  vertical: 8.vpm(context),
                                ),
                                borderRadius: 8,
                                keyboardType: TextInputType.text,
                              ),


                              SpaceHelperClass.v(12.h(context)),

                              TextHelperClass.headingText(
                                context: context,
                                text: "Location",
                                fontSize: 14,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w500,
                              ),

                              SpaceHelperClass.v(8.h(context)),

                              CustomTextFormFieldClass.build(
                                context: context,
                                controller: createProjectController.locationController.value,
                                hintText: "Enter Location",
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.hpm(context),
                                  vertical: 8.vpm(context),
                                ),
                                borderRadius: 8,
                                suffixIcon: Padding(
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
                                keyboardType: TextInputType.text,
                              ),

                              SpaceHelperClass.v(12.h(context)),

                              TextHelperClass.headingText(
                                context: context,
                                text: "Timeline",
                                fontSize: 14,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w500,
                              ),

                              SpaceHelperClass.v(8.h(context)),

                              CustomTextFormFieldClass.build(
                                context: context,
                                controller: createProjectController.timelineController.value,
                                hintText: "Select A Date",
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.hpm(context),
                                  vertical: 8.vpm(context),
                                ),
                                borderRadius: 8,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.vpm(context),
                                    horizontal: 16.hpm(context),
                                  ),
                                  child: ImageHelperClass.customImageContainer(
                                    context: context,
                                    height: 24.h(context),
                                    width: 24.w(context),
                                    imagePath: AppImages.addSiteDiary,
                                    imageFit: BoxFit.contain,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                onTap: () async {
                                  await createProjectController.pickDateTime(context: context);
                                },
                              ),

                            ],
                          ),
                        ),

                        SpaceHelperClass.v(18.h(context)),


                        Container(
                          width: 375.w(context),
                          padding: EdgeInsets.fromLTRB(
                            16.0.lpm(context),
                            16.0.tpm(context),
                            16.0.rpm(context),
                            16.0.bpm(context),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0.r(context)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(4, 6, 15, 0.05),
                                blurRadius: 60.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextHelperClass.headingText(
                                context: context,
                                text: "Add Supervisor",
                                fontSize: 18,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w700,
                              ),

                              SpaceHelperClass.v(8.h(context)),


                              createProjectController.supervisorCompanyEmployee.value.name == null ?
                              SizedBox.shrink() :
                              Container(
                                height: 45.h(context),
                                padding: EdgeInsets.fromLTRB(
                                  12.0.lpm(context),
                                  8.0.tpm(context),
                                  12.0.rpm(context),
                                  8.0.bpm(context),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: const Color.fromRGBO(107, 153, 255, 0.1),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16.r(context),
                                      backgroundImage: createProjectController.supervisorCompanyEmployee.value.image != null
                                          ? NetworkImage(createProjectController.supervisorCompanyEmployee.value.image) : null,
                                      backgroundColor: Colors.grey[300],
                                      child: createProjectController.supervisorCompanyEmployee.value.image == null ?
                                      Icon(
                                        Icons.person,
                                        size: 16.r(context),
                                        color: Colors.white,
                                      ) : null,
                                    ),
                                    SpaceHelperClass.h(8.w(context)),
                                    Expanded(
                                      child: TextHelperClass.headingText(
                                        alignment: Alignment.centerLeft,
                                        textAlign: TextAlign.center,
                                        context: context,
                                        text: createProjectController.supervisorCompanyEmployee.value.name ?? "",
                                        fontSize: 16,
                                        textColor: AppColors.black255,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SpaceHelperClass.h(8.w(context)),
                                    InkWell(
                                      onTap: () {
                                        createProjectController.supervisorCompanyEmployee.value = GetAllCompanyEmployee();
                                      },
                                      child: Icon(Icons.close, size: 18.r(context), color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),

                              SpaceHelperClass.v(16.h(context)),

                              SizedBox(
                                height: 50.h(context),
                                child: InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
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
                                                  text: "Add Supervisor",
                                                  fontSize: 18,
                                                  textColor: AppColors.black255,
                                                  fontWeight: FontWeight.w500,
                                                ),

                                                SpaceHelperClass.v(16.h(context)),

                                                CustomTextFormFieldClass.build(
                                                  context: context,
                                                  hintText: "Search Supervisor...",
                                                  textColor: Color.fromRGBO(173, 174, 188, 1),
                                                  borderColor: Color.fromRGBO(229, 231, 235, 1),
                                                  borderRadius: 8,
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
                                                  onChanged: (nameValue) async {
                                                    if(nameValue != "") {
                                                      print(nameValue);
                                                      createProjectController.searchAllCompanyEmployeeList = createProjectController.searchAllCompanyEmployeeList.where((value)=>value.name.toString().toLowerCase().contains(nameValue.toString().toLowerCase()) == true).toList().obs;
                                                      createProjectController.searchAllCompanyEmployeeList.refresh();
                                                    } else {
                                                      createProjectController.searchAllCompanyEmployeeList = createProjectController.getAllCompanyEmployeeList;
                                                      createProjectController.searchAllCompanyEmployeeList.refresh();
                                                    }
                                                  },
                                                ),

                                                SpaceHelperClass.v(12.h(context)),

                                                TextHelperClass.headingText(
                                                  context: context,
                                                  text: "Add Supervisor",
                                                  fontSize: 14,
                                                  textColor: Color.fromRGBO(107, 114, 128, 1),
                                                  fontWeight: FontWeight.w500,
                                                ),

                                                SpaceHelperClass.v(12.h(context)),

                                                Container(
                                                  height: 390.h(context),
                                                  width: 375.w(context),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent
                                                  ),
                                                  child: createProjectController.isTypeLoading.value == true ?
                                                  CustomLoaderButton().customLoaderButton(
                                                    backgroundColor: Colors.transparent,
                                                    loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                    height: 390,
                                                    context: context,
                                                  ) :
                                                  ListView.builder(
                                                    itemCount: createProjectController.searchAllCompanyEmployeeList.length,
                                                    itemBuilder: (context,int index) {
                                                      return Obx(()=>InkWell(
                                                        onTap: () async {
                                                          createProjectController.supervisorCompanyEmployee.value = createProjectController.searchAllCompanyEmployeeList[index];
                                                        },
                                                        child: Container(
                                                          width: 375.w(context),
                                                          padding: EdgeInsets.fromLTRB(16.lpm(context), 12.tpm(context), 16.rpm(context), 12.bpm(context)),
                                                          margin: EdgeInsets.only(bottom: 12.bpm(context)),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12.r(context)),
                                                            border: Border.all(
                                                              width: 1.w(context),
                                                              color:  createProjectController.supervisorCompanyEmployee.value.name == createProjectController.searchAllCompanyEmployeeList[index].name ?
                                                              Color.fromRGBO(24, 147, 248, 1) : Color(0xFFE5E7EB), // rgba(229, 231, 235, 1)
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 40.r(context),
                                                                backgroundImage:  createProjectController.searchAllCompanyEmployeeList[index].image != null
                                                                    ? NetworkImage(createProjectController.searchAllCompanyEmployeeList[index].image) : null,
                                                                backgroundColor: Colors.grey[300],
                                                                child: createProjectController.searchAllCompanyEmployeeList[index].image == null ?
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
                                                                      text: createProjectController.searchAllCompanyEmployeeList[index].name ?? "",
                                                                      fontSize: 20,
                                                                      textColor: AppColors.black38,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                    TextHelperClass.headingText(
                                                                      context: context,
                                                                      text: createProjectController.searchAllCompanyEmployeeList[index].type ?? "",
                                                                      fontSize: 15,
                                                                      textColor: Color.fromRGBO(107, 114, 128, 1),
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              SpaceHelperClass.h(4.w(context)),

                                                              ImageHelperClass.customImageButtonContainer(
                                                                onPressed: () async {
                                                                  createProjectController.supervisorCompanyEmployee.value = createProjectController.searchAllCompanyEmployeeList[index];
                                                                },
                                                                context: context,
                                                                height: 42.h(context),
                                                                width: 42.w(context),
                                                                imagePath: AppImages.addMemberIcon,
                                                                fit: BoxFit.cover,
                                                                imageFit: BoxFit.contain,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ));
                                                    },
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
                                                          Get.back();
                                                        },
                                                      ),
                                                    ),

                                                    SpaceHelperClass.h(12.w(context)),


                                                    Expanded(
                                                      child: CustomButtonHelper.customRoundedButton(
                                                        context: context,
                                                        text: "Save",
                                                        fontSize: 16,
                                                        textColor: Color.fromRGBO(255, 255, 255, 1),
                                                        fontWeight: FontWeight.w600,
                                                        borderRadius: 8,
                                                        backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                                        onPressed: () async {
                                                          Get.back();
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
                                    await createProjectController.onRefreshVariable();
                                    await createProjectController.getAllCompanyEmployeeByTypeController(type: "supervisor");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, color: Color.fromRGBO(24, 147, 248, 1), size: 24.r(context)),
                                      SpaceHelperClass.h(8.w(context)),
                                      Expanded(
                                        child: TextHelperClass.headingText(
                                          context: context,
                                          text: "Add Supervisor",
                                          fontSize: 16,
                                          textColor: Color.fromRGBO(24, 147, 248, 1),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),


                        SpaceHelperClass.v(18.h(context)),


                        Container(
                          width: 375.w(context),
                          padding: EdgeInsets.fromLTRB(
                            16.0.lpm(context),
                            16.0.tpm(context),
                            16.0.rpm(context),
                            16.0.bpm(context),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0.r(context)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(4, 6, 15, 0.05),
                                blurRadius: 60.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextHelperClass.headingText(
                                context: context,
                                text: "Add Project Manager",
                                fontSize: 18,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w700,
                              ),

                              SpaceHelperClass.v(8.h(context)),

                              createProjectController.managerCompanyEmployee.value.name == null ?
                              SizedBox.shrink() :
                              Container(
                                height: 45.h(context),
                                padding: EdgeInsets.fromLTRB(
                                  12.0.lpm(context),
                                  8.0.tpm(context),
                                  12.0.rpm(context),
                                  8.0.bpm(context),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: const Color.fromRGBO(107, 153, 255, 0.1),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16.r(context),
                                      backgroundImage: createProjectController.managerCompanyEmployee.value.image != null
                                          ? NetworkImage(createProjectController.managerCompanyEmployee.value.image) : null,
                                      backgroundColor: Colors.grey[300],
                                      child: createProjectController.managerCompanyEmployee.value.image == null ?
                                      Icon(
                                        Icons.person,
                                        size: 16.r(context),
                                        color: Colors.white,
                                      ) : null,
                                    ),
                                    SpaceHelperClass.h(8.w(context)),
                                    Expanded(
                                      child: TextHelperClass.headingText(
                                        alignment: Alignment.centerLeft,
                                        textAlign: TextAlign.center,
                                        context: context,
                                        text: createProjectController.managerCompanyEmployee.value.name ?? "",
                                        fontSize: 16,
                                        textColor: AppColors.black255,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SpaceHelperClass.h(8.w(context)),
                                    InkWell(
                                      onTap: () {
                                        createProjectController.managerCompanyEmployee.value = GetAllCompanyEmployee();
                                      },
                                      child: Icon(Icons.close, size: 18.r(context), color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),

                              SpaceHelperClass.v(16.h(context)),

                              SizedBox(
                                height: 50.h(context),
                                child: InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
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
                                                  text: "Add Project Manager",
                                                  fontSize: 18,
                                                  textColor: AppColors.black255,
                                                  fontWeight: FontWeight.w500,
                                                ),

                                                SpaceHelperClass.v(16.h(context)),

                                                CustomTextFormFieldClass.build(
                                                  context: context,
                                                  hintText: "Search Supervisor...",
                                                  textColor: Color.fromRGBO(173, 174, 188, 1),
                                                  borderColor: Color.fromRGBO(229, 231, 235, 1),
                                                  borderRadius: 8,
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
                                                  onChanged: (nameValue) async {
                                                    if(nameValue != "") {
                                                      print(nameValue);
                                                      createProjectController.searchAllCompanyEmployeeList = createProjectController.searchAllCompanyEmployeeList.where((value)=>value.name.toString().toLowerCase().contains(nameValue.toString().toLowerCase()) == true).toList().obs;
                                                      createProjectController.searchAllCompanyEmployeeList.refresh();
                                                    } else {
                                                      createProjectController.searchAllCompanyEmployeeList = createProjectController.getAllCompanyEmployeeList;
                                                      createProjectController.searchAllCompanyEmployeeList.refresh();
                                                    }
                                                  },
                                                ),

                                                SpaceHelperClass.v(12.h(context)),

                                                TextHelperClass.headingText(
                                                  context: context,
                                                  text: "Add Project Manager",
                                                  fontSize: 14,
                                                  textColor: Color.fromRGBO(107, 114, 128, 1),
                                                  fontWeight: FontWeight.w500,
                                                ),

                                                SpaceHelperClass.v(12.h(context)),

                                                Container(
                                                  height: 390.h(context),
                                                  width: 375.w(context),
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent
                                                  ),
                                                  child: createProjectController.isTypeLoading.value == true ?
                                                  CustomLoaderButton().customLoaderButton(
                                                    backgroundColor: Colors.transparent,
                                                    loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                    height: 390,
                                                    context: context,
                                                  ) :
                                                  ListView.builder(
                                                    itemCount: createProjectController.searchAllCompanyEmployeeList.length,
                                                    itemBuilder: (context,int index) {
                                                      return Obx(()=>InkWell(
                                                        onTap: () async {
                                                          createProjectController.managerCompanyEmployee.value = createProjectController.searchAllCompanyEmployeeList[index];
                                                        },
                                                        child: Container(
                                                          width: 375.w(context),
                                                          padding: EdgeInsets.fromLTRB(16.lpm(context), 12.tpm(context), 16.rpm(context), 12.bpm(context)),
                                                          margin: EdgeInsets.only(bottom: 12.bpm(context)),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12.r(context)),
                                                            border: Border.all(
                                                              width: 1.w(context),
                                                              color: createProjectController.managerCompanyEmployee.value.name == createProjectController.searchAllCompanyEmployeeList[index].name ?
                                                              Color.fromRGBO(24, 147, 248, 1) : Color(0xFFE5E7EB), // rgba(229, 231, 235, 1)
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 40.r(context),
                                                                backgroundImage:  createProjectController.searchAllCompanyEmployeeList[index].image != null
                                                                    ? NetworkImage(createProjectController.searchAllCompanyEmployeeList[index].image) : null,
                                                                backgroundColor: Colors.grey[300],
                                                                child: createProjectController.searchAllCompanyEmployeeList[index].image == null ?
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
                                                                      text: createProjectController.searchAllCompanyEmployeeList[index].name ?? "",
                                                                      fontSize: 20,
                                                                      textColor: AppColors.black38,
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                    TextHelperClass.headingText(
                                                                      context: context,
                                                                      text: createProjectController.searchAllCompanyEmployeeList[index].type ?? "",
                                                                      fontSize: 15,
                                                                      textColor: Color.fromRGBO(107, 114, 128, 1),
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              SpaceHelperClass.h(4.w(context)),

                                                              ImageHelperClass.customImageButtonContainer(
                                                                onPressed: () async {
                                                                  createProjectController.managerCompanyEmployee.value = createProjectController.searchAllCompanyEmployeeList[index];
                                                                },
                                                                context: context,
                                                                height: 42.h(context),
                                                                width: 42.w(context),
                                                                imagePath: AppImages.addMemberIcon,
                                                                fit: BoxFit.cover,
                                                                imageFit: BoxFit.contain,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ));
                                                    },
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
                                                          Get.back();
                                                        },
                                                      ),
                                                    ),

                                                    SpaceHelperClass.h(12.w(context)),


                                                    Expanded(
                                                      child: CustomButtonHelper.customRoundedButton(
                                                        context: context,
                                                        text: "Save",
                                                        fontSize: 16,
                                                        textColor: Color.fromRGBO(255, 255, 255, 1),
                                                        fontWeight: FontWeight.w600,
                                                        borderRadius: 8,
                                                        backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                                        onPressed: () async {
                                                          Get.back();
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
                                    await createProjectController.onRefreshVariable();
                                    await createProjectController.getAllCompanyEmployeeByTypeController(type: "manager");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, color: Color.fromRGBO(24, 147, 248, 1), size: 24.r(context)),
                                      SpaceHelperClass.h(8.w(context)),
                                      Expanded(
                                        child: TextHelperClass.headingText(
                                          context: context,
                                          text: "Add Project Manager",
                                          fontSize: 16,
                                          textColor: Color.fromRGBO(24, 147, 248, 1),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),


                        SpaceHelperClass.v(18.h(context)),

                        Container(
                          width: 375.w(context),
                          padding: EdgeInsets.fromLTRB(
                            16.0.lpm(context),
                            16.0.tpm(context),
                            16.0.rpm(context),
                            16.0.bpm(context),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0.r(context)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(4, 6, 15, 0.05),
                                blurRadius: 60.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [

                              TextHelperClass.headingText(
                                context: context,
                                text: "Note",
                                fontSize: 17,
                                textColor: Color.fromRGBO(75, 85, 99, 1),
                                fontWeight: FontWeight.w700,
                              ),

                              SpaceHelperClass.v(8.h(context)),


                              CustomTextFormFieldClass.textFiledWithMaxLineBuild(
                                context: context,
                                controller: createProjectController.noteController.value,
                                hintText: "Write Note",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 9.hpm(context),
                                  vertical: 8.vpm(context),
                                ),
                                maxLines: 4,
                                borderRadius: 8,
                                borderColor: Color.fromRGBO(229, 231, 235, 1),
                              ),


                            ],
                          ),
                        ),

                        SpaceHelperClass.v(35.h(context)),


                        createProjectController.isSubmit.value == true ?
                        CustomLoaderButton().customLoaderButton(
                          backgroundColor: Colors.transparent,
                          loaderColor: Color.fromRGBO(38, 50, 56, 1),
                          height: 50,
                          context: context,
                        ) :
                        CustomButtonHelper.customRoundedButton(
                          context: context,
                          text: 'Create Project',
                          textColor: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          gradientColors: [Color.fromRGBO(38, 50, 56, 1), Color.fromRGBO(28, 59, 71, 1)],
                          onPressed: () async {
                            if(createProjectController.clientNameController.value.text == "") {
                              kSnackBar(message: "Please enter client name", bgColor: AppColors.red);
                            } else if(createProjectController.projectNameController.value.text == "") {
                              kSnackBar(message: "Please enter project name", bgColor: AppColors.red);
                            } else if(createProjectController.locationController.value.text == "") {
                              kSnackBar(message: "Please enter project location", bgColor: AppColors.red);
                            } else if(createProjectController.timelineController.value.text == "") {
                              kSnackBar(message: "Please enter timeline", bgColor: AppColors.red);
                            } else if(createProjectController.supervisorCompanyEmployee.value.name == null) {
                              kSnackBar(message: "Please select supervisor", bgColor: AppColors.red);
                            } else if(createProjectController.managerCompanyEmployee.value.name == null) {
                              kSnackBar(message: "Please select manager", bgColor: AppColors.red);
                            } else {
                              Map<String,dynamic> data = {
                                "client_name": createProjectController.clientNameController.value.text,
                                "name": createProjectController.projectNameController.value.text,
                                "location": createProjectController.locationController.value.text,
                                "timeline": createProjectController.timelineController.value.text,
                                "note": createProjectController.noteController.value.text,
                                "supervisor": createProjectController.supervisorCompanyEmployee.value.sId,
                                "manager": createProjectController.managerCompanyEmployee.value.sId
                              };
                              print(jsonEncode(data));
                              createProjectController.isSubmit.value = true;
                              await createProjectController.createProjectController(data: data);
                            }
                          },
                        ),


                        SpaceHelperClass.v(35.h(context)),
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

