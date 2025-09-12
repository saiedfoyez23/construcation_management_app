import 'dart:convert';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/data/socket_service.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/message/model/get_all_message_response_model.dart';
import 'package:construction_management_app/modules/company_user/message/model/get_single_chat_groups_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class GetAllMessageController extends GetxController {

  Rx<GetSingleChatGroupsResponseModel> getSingleChatGroupsResponseModel = GetSingleChatGroupsResponseModel().obs;
  Rx<GetAllMessageResponseModel> getAllMessageResponseModel = GetAllMessageResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  RxList<GetAllMessage> getAllMessageList = <GetAllMessage>[].obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  RxBool isLoading = false.obs;
  String groupChatId;
  Rx<ScrollController> scrollController = ScrollController().obs;
  final SocketService socketService = Get.put(SocketService());
  GetAllMessageController({required this.groupChatId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      socketService.init();
      socketService.socket.on('newMessage', (data) async {
        print("new message : ${data}");
        await handleIncomingMessage(data);
        print("Socket new message received >>>>>>>>>>>>>>>>>>>>>>>");
      });
      await getSeenAllMessageController(groupChatId: groupChatId);
      await getAllChatGroupController(groupChatId: groupChatId);
      await getAllMessageController(groupChatId: groupChatId);
    });
  }




  Future<void> handleIncomingMessage(dynamic data) async {
    print("call");
    if (data != null && data is Map<String, dynamic>) {
      getAllMessageList.clear();
      await getAllMessageController(groupChatId: groupChatId);
      _scrollToEnd();
    }
  }


  void _scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.value.hasClients) {
        scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }


  Future<void> getAllChatGroupController({required String groupChatId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getMessage}/${groupChatId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getSingleChatGroupsResponseModel.value = GetSingleChatGroupsResponseModel.fromJson(responseBody);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }


  Future<void> getAllMessageController({required String groupChatId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getAllMessage}/${groupChatId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getAllMessageResponseModel.value = GetAllMessageResponseModel.fromJson(responseBody);
        getAllMessageResponseModel.value.data?.data?.forEach((value) {
          getAllMessageList.add(value);
        });
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


  Future<void> getSeenAllMessageController({required String groupChatId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.patchRequest(
          api: "${Api.getAllMessage}/${groupChatId}/seen-all",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }




}