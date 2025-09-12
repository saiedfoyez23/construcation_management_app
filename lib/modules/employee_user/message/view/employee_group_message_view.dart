import 'package:construction_management_app/modules/company_user/message/controller/get_my_chat_groups_controller.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/message/view/employee_message_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class EmployeeGroupMessageView extends StatelessWidget {
  EmployeeGroupMessageView({super.key});


  final GetMyChatGroupsController getMyChatGroupsController = Get.put(GetMyChatGroupsController());


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
          child: Obx(()=>getMyChatGroupsController.isLoading.value == true  ?
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
                  Get.off(()=>EmployeeDashboardView(index: 0,),preventDuplicates: false);
                },
                title: "Message",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
                      SpaceHelperClass.v(16.h(context)),
                    ],
                  ),
                ),
              ),

              getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?.isEmpty == true ?
              SliverToBoxAdapter(
                child: Column(
                  children: [


                    SpaceHelperClass.v(50.h(context)),


                    TextHelperClass.headingText(
                      context: context,
                      text: "No Chat Group Available",
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      textColor: Color.fromRGBO(114, 114, 114, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ) :
              SliverList(
                delegate: SliverChildBuilderDelegate(
                        (context, int index) {
                          if(getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].project != null) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                              child: InkWell(
                                onTap: () async {
                                  Get.off(()=>EmployeeMessageView(groupChatId: getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].sId, projectName: getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].project?.name));
                                },
                                child: Container(
                                  width: 375.w(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r(context)),
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: Color(0xFFE5E7EB), // rgba(229, 231, 235, 1)
                                      ),
                                    ),
                                  ),
                                  margin: EdgeInsets.only(bottom: 12.bpm(context)),
                                  padding: EdgeInsets.only(
                                    top: 14.tpm(context),
                                    right: 16.rpm(context),
                                    bottom: 14.bpm(context),
                                    left: 16.lpm(context),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Top Row (Title, Hours, Delete Icon)
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            height: 46.h(context),
                                            width: 46.w(context),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(229, 243, 255, 1),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: Alignment.center,
                                            child: TextHelperClass.headingText(
                                              alignment: Alignment.center,
                                              textAlign: TextAlign.center,
                                              context: context,
                                              text: getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].project?.name.toString().substring(0,2).toUpperCase() ?? "",
                                              fontSize: 19,
                                              textColor: Color.fromRGBO(24, 147, 248, 1),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),


                                          SpaceHelperClass.h(12.w(context)),


                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextHelperClass.headingText(
                                                  context: context,
                                                  text: getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].project?.name ?? "",
                                                  fontSize: 19,
                                                  textColor: Color.fromRGBO(31, 41, 55, 1),
                                                  fontWeight: FontWeight.w700,
                                                ),


                                                getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].lastMessage?.isEmpty == false ?
                                                SpaceHelperClass.h(5.h(context)) : SizedBox.shrink(),


                                                getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].lastMessage?.isEmpty == false ?
                                                TextHelperClass.headingText(
                                                  context: context,
                                                  text: getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].lastMessage?.first.content ?? "",
                                                  fontSize: 15,
                                                  textColor: Color.fromRGBO(152, 152, 152, 1),
                                                  fontWeight: FontWeight.w500,
                                                ) : SizedBox.shrink(),
                                              ],
                                            ),
                                          ),

                                          SpaceHelperClass.h(5.w(context)),

                                          getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].unSeenMessageCount?.isNotEmpty != false ?
                                          Container(
                                            height: 26.h(context),
                                            width: 26.w(context),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(14, 177, 254, 1),
                                              borderRadius: BorderRadius.circular(4.r(context)),
                                            ),
                                            alignment: Alignment.center,
                                            child: TextHelperClass.headingText(
                                              alignment: Alignment.center,
                                              textAlign: TextAlign.center,
                                              context: context,
                                              text: getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?[index].unSeenMessageCount?.first.toString() ?? "0",
                                              fontSize: 15,
                                              textColor: Color.fromRGBO(255,255,255,1),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ) :
                                          SizedBox.shrink(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                    childCount: getMyChatGroupsController.getMyChatGroupsResponseModel.value.data?.data?.length
                ),
              ),



            ],
          )),
        ),
      ),
    );
  }
}
