
import 'package:construction_management_app/modules/company_user/message/controller/get_all_message_controller.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:get/get.dart';
import 'package:construction_management_app/data/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/common.dart';

class EmployeeMessageView extends StatelessWidget {
  EmployeeMessageView({super.key,required this.groupChatId,required this.projectName});

  final String groupChatId;
  final String projectName;
  final SocketService socketService = Get.put(SocketService());


  @override
  Widget build(BuildContext context) {
    final GetAllMessageController getAllMessageController = Get.put(GetAllMessageController(groupChatId: groupChatId));
    return Scaffold(
      body: SafeArea(
        child: Obx(()=> Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: getAllMessageController.isLoading.value == true  ?
          CustomLoaderButton().customLoaderButton(
            backgroundColor: Colors.transparent,
            loaderColor: Color.fromRGBO(38, 50, 56, 1),
            height: 812,
            context: context,
          ) :
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: getAllMessageController.scrollController.value,
                  slivers: [


                    CustomAppBarHelper.normalAppBar(
                      context: context,
                      onBackPressed: () {
                        Get.off(()=>EmployeeDashboardView(index: 2,),preventDuplicates: false);
                      },
                      title: "${projectName}",
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


                    getAllMessageController.getAllMessageResponseModel.value.data?.data?.isEmpty == true ?
                    SliverToBoxAdapter(
                      child: Column(
                        children: [


                          SpaceHelperClass.v(50.h(context)),


                          TextHelperClass.headingText(
                            context: context,
                            text: "No Message Available",
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
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                              child: Container(
                                width: 375.w(context),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
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

                                        CircleAvatar(
                                          radius: 30.r(context),
                                          backgroundImage: getAllMessageController.getAllMessageResponseModel.value.data?.data?[index].sender?.user?.image != null
                                              ? NetworkImage(getAllMessageController.getAllMessageResponseModel.value.data?.data?[index].sender?.user?.image ) : null,
                                          backgroundColor: Colors.grey[300],
                                          child: getAllMessageController.getAllMessageResponseModel.value.data?.data?[index].sender?.user?.image == null ?
                                          Icon(
                                            Icons.person,
                                            size: 48.r(context),
                                            color: Colors.white,
                                          ) : null,
                                        ),


                                        SpaceHelperClass.h(12.w(context)),


                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [


                                              TextHelperClass.headingText(
                                                context: context,
                                                text: "${getAllMessageController.getAllMessageResponseModel.value.data?.data?[index].sender?.user?.name}",
                                                fontSize: 16,
                                                textColor: Color.fromRGBO(31, 41, 55, 1),
                                                fontWeight: FontWeight.w700,
                                              ),

                                              SpaceHelperClass.v(4.h(context)),


                                              TextHelperClass.headingText(
                                                context: context,
                                                text: "${DateFormat("MMM dd, yyyy hh:mm a").format(DateTime.parse(getAllMessageController.getAllMessageResponseModel.value.data?.data?[index].createdAt).toLocal())}" ?? "",
                                                fontSize: 16,
                                                textColor: Color.fromRGBO(31, 41, 55, 1),
                                                fontWeight: FontWeight.w500,
                                              ),

                                              SpaceHelperClass.v(10.h(context)),

                                              TextHelperClass.headingText(
                                                context: context,
                                                text: getAllMessageController.getAllMessageResponseModel.value.data?.data?[index].content ?? "",
                                                fontSize: 16,
                                                textColor: Color.fromRGBO(31, 41, 55, 1),
                                                fontWeight: FontWeight.w500,
                                              ),

                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: getAllMessageController.getAllMessageResponseModel.value.data?.data?.length
                      ),
                    ),

                  ],
                ),
              ),


              Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [
                        SpaceHelperClass.v(6.h(context)),

                        CustomTextFormFieldClass.build(
                          context: context,
                          controller: getAllMessageController.messageController.value,
                          hintText: 'Message',
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              if(getAllMessageController.messageController.value.text == "") {
                                kSnackBar(message: "Enter a message", bgColor: AppColors.red);
                              } else {
                                Map<String,dynamic> data = {
                                  "chatGroupId": "${groupChatId}",
                                  "content": getAllMessageController.messageController.value.text,
                                  "file": null // send file url in a string if needed to send a file
                                };
                                print(data);
                                final ack = await socketService.emitWithAck('sendMessage', data);
                                print('Acknowledgment received: $ack, type: ${ack.runtimeType}');
                                print("send dddd");
                                getAllMessageController.messageController.value.clear();

                              }
                            },
                            icon: Icon(
                              Icons.send_outlined,
                              color: const Color.fromRGBO(117, 131, 141, 1),
                              size: 24.r(context),
                            ),
                            padding: EdgeInsets.only(right: 16.w(context)),
                          ),
                        ),

                        SpaceHelperClass.v(6.h(context)),
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
