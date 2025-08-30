import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/site_diary/controller/get_site_diary_details_controller.dart';
import 'package:construction_management_app/modules/site_diary/view/site_diary_view.dart';
import 'package:construction_management_app/modules/site_diary/widget/site_diary_details_widget/site_diary_details_task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiteDiaryDetailsView extends StatelessWidget {
  SiteDiaryDetailsView({super.key,required this.siteDiaryId,required this.projectId});

  final String siteDiaryId;
  final String projectId;


  @override
  Widget build(BuildContext context) {
    GetSiteDiaryDetailsController getSiteDiaryDetailsController = Get.put(GetSiteDiaryDetailsController(siteDiaryId: siteDiaryId,projectId: projectId));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: Obx(()=> getSiteDiaryDetailsController.isLoading.value == true  ?
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
                  Get.off(()=>SiteDiaryView(projectId: projectId),preventDuplicates: false);
                },
                title: "Site Diary Details",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
                  
                  
                  
                      SpaceHelperClass.v(13.h(context)),
                  
                      ...getSiteDiaryDetailsController.taskList.map((item) {
                        return SiteDiaryDetailsTaskDetailsWidget().siteDiaryDetailsTaskDetailsBuilder(
                          context: context,
                          controller: getSiteDiaryDetailsController,
                          item: item,
                        );
                      }),


                      SpaceHelperClass.v(12.h(context)),

                      getSiteDiaryDetailsController.isPdf.value == true  ?
                      CustomLoaderButton().customLoaderButton(
                        backgroundColor: Colors.transparent,
                        loaderColor: Color.fromRGBO(38, 50, 56, 1),
                        height: 50,
                        context: context,
                      ) :
                      SizedBox(
                        height: 50.h(context),
                        child: OutlinedButton(
                          onPressed: () async {
                            await getSiteDiaryDetailsController.getPdfController(siteDiaryId: siteDiaryId);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.hpm(context),
                              vertical: 6.vpm(context),
                            ),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r(context)),
                            ),
                            side: BorderSide(
                              color: Color.fromRGBO(239, 68, 68, 1),
                              width: 1
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(375.w(context), 50.h(context)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              ImageHelperClass.customImageContainer(
                                context: context,
                                height: 20.h(context),
                                width: 20.w(context),
                                imagePath: AppImages.pdf,
                                imageFit: BoxFit.contain,
                                fit: BoxFit.cover,
                              ),

                              SpaceHelperClass.h(4.w(context)),

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                text: "Export as pdf",
                                fontSize: 16,
                                textColor: Color.fromRGBO(239, 68, 68, 1),
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),



                  
                  
                    ],
                  ),
                ),
              )
        
        
        
        
            ],
          ),)
        ),
      ),
    );
  }
}
