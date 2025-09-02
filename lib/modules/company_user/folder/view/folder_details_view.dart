import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/folder/controller/folder_details_controller.dart';
import 'package:construction_management_app/modules/company_user/folder/view/folder_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FolderDetailsView extends StatelessWidget {
  FolderDetailsView({super.key,required this.projectId,required this.folderId});

  final String projectId;
  final String folderId;

  @override
  Widget build(BuildContext context) {
    FolderDetailsController folderDetailsController = Get.put(FolderDetailsController(folderId: folderId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=> folderDetailsController.isLoading.value == true  ?
        CustomLoaderButton().customLoaderButton(
          backgroundColor: Colors.transparent,
          loaderColor: Color.fromRGBO(38, 50, 56, 1),
          height: 812,
          context: context,
        ) :
        Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              Get.off(FolderDetailsView(projectId: projectId, folderId: folderId),preventDuplicates: false);
            },
            child: CustomScrollView(
              slivers: [

                CustomAppBarHelper.normalAppBar(
                  context: context,
                  onBackPressed: () {
                    Get.off(()=>FolderView(projectId: projectId),preventDuplicates: false);
                  },
                  title: "All Files",
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
                                text: "All Files",
                                fontSize: 22,
                                textColor: AppColors.black255,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SpaceHelperClass.v(16.h(context)),

                            CustomButtonHelper.textWithIconButton(
                              context: context,
                              height: 40,
                              onPressed: () async {
                                await folderDetailsController.onRefresh();
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
                                              text: "Upload File",
                                              fontSize: 22,
                                              textColor: AppColors.black255,
                                              fontWeight: FontWeight.w700,
                                            ),




                                            SpaceHelperClass.v(16.h(context)),


                                            Container(
                                              width: 375.w(context),
                                              padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF3F4F6),
                                                borderRadius: BorderRadius.circular(10.r(context)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFF04060F).withOpacity(0.03),
                                                    blurRadius: 60,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                              child: TextButton(
                                                onPressed: () async {
                                                  await folderDetailsController.pickFile();
                                                },
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ImageHelperClass.customImageContainer(
                                                      context: context,
                                                      height: 101.h(context),
                                                      width: 101.w(context),
                                                      imagePath: AppImages.uploadImageIcon,
                                                      imageFit: BoxFit.contain,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    TextHelperClass.headingText(
                                                      alignment: Alignment.center,
                                                      textAlign: TextAlign.center,
                                                      context: context,
                                                      text: folderDetailsController.selectedFile.value.path == "" ? "Capture Photo" : folderDetailsController.selectedFile.value.path.split("/").last,
                                                      fontSize: 16,
                                                      textColor: Color.fromRGBO(107, 114, 128, 1),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            SpaceHelperClass.v(16.h(context)),
                                            TextHelperClass.headingText(
                                              context: context,
                                              text: "File Name",
                                              fontSize: 16,
                                              textColor: Color.fromRGBO(75, 85, 99, 1),
                                              fontWeight: FontWeight.w700,
                                            ),
                                            SpaceHelperClass.v(8.h(context)),
                                            CustomTextFormFieldClass.build(
                                              context: context,
                                              controller: folderDetailsController.folderNameController.value,
                                              hintText: "Enter file name",
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
                                                  child: folderDetailsController.isSubmit.value == true ?
                                                  CustomLoaderButton().customLoaderButton(
                                                    backgroundColor: Colors.transparent,
                                                    loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                    height: 50,
                                                    context: context,
                                                  ) :
                                                  CustomButtonHelper.customRoundedButton(
                                                    context: context,
                                                    text: "Upload",
                                                    fontSize: 16,
                                                    textColor: Color.fromRGBO(255, 255, 255, 1),
                                                    fontWeight: FontWeight.w600,
                                                    borderRadius: 8,
                                                    backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                                    onPressed: () async {
                                                      if(folderDetailsController.selectedFile.value.path == "") {
                                                        kSnackBar(message: "Please upload a file", bgColor: AppColors.red);
                                                      } else if(folderDetailsController.folderNameController.value.text == "") {
                                                        kSnackBar(message: "Please enter file name", bgColor: AppColors.red);
                                                      } else {
                                                        folderDetailsController.isSubmit.value = true;
                                                        await folderDetailsController.updateImageController(
                                                          folderId: folderId,
                                                          image: folderDetailsController.selectedFile.value,
                                                          name: folderDetailsController.folderNameController.value.text,
                                                        );
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
                              text: "Upload New",
                              icon: Icons.add,
                              iconSize: 19.r(context),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),



                          ],
                        ),

                        SpaceHelperClass.v(18.h(context)),

                        _buildListItem(
                          context: context,
                          icon: AppImages.folder,
                          editIcon: AppImages.folderEditIcon,
                          title: folderDetailsController.getFoldersDetailsResponseModel.value.data?.name ?? "",
                          folderCount: folderDetailsController.getFoldersDetailsResponseModel.value.data!.files!.length.toString(),
                          onTap: () async {},
                          onPressed: () async {
                            folderDetailsController.folderNameController.value.text = folderDetailsController.getFoldersDetailsResponseModel.value.data?.name ?? "";
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
                                          text: "Edit Folder",
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
                                          controller: folderDetailsController.folderNameController.value,
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
                                              child: folderDetailsController.isSubmit.value == true ?
                                              CustomLoaderButton().customLoaderButton(
                                                backgroundColor: Colors.transparent,
                                                loaderColor: Color.fromRGBO(38, 50, 56, 1),
                                                height: 50,
                                                context: context,
                                              ) :
                                              CustomButtonHelper.customRoundedButton(
                                                context: context,
                                                text: "Update",
                                                fontSize: 16,
                                                textColor: Color.fromRGBO(255, 255, 255, 1),
                                                fontWeight: FontWeight.w600,
                                                borderRadius: 8,
                                                backgroundColor: Color.fromRGBO(24, 147, 248, 1),
                                                onPressed: () async {
                                                  if(folderDetailsController.folderNameController.value.text == "") {
                                                    kSnackBar(message: "Please enter folder name", bgColor: AppColors.red);
                                                  } else {
                                                    Map<String,dynamic> data = {
                                                      "name": folderDetailsController.folderNameController.value.text,
                                                    };
                                                    print(data);
                                                    folderDetailsController.isSubmit.value = true;
                                                    await folderDetailsController.updateFileNameController(data: data,folderId: folderId);
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
                        ),

                        SpaceHelperClass.v(18.h(context)),

                        CustomTextFormFieldClass.build(
                          context: context,
                          controller: folderDetailsController.searchController.value,
                          hintText: "Search File...",
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
                          onChanged: (fileValue) async {
                            if(fileValue == "") {
                              folderDetailsController.getFileSearchList.value = folderDetailsController.getFileList;
                              folderDetailsController.getFileSearchList.refresh();
                            } else {
                              folderDetailsController.getFileSearchList.value =  folderDetailsController.getFileSearchList.where((value)=>value.name.toString().toLowerCase().contains(fileValue.toString().toLowerCase()) == true).toList();
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
                            child: _buildListFileItem(
                              context: context,
                              icon: AppImages.fileIcon,
                              title: folderDetailsController.getFileSearchList[index].name ?? "",
                              onTap: () async {},
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

                                                folderDetailsController.isDelete.value == true ?
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
                                                    folderDetailsController.isDelete.value = true;
                                                    await folderDetailsController.deleteFileController(
                                                      folderId: folderId,
                                                      url: folderDetailsController.getFileSearchList[index].url,
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
                              },
                              iconColor: Color.fromRGBO(239, 68, 68, 1),
                              onDownloadPressed: () async {
                                await folderDetailsController.downloadAndOpenFile(folderDetailsController.getFileSearchList[index].url ?? "", folderDetailsController.getFileSearchList[index].name ?? "");
                              },
                              onOpenPressed: () async {
                                await folderDetailsController.downloadAndOpenFile(folderDetailsController.getFileSearchList[index].url ?? "", folderDetailsController.getFileSearchList[index].name ?? "");
                              }
                            ),
                          );
                        },
                      childCount: folderDetailsController.getFileSearchList.length
                    )
                )


              ],
            ),
          ),
        )),
      ),
    );
  }


  Widget _buildListItem({
    required BuildContext context,
    required String icon,
    required String editIcon,
    required String title,
    required String folderCount,
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
        trailing: ImageHelperClass.customImageButtonContainer(
          onPressed: onPressed,
          context: context,
          height: 40.h(context),
          width: 40.w(context),
          imagePath: editIcon,
          imageFit: BoxFit.contain,
          fit: BoxFit.cover,
        ),
        onTap: onTap,
      ),
    );
  }


  Widget _buildListFileItem({
    required BuildContext context,
    required String icon,
    required Color iconColor,
    required String title,
    required Function() onTap,
    required Function() onPressed,
    required Function() onOpenPressed,
    required Function() onDownloadPressed,
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
              textAlign: TextAlign.start,
              context: context,
              text: title,
              fontSize: 16,
              textColor: Color.fromRGBO(17, 24, 39, 1),
              fontWeight: FontWeight.w500,
            ),

            SpaceHelperClass.v(4.h(context)),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                CustomButtonHelper.textWithIconButton(
                  context: context,
                  height: 40,
                  onPressed: onDownloadPressed,
                  text: "Download",
                  icon: Icons.file_download_outlined,
                  iconSize: 19.r(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                
                
                SpaceHelperClass.h(8.w(context)),


                CustomButtonHelper.textWithIconButton(
                  context: context,
                  height: 40,
                  iconColor: Color.fromRGBO(55, 65, 81, 1),
                  backgroundColor: Color.fromRGBO(241, 241, 241, 1),
                  textColor: Color.fromRGBO(55, 65, 81, 1),
                  onPressed: onOpenPressed,
                  text: "Open",
                  icon: Icons.visibility_outlined,
                  iconSize: 19.r(context),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),




              ],
            )


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
