import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/project_details/view/project_details_view.dart';
import 'package:construction_management_app/modules/site_diary/view/new_site_diary_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiteDiaryView extends StatelessWidget {
  SiteDiaryView({super.key,required this.projectId});

  final String projectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  Get.off(()=>ProjectDetailsView(projectId: projectId),preventDuplicates: false);
                },
                title: "All Site Diary",
              ),
        
        
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
        
        
                      SpaceHelperClass.v(16.h(context)),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
        
        
                          Expanded(
                            child: TextHelperClass.headingText(
                              context: context,
                              text: "All Site Diary",
                              fontSize: 22,
                              textColor: AppColors.black255,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
        
        
        
                          CustomButtonHelper.textWithIconButton(
                            context: context,
                            width: 165,
                            height: 40,
                            minHeight: 40,
                            minWidth: 165,
                            textContainerWidth: 120.w(context),
                            onPressed: () async {
                              Get.off(()=>NewSiteDiaryView(projectId: projectId),preventDuplicates: false);
                            },
                            text: "Upload New Log",
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
                        //controller: myProjectController.searchController.value,
                        hintText: "Search site diary...",
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
                          //await myProjectController.getMySearchProject(searchTerm: value!);
                        },
                      ),
        
                      SpaceHelperClass.v(18.h(context)),
        
        
                    ],
                  ),
                ),
              ),




        
        
            ],
          ),
        ),
      ),
    );
  }
}
