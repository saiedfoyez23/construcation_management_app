import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/create_project/controller/my_project_controller.dart';
import 'package:construction_management_app/modules/company_user/create_project/view/create_project_view.dart';
import 'package:construction_management_app/modules/company_user/home/widget/home_widget/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllJobView extends StatelessWidget {
  AllJobView({super.key});
  final MyProjectController myProjectController = Get.put(MyProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(()=> SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          child: myProjectController.isLoading.value == true ?
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
                      text: "All Jobs",
                      fontSize: 22,
                      textColor: AppColors.black255,
                      fontWeight: FontWeight.w700,
                    ),
                  ),



                  CustomButtonHelper.textWithIconButton(
                    context: context,
                    height: 40,
                    onPressed: () async {
                      Get.off(()=>CreateProjectView(),preventDuplicates: false);
                    },
                    text: "Create Job",
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
                controller: myProjectController.searchController.value,
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
                  await myProjectController.getMySearchProject(searchTerm: value!);
                },
              ),

              SpaceHelperClass.v(18.h(context)),

              // Projects List
              Expanded(
                child: myProjectController.getAllProjectResponseModel.value.data?.data?.isEmpty == true ||
                    myProjectController.getAllProjectResponseModel.value.data?.data == null ?
                TextHelperClass.headingText(
                  context: context,
                  text: "No Project Available",
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  textColor: Color.fromRGBO(114, 114, 114, 1),
                  fontWeight: FontWeight.w700,
                ) : myProjectController.isSearchLoading.value == true ?
                CustomLoaderButton().customLoaderButton(
                  backgroundColor: Colors.transparent,
                  loaderColor: Color.fromRGBO(38, 50, 56, 1),
                  height: 812,
                  context: context,
                ) :
                ListView.builder(
                  itemCount: myProjectController.getAllProjectResponseModel.value.data?.data?.length,
                  itemBuilder: (context, index) {
                    return HomeWidgets.projectDetailsCard(
                      context: context,
                      projectName: myProjectController.getAllProjectResponseModel.value.data?.data?[index].name ?? "",
                      projectAddress: myProjectController.getAllProjectResponseModel.value.data?.data?[index].location ?? "",
                      dailyLogsCount: int.parse(myProjectController.getAllProjectResponseModel.value.data!.data![index].totalSiteDiary.toString()),
                      dayWorksCount: int.parse(myProjectController.getAllProjectResponseModel.value.data!.data![index].totalDayWork.toString()),
                      projectId: myProjectController.getAllProjectResponseModel.value.data!.data![index].sId,
                      images: myProjectController.getAllProjectResponseModel.value.data!.data![index].dayWorkImages,
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
