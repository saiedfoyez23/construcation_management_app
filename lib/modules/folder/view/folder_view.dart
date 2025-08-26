import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/folder/controller/folder_controller.dart';
import 'package:construction_management_app/modules/folder/view/folder_details_view.dart';
import 'package:construction_management_app/modules/project_details/view/project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FolderView extends StatelessWidget {
  FolderView({super.key,required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    FolderController folderController = Get.put(FolderController(projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> folderController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          RefreshIndicator(
            onRefresh: () async {
              folderController.isLoading.value = true;
              await folderController.getAllCompanyEmployeeController(projectId: projectId);
            },
            child: CustomScrollView(
              slivers: [


                CustomAppBarHelper.normalAppBar(
                  context: context,
                  onBackPressed: () {
                    Get.off(()=>ProjectDetailsView(projectId: projectId),preventDuplicates: false);
                  },
                  title: "Folders",
                ),

                SliverToBoxAdapter(
                  child: Padding(
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
                                text: "Folders",
                                fontSize: 22,
                                textColor: AppColors.black255,
                                fontWeight: FontWeight.w700,
                              ),
                            ),



                            CustomButtonHelper.textWithIconButton(
                              context: context,
                              width: 125,
                              height: 40,
                              minHeight: 40,
                              minWidth: 125,
                              textContainerWidth: 89,
                              onPressed: () async {
                                await folderController.refreshVariable();
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
                                              text: "Create Folder",
                                              fontSize: 22,
                                              textColor: AppColors.black255,
                                              fontWeight: FontWeight.w700,
                                            ),




                                            SpaceHelperClass.v(16.h(context)),
                                            TextHelperClass.headingText(
                                              context: context,
                                              text: "Folder Name",
                                              fontSize: 16,
                                              textColor: Color.fromRGBO(75, 85, 99, 1),
                                              fontWeight: FontWeight.w700,
                                            ),
                                            SpaceHelperClass.v(8.h(context)),
                                            CustomTextFormFieldClass.build(
                                              context: context,
                                              controller: folderController.folderNameController.value,
                                              hintText: "Enter folder name",
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
                                                  child: folderController.isSubmit.value == true ?
                                                  CustomLoaderButton().customLoaderButton(
                                                    backgroundColor: Colors.transparent,
                                                    loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                    height: 50,
                                                    context: context,
                                                  ) :
                                                  CustomButtonHelper.customRoundedButton(
                                                    context: context,
                                                    text: "Create folder",
                                                    fontSize: 16,
                                                    textColor: Color.fromRGBO(255, 255, 255, 1),
                                                    fontWeight: FontWeight.w600,
                                                    borderRadius: 8,
                                                    backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                                    onPressed: () async {
                                                      if(folderController.folderNameController.value.text == "") {
                                                        kSnackBar(message: "Please enter folder name", bgColor: AppColors.red);
                                                      } else {
                                                        Map<String,dynamic> data = {
                                                          "project": projectId,
                                                          "name": folderController.folderNameController.value.text,
                                                        };
                                                        print(data);
                                                        folderController.isSubmit.value = true;
                                                        await folderController.createFolderController(data: data);
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
                              text: "Create folder",
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
                          controller: folderController.searchController.value,
                          hintText: "Search Folder...",
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
                          onChanged: (folderValue) async {
                            if(folderValue == "") {
                              folderController.getAllFoldersSearchResponseList = folderController.getAllFoldersResponseList;
                            } else {
                              folderController.getAllFoldersSearchResponseList.value = folderController.getAllFoldersSearchResponseList.where((value)=>value.name.toString().toLowerCase().contains(folderValue.toString().toLowerCase()) == true).toList();
                            }
                          },
                        ),

                        SpaceHelperClass.v(18.h(context)),


                      ],
                    ),
                  ),
                ),


                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context,int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                            child: _buildListItem(
                              context: context,
                              icon: AppImages.folder,
                              title: folderController.getAllFoldersSearchResponseList[index].name ?? "",
                              folderCount: folderController.getAllFoldersSearchResponseList[index].files.toString(),
                              iconColor: Color.fromRGBO(239, 68, 68, 1),
                              onTap: () async {
                                Get.off(()=>FolderDetailsView(projectId: projectId,folderId: folderController.getAllFoldersSearchResponseList[index].sId,),preventDuplicates: false);
                              },
                              onPressed: () async {
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            ImageHelperClass.customImageContainer(
                                              context: context,
                                              height: 74.h(context),
                                              width: 74.w(context),
                                              imagePath: AppImages.deleteFileIcon,
                                              imageFit: BoxFit.contain,
                                              fit: BoxFit.cover,
                                            ),

                                            SpaceHelperClass.v(8.h(context)),

                                            TextHelperClass.headingText(
                                              textAlign: TextAlign.center,
                                              alignment: Alignment.center,
                                              context: context,
                                              text: "Delete SafeZone?",
                                              fontSize: 18,
                                              textColor: AppColors.black255,
                                              fontWeight: FontWeight.w700,
                                            ),


                                            SpaceHelperClass.v(18.h(context)),

                                            TextHelperClass.headingText(
                                              textAlign: TextAlign.center,
                                              alignment: Alignment.center,
                                              context: context,
                                              text: "Are you sure you want to delete this item? This action cannot be undone.",
                                              fontSize: 16,
                                              textColor: Color.fromRGBO(107, 114, 128, 1),
                                              fontWeight: FontWeight.w700,
                                            ),


                                            SpaceHelperClass.v(16.h(context)),


                                            Column(
                                              children: [

                                                folderController.isDelete.value == true ?
                                                CustomLoaderButton().customLoaderButton(
                                                  backgroundColor: Colors.transparent,
                                                  loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                  height: 50,
                                                  context: context,
                                                ) :
                                                CustomButtonHelper.customRoundedButton(
                                                  context: context,
                                                  text: "Delete",
                                                  fontSize: 16,
                                                  textColor: Color.fromRGBO(255, 255, 255, 1),
                                                  fontWeight: FontWeight.w600,
                                                  borderRadius: 8,
                                                  backgroundColor: Color.fromRGBO(220, 20, 60, 1),
                                                  onPressed: () async {
                                                    folderController.isDelete.value = true;
                                                    await folderController.deleteFolderController(
                                                      folderId: folderController.getAllFoldersSearchResponseList[index].sId,
                                                    );
                                                  },
                                                ),

                                                SpaceHelperClass.v(12.h(context)),


                                                CustomButtonHelper.customRoundedButton(
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






                                              ],
                                            ),


                                            SpaceHelperClass.v(24.h(context)),

                                          ],
                                        ),
                                      ),
                                    ));
                                  },
                                );
                              }
                            ),
                          );
                        },
                      childCount: folderController.getAllFoldersSearchResponseList.length
                    )
                )

              ],
            ),
          ))
        ),
      ),
    );
  }


  Widget _buildListItem({
    required BuildContext context,
    required String icon,
    required String title,
    required String folderCount,
    required Color iconColor,
    required Function() onTap,
    required Function() onPressed,
  }) {
    return Container(
      width: 375.w(context), // Using fixed width for demonstration
      margin: EdgeInsets.only(bottom: 12.bpm(context)),
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
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.delete_outlined, color: iconColor,size: 25.r(context),),
        ),
        onTap: onTap,
      ),
    );
  }

}
