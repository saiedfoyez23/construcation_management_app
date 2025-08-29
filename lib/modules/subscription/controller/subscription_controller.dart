import 'dart:convert';

import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/subscription/model/create_subscription_response_model.dart';
import 'package:construction_management_app/modules/subscription/model/get_all_subscription_response_model.dart';
import 'package:construction_management_app/modules/subscription/view/buy_subscription_view.dart';
import 'package:construction_management_app/modules/subscription/view/payment_success_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/app_constant/app_constant.dart';
import '../../../common/custom_widget/custom_snackbar.dart';
import '../../../common/local_store/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class SubscriptionController extends GetxController {

  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetAllSubscriptionResponseModel> getAllSubscriptionResponseModel = GetAllSubscriptionResponseModel().obs;
  Rx<CreateSubscriptionResponseModel> createSubscriptionResponseModel = CreateSubscriptionResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxString plainId = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllSubscriptionController();
    });
  }


  Future<void> getAllSubscriptionController() async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllSubscription}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllSubscriptionResponseModel.value = GetAllSubscriptionResponseModel.fromJson(responseBody);
        //kSnackBar(message: "Employee create successful", bgColor: AppColors.green);
      } else {
        throw "Folder Retrieve is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Subscription Retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }



  Future<void> createSubscriptionController({required Map<String,dynamic> data}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.createSubscription,
          headers: headers,
          body: jsonEncode(data),
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        kSnackBar(message: "Subscription create successful", bgColor: AppColors.green);
        createSubscriptionResponseModel.value = CreateSubscriptionResponseModel.fromJson(responseBody);
        Get.off(BuySubscriptionView(paymentUrl: createSubscriptionResponseModel.value.data!.url!),preventDuplicates: false);
      } else {
        throw "Subscription create is Failed!";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Subscription create is Failed: $e", bgColor: AppColors.red);
    } finally {
      isSubmit(false);
    }
  }


  Future<void> getPaymentDetailsController({required String paymentConfirm}) async {
    isLoading(true);
    try {

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: paymentConfirm,
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        bool success = responseBody['success'];
        if(success == true) {
          String message = responseBody['message'].toString();
          kSnackBar(message: message, bgColor: AppColors.green);
          Get.off(()=>PaymentSuccessView(),preventDuplicates: false);
        } else {
          String message = responseBody['message'].toString();
          kSnackBar(message: message, bgColor: AppColors.red);
        }
      } else {
        throw "Payment Failed!";
      }
    } catch (e) {
      kSnackBar(message: "Payment Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }





}