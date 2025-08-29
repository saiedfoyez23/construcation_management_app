import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/subscription/controller/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionView extends StatelessWidget {
  SubscriptionView({super.key,required this.isHome});

  final bool isHome;
  final SubscriptionController subscriptionController = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: subscriptionController.isLoading.value == true  ?
        CustomLoaderButton().customLoaderButton(
          backgroundColor: Colors.transparent,
          loaderColor: Color.fromRGBO(38, 50, 56, 1),
          height: 812,
          context: context,
        ) : Container(
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
                  if(isHome == false) {
                    Get.off(()=>DashboardView(index: 4),preventDuplicates: false);
                  } else {
                    Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                  }

                },
                title: 'Subscription',
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child:
                  Column(
                    children: [

                      SpaceHelperClass.v(12.h(context)),

                      TextHelperClass.headingText(
                        context: context,
                        text: "Upgrade plan",
                        fontSize: 18,
                        textColor: Color.fromRGBO(6, 55, 73, 1),
                        fontWeight: FontWeight.w600,
                      ),


                      SpaceHelperClass.v(12.h(context)),


                      TextHelperClass.headingText(
                        context: context,
                        text: "Choose a subscription plan",
                        fontSize: 16,
                        textColor: Color.fromRGBO(131, 131, 131, 1),
                        fontWeight: FontWeight.w500,
                      ),

                      SpaceHelperClass.v(12.h(context)),


                    ],
                  ),
                )
              ),


              SliverList(delegate: SliverChildBuilderDelegate(
                      (context,int index) {
                    return Obx(()=>Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                      child: InkWell(
                        onTap: () async {
                          subscriptionController.plainId.value = subscriptionController.getAllSubscriptionResponseModel.value.data?[index].sId;
                        },
                        child: subscriptionController.plainId.value == subscriptionController.getAllSubscriptionResponseModel.value.data?[index].sId ?
                        Container(
                          width: 375,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(2, 127, 238, 1), // rgba(2, 127, 238, 1)
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 4.hpm(context),vertical: 4.vpm(context)),
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          child:  Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(2, 127, 238, 1),
                              borderRadius: BorderRadius.circular(12.r(context)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(4, 6, 15, 0.05),
                                  spreadRadius: 0,
                                  blurRadius: 60,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.hpm(context), vertical: 12.hpm(context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextHelperClass.headingText(
                                        context: context,
                                        text: "${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].name}",
                                        fontSize: 18,
                                        textColor: Color.fromRGBO(255,255,255,1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      TextHelperClass.headingText(
                                        context: context,
                                        text: "${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].maxUsers} Users",
                                        fontSize: 18,
                                        textColor: Color.fromRGBO(255,255,255,1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                                CustomButtonHelper.customRichTextButton(
                                  context: context,
                                  normalText: "\$${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].price}",
                                  highlightedText: " / ${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].interval}",
                                  normalTextColor: Color.fromRGBO(255,255,255,1),
                                  highlightedTextColor: Color.fromRGBO(255,255,255,1),
                                  fontSize: 18,
                                  normalTextWeight: FontWeight.w600,
                                  highlightedTextWeight: FontWeight.w600,
                                  onPressed: null,
                                ),
                              ],
                            ),
                          ),
                        ) :
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(12.r(context)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(4, 6, 15, 0.05),
                                spreadRadius: 0,
                                blurRadius: 60,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12.hpm(context), vertical: 12.hpm(context)),
                          margin: EdgeInsets.only(bottom: 20.bpm(context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextHelperClass.headingText(
                                      context: context,
                                      text: "${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].name}",
                                      fontSize: 18,
                                      textColor: Color.fromRGBO(131, 131, 131, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    TextHelperClass.headingText(
                                      context: context,
                                      text: "${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].maxUsers} Users",
                                      fontSize: 18,
                                      textColor: Color.fromRGBO(131, 131, 131, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              CustomButtonHelper.customRichTextButton(
                                context: context,
                                normalText: "\$${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].price}",
                                highlightedText: " / ${subscriptionController.getAllSubscriptionResponseModel.value.data?[index].interval}",
                                normalTextColor: Color.fromRGBO(26, 94, 237, 1),
                                highlightedTextColor: Color.fromRGBO(131, 131, 131, 1),
                                fontSize: 18,
                                normalTextWeight: FontWeight.w600,
                                highlightedTextWeight: FontWeight.w600,
                                onPressed: null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                  childCount: subscriptionController.getAllSubscriptionResponseModel.value.data?.length
              )),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
                      SpaceHelperClass.v(12.h(context)),



                      subscriptionController.isSubmit.value == true ?
                      CustomLoaderButton().customLoaderButton(
                        backgroundColor: Colors.transparent,
                        loaderColor: Color.fromRGBO(38, 50, 56, 1),
                        height: 50,
                        context: context,
                      ) :
                      CustomButtonHelper.customRoundedButton(
                        context: context,
                        text: 'Buy Now',
                        fontSize: 17,
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w500,
                        gradientColors: const [
                          Color.fromRGBO(38, 50, 56, 1),
                          Color.fromRGBO(28, 59, 71, 1),
                        ],
                        onPressed: () async {
                          if(subscriptionController.plainId.value == "") {
                            kSnackBar(message: "Please select a subscription plan", bgColor: AppColors.red);
                          } else {
                            subscriptionController.isSubmit.value = true;
                            Map<String,dynamic> data = {
                              "plan_id": subscriptionController.plainId.value,
                            };
                            await subscriptionController.createSubscriptionController(data: data);
                          }
                        },
                      ),


                    ],
                  ),
                ),
              ),



            ],
          ),
        ),
      )),
    );
  }
}
