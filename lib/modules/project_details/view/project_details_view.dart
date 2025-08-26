import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/calculator_tools/view/calculator_view.dart';
import 'package:construction_management_app/modules/calculator_tools/view/widget/calculate_view_card.dart';
import 'package:construction_management_app/modules/folder/view/folder_view.dart';
import 'package:construction_management_app/modules/project_details/controller/project_view_controller.dart';
import 'package:construction_management_app/modules/resources/view/resources_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/view/dashboard_view.dart';
import '../../resources/view/project_detalis_resources.dart';

class ProjectDetailsView extends StatelessWidget {
  ProjectDetailsView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    ProjectViewController projectViewController = Get.put(ProjectViewController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: projectViewController.isLoading.value == true  ?
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
                  Get.off(()=>DashboardView(index: 1),preventDuplicates: false);
                },
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      SpaceHelperClass.v(20.h(context)),

                      // Project Name
                      TextHelperClass.headingText(
                        context: context,
                        text: projectViewController.getProjectDetailsResponseModel.value.data?.name ?? "",
                        fontSize: 22,
                        textColor: AppColors.black38,
                        fontWeight: FontWeight.w700,
                      ),

                      SpaceHelperClass.v(6.h(context)),

                      // Project Address with Location Icon
                      Row(
                        children: [
                          ImageHelperClass.customImageContainer(
                            context: context,
                            height: 18.h(context),
                            width: 18.w(context),
                            imagePath: AppImages.location,
                            imageFit: BoxFit.contain,
                            fit: BoxFit.cover,
                          ),

                          SpaceHelperClass.h(4.w(context)),

                          Expanded(
                            child: TextHelperClass.headingText(
                              context: context,
                              text: projectViewController.getProjectDetailsResponseModel.value.data?.location ?? "",
                              fontSize: 16,
                              textColor: AppColors.gray107,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),


                      SpaceHelperClass.v(20.h(context)),


                      Row(
                        children: [

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 16.vpm(context),
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(12.r(context)),
                                border: Border.all(color: Color.fromRGBO(229, 231, 235, 1),width: 0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.05),
                                    offset: const Offset(0, 4),
                                    blurRadius: 60,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Timeline",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(107, 114, 128, 1),
                                    fontWeight: FontWeight.w500,
                                  ),

                                  SpaceHelperClass.v(6.h(context)),


                                  TextHelperClass.headingText(
                                    context: context,
                                    text: projectViewController.dateformating(date: projectViewController.getProjectDetailsResponseModel.value.data?.timeline.toString().split("_").first ?? ""),
                                    fontSize: 16,
                                    textColor: AppColors.black255,
                                    fontWeight: FontWeight.w600,
                                  ),

                                  SpaceHelperClass.v(6.h(context)),

                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "to ${projectViewController.dateformating(date: projectViewController.getProjectDetailsResponseModel.value.data?.timeline.toString().split("_").last ?? "")}",
                                    fontSize: 16,
                                    textColor: AppColors.gray107,
                                    fontWeight: FontWeight.w600,
                                  ),

                                ],
                              ),
                            ),
                          ),

                          SpaceHelperClass.h(12.w(context)),


                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 16.vpm(context),
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(12.r(context)),
                                border: Border.all(color: Color.fromRGBO(229, 231, 235, 1),width: 0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.05),
                                    offset: const Offset(0, 4),
                                    blurRadius: 60,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Client Name",
                                    fontSize: 16,
                                    textColor: Color.fromRGBO(107, 114, 128, 1),
                                    fontWeight: FontWeight.w500,
                                  ),

                                  SpaceHelperClass.v(6.h(context)),


                                  TextHelperClass.headingText(
                                    context: context,
                                    text: projectViewController.getProjectDetailsResponseModel.value.data?.clientName,
                                    fontSize: 16,
                                    textColor: AppColors.black255,
                                    fontWeight: FontWeight.w600,
                                  ),


                                ],
                              ),
                            ),
                          ),



                        ],
                      ),


                      SpaceHelperClass.v(16.h(context)),


                      _buildListItem(
                          context: context,
                          icon: AppImages.folder,
                          title: "Folders",
                          folderCount: projectViewController.getProjectDetailsResponseModel.value.data?.folder.toString() ?? "",
                          iconColor: Color.fromRGBO(41, 45, 50, 1),
                          onTap: () async {
                            Get.off(()=>FolderView(projectId: projectId),preventDuplicates: false);
                          }
                      ),

                      SpaceHelperClass.v(16.h(context)),


                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.hpm(context),
                          vertical: 12.vpm(context),
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(12.r(context)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            TextHelperClass.headingText(
                              context: context,
                              text: "Member List",
                              fontSize: 16,
                              textColor: Color.fromRGBO(75, 85, 99, 1),
                              fontWeight: FontWeight.w500,
                            ),

                            SpaceHelperClass.v(16.h(context)),
                            
                            Column(
                              children: List.generate(projectViewController.getProjectDetailsResponseModel.value.data!.participants![0].participants!.length, (index) {
                                if(projectViewController.getProjectDetailsResponseModel.value.data!.participants![0].participants![index].sId != projectViewController.profileResponseModel.value.data!.sId) {
                                  return Container(
                                    width: 375.w(context),
                                    padding: EdgeInsets.fromLTRB(16.lpm(context), 12.tpm(context), 16.rpm(context), 12.bpm(context)),
                                    margin: EdgeInsets.only(bottom: 12.bpm(context)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r(context)),
                                      border: Border.all(
                                        width: 1.w(context),
                                        color: Color(0xFFE5E7EB), // rgba(229, 231, 235, 1)
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.r(context),
                                          backgroundImage: projectViewController.getProjectDetailsResponseModel.value.data!.participants![0].participants![index].user?.image != null
                                              ? NetworkImage(projectViewController.getProjectDetailsResponseModel.value.data!.participants![0].participants![index].user?.image)
                                              : null,
                                          backgroundColor: Colors.grey[300],
                                          child: projectViewController.getProjectDetailsResponseModel.value.data!.participants![0].participants![index].user?.image == null ?
                                          Icon(
                                            Icons.person,
                                            size: 30.r(context),
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
                                                text: projectViewController.getProjectDetailsResponseModel.value.data!.participants![0].participants![index].user?.name ?? "",
                                                fontSize: 20,
                                                textColor: AppColors.black38,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              TextHelperClass.headingText(
                                                context: context,
                                                text: projectViewController.getProjectDetailsResponseModel.value.data!.participants![0].participants![index].user?.type ?? "",
                                                fontSize: 15,
                                                textColor: Color.fromRGBO(107, 114, 128, 1),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ),

                                        SpaceHelperClass.h(4.w(context)),

                                        ImageHelperClass.customImageButtonContainer(
                                          onPressed: () async {},
                                          context: context,
                                          height: 42.h(context),
                                          width: 42.w(context),
                                          imagePath: AppImages.messageSendIcon,
                                          fit: BoxFit.cover,
                                          imageFit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              }),
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 107.w(context),
                                  height: 30.h(context),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      //_handleAddTask(controller: controller);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.hpm(context),
                                        vertical: 4.vpm(context),
                                      ),
                                      backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r(context)),
                                      ),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      minimumSize: Size(107.w(context), 30.h(context)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        ImageHelperClass.customImageContainer(
                                          context: context,
                                          height: 12.h(context),
                                          width: 12.w(context),
                                          imagePath: AppImages.messageCircleIcon,
                                          imageFit: BoxFit.contain,
                                          fit: BoxFit.cover,
                                        ),

                                        SpaceHelperClass.h(8.w(context)),

                                        Expanded(
                                          child: TextHelperClass.headingText(
                                            context: context,
                                            text: "Message Team",
                                            fontSize: 12,
                                            textColor: Color.fromRGBO(255, 255, 255, 1),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),







                          ],
                        ),
                      ),

                      SpaceHelperClass.v(16.h(context)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          CustomButtonHelper.imageTextColumnButton(
                            context: context,
                            width: 101.w(context),
                            imagePath: AppImages.addSiteDiary,
                            text: "Site Diary",
                            onTap: () {
                              //Get.off(()=>AddSiteDiaryView(), preventDuplicates: false);
                            },
                          ),

                          SpaceHelperClass.h(16.w(context)),

                          CustomButtonHelper.imageTextColumnButton(
                            context: context,
                            width: 101.w(context),
                            imagePath: AppImages.addDayworks,
                            text: "Dayworks",
                            onTap: () {
                              //Get.off(()=>AddDayWorkView(), preventDuplicates: false);
                            },
                          ),

                          SpaceHelperClass.h(16.w(context)),

                          CustomButtonHelper.imageTextColumnButton(
                            context: context,
                            width: 101.w(context),
                            imagePath: AppImages.planningBlackIcon,
                            text: "Planning",
                            onTap: () {
                              //Get.off(()=>AddDayWorkView(), preventDuplicates: false);
                            },
                          ),

                        ],
                      ),

                      SpaceHelperClass.v(16.h(context)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          CustomButtonHelper.imageTextColumnButton(
                            context: context,
                            width: 101.w(context),
                            imagePath: AppImages.resourcesBlackIcon,
                            text: "Resources",
                            onTap: () {
                              Get.off(()=>ResourcesView(projectId: projectId),preventDuplicates: false);
                            },
                          ),

                          SpaceHelperClass.h(16.w(context)),

                          CustomButtonHelper.imageTextColumnButton(
                            context: context,
                            width: 101.w(context),
                            imagePath: AppImages.checkSheetBlackIcon,
                            text: "Checksheet",
                            onTap: () {
                              //Get.off(()=>AddDayWorkView(), preventDuplicates: false);
                            },
                          ),

                          SpaceHelperClass.h(16.w(context)),

                          CustomButtonHelper.imageTextColumnButton(
                            context: context,
                            width: 101.w(context),
                            imagePath: AppImages.toolsBlackIcon,
                            text: "Tools",
                            onTap: () {
                              Get.off(()=>CalculatorView(projectId: projectId,), preventDuplicates: false);
                            },
                          ),

                        ],
                      ),

                      SpaceHelperClass.v(16.h(context)),









                    ],
                  ),
                ),
              )


            ],
          ),
        ),)
      ),
    );
  }


  Widget _buildListItem({
    required BuildContext context,
    required String icon,
    required String title,
    required String folderCount,
    required Color iconColor,
    required Function() onTap
  }) {
    return Container(
      width: 375.w(context), // Using fixed width for demonstration
      padding: EdgeInsets.fromLTRB(
          12.0.lpm(context),
          12.0.tpm(context),
          12.0.rpm(context),
          12.0.bpm(context)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r(context)),
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
          height: 40.h(context),
          width: 40.w(context),
          imagePath: icon,
          imageFit: BoxFit.contain,
          fit: BoxFit.cover,
        ),
        title: Column(
          children: [
            TextHelperClass.headingTextWithoutWidth(
              textAlign: TextAlign.center,
              context: context,
              text: title,
              fontSize: 16,
              textColor: Color.fromRGBO(17, 24, 39, 1),
              fontWeight: FontWeight.w500,
            ),

            SpaceHelperClass.v(4.h(context)),

            TextHelperClass.headingTextWithoutWidth(
              textAlign: TextAlign.center,
              context: context,
              text: "${folderCount} folder",
              fontSize: 16,
              textColor: Color.fromRGBO(107, 114, 128, 1),
              fontWeight: FontWeight.w500,
            ),

          ],
        ),
        trailing: Icon(Icons.chevron_right, color: iconColor,size: 32.r(context),),
        onTap: onTap,
      ),
    );
  }


}
