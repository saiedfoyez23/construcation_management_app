import 'package:construction_management_app/modules/employee_user/home/widget/employee_home_widget/employee_home_widget.dart';
import 'package:get/get.dart';
import 'package:construction_management_app/modules/employee_user/create_project/controller/employee_project_controller.dart';
import 'package:flutter/material.dart';
import '../../../../common/common.dart';

class EmployeeAllJobView extends StatelessWidget {
  EmployeeAllJobView({super.key});
  final EmployeeProjectController employeeProjectController = Get.put(EmployeeProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(()=> SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          child: employeeProjectController.isLoading.value == true ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) : Column(
            children: [

              SpaceHelperClass.v(16.h(context)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Expanded(
                    child: TextHelperClass.headingText(
                      context: context,
                      text: "Assigned job List",
                      fontSize: 22,
                      textColor: AppColors.black255,
                      fontWeight: FontWeight.w700,
                    ),
                  ),


                ],
              ),

              SpaceHelperClass.v(18.h(context)),

              CustomTextFormFieldClass.build(
                context: context,
                controller: employeeProjectController.searchController.value,
                hintText: "Search Project...",
                textColor: Color.fromRGBO(173, 174, 188, 1),
                borderColor: Color.fromRGBO(229, 231, 235, 1),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.hpm(context),
                  vertical: 10.vpm(context),
                ),
                suffixIcon: Icon(Icons.filter_list,color: Color.fromRGBO(173, 174, 188, 1),size: 24.r(context),),
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
                  await employeeProjectController.getEmployeeSearchProject(searchTerm: value!);
                },
              ),

              SpaceHelperClass.v(18.h(context)),

              // Projects List
              Expanded(
                child: employeeProjectController.employeeGetAllProjectResponseModel.value.data?.data?.isEmpty == true ||
                    employeeProjectController.employeeGetAllProjectResponseModel.value.data?.data == null ?
                TextHelperClass.headingText(
                  context: context,
                  text: "No Project Available",
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  textColor: Color.fromRGBO(114, 114, 114, 1),
                  fontWeight: FontWeight.w700,
                ) : employeeProjectController.isSearchLoading.value == true ?
                CustomLoaderButton().customLoaderButton(
                  backgroundColor: Colors.transparent,
                  loaderColor: Color.fromRGBO(38, 50, 56, 1),
                  height: 812,
                  context: context,
                ) :
                ListView.builder(
                  itemCount: employeeProjectController.employeeGetAllProjectResponseModel.value.data?.data?.length,
                  itemBuilder: (context, index) {
                    return EmployeeHomeWidgets.projectDetailsCard(
                      context: context,
                      projectName: employeeProjectController.employeeGetAllProjectResponseModel.value.data?.data?[index].name ?? "",
                      projectAddress: employeeProjectController.employeeGetAllProjectResponseModel.value.data?.data?[index].location ?? "",
                      dailyLogsCount: int.parse(employeeProjectController.employeeGetAllProjectResponseModel.value.data!.data![index].totalSiteDiary.toString()),
                      dayWorksCount: int.parse(employeeProjectController.employeeGetAllProjectResponseModel.value.data!.data![index].totalDayWork.toString()),
                      projectId: employeeProjectController.employeeGetAllProjectResponseModel.value.data!.data![index].sId,
                      images: employeeProjectController.employeeGetAllProjectResponseModel.value.data!.data![index].dayWorkImages,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),)
    );
  }

}
