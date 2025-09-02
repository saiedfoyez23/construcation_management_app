import 'dart:convert';
import 'dart:io';
import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/custom_widget/custom_snackbar.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/modules/authentication/sign_in/view/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import "package:http/http.dart" as http;

class BaseClient {
  static getRequest({required String api, params, headers}) async {
    debugPrint("API Hit: $api");
    http.Response response = await http.get(
      Uri.parse(api).replace(queryParameters: params),
      headers: headers,
    );
    return response;
  }

  static postRequest({required String api, body, headers}) async {
    debugPrint("API Hit: $api");
    debugPrint("body: $body");
    http.Response response = await http.post(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    debugPrint(
      "<================= response ====== ${response.body} ===========>",
    );

    return response;
  }

  static patchRequest({required String api, body, headers}) async {
    debugPrint("API Hit: $api");
    debugPrint("body: $body");
    http.Response response = await http.patch(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }


  static putRequest({required String api, body, headers}) async {
    debugPrint("API Hit: $api");
    debugPrint("body: $body");
    http.Response response = await http.put(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }

  static deleteRequest({required String api, body, headers}) async {
    debugPrint("API Hit: $api");
    http.Response response = await http.delete(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }

  static handleResponse(http.Response response) async {
    try {
      // debugPrint('Response: ${response.body}');
      if (response.statusCode >= 200 && response.statusCode <= 210) {
        debugPrint('SuccessCode: ${response.statusCode}');
        debugPrint('SuccessResponse: ${response.body}');

        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        print(response.body);
        kSnackBar(
          message: json.decode(response.body)['message'].toString(),
          bgColor: AppColors.red,
        );
        print(response.body);
        if(json.decode(response.body)['message'].toString() == "jwt expired") {
          LocalStorage.removeData(key: AppConstant.token);
          LocalStorage.removeData(key: AppConstant.getProfileResponse);
          Get.offAll(()=>SignInView());
        }
        /* try {
            var response = await http.post(
              Uri.parse(ApiConstant.refreshToken),
              headers: {
                'Accept': 'application/json',
                'refreshToken': '${LocalStorage.getData(key: AppConstant.refreshToken)}',

              },
            );
            if (response.statusCode == 200) {
              final Map<String, dynamic> responseData = jsonDecode(response.body);
              LocalStorage.saveData(key: AppConstant.token, data: responseData["data"]["accessToken"].toString());
              Get.snackbar('Success', 'Token Updated.');
            } else {
              Get.snackbar('Error', 'Failed Token Updated');
            }
          } catch (e) {
            Get.snackbar('Error', 'Failed to Token Updated: $e');
          }*/

        //  logout();
        String msg = "Unauthorized";
        if (response.body.isNotEmpty) {
          if (json.decode(response.body)['errors'] != null) {
            msg = json.decode(response.body)['errors'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        kSnackBar(
          message: json.decode(response.body)['message'].toString(),
          bgColor: AppColors.gray,
        );
        print(response.body);
      } else if (response.statusCode == 400) {
        kSnackBar(
          message: json.decode(response.body)['message'].toString(),
          bgColor: AppColors.gray,
        );
        debugPrint('Response: ${response.body}');
      } else if (response.statusCode == 403) {
        kSnackBar(
          message: json.decode(response.body)['message'].toString(),
          bgColor: AppColors.gray,
        );
      } else if (response.statusCode == 406) {
        kSnackBar(
          message: json.decode(response.body)['message'].toString(),
          bgColor: AppColors.gray,
        );
      } else if (response.statusCode == 409) {
        kSnackBar(
          message: json.decode(response.body)['message'].toString(),
          bgColor: AppColors.gray,
        );
      } else if (response.statusCode == 500) {
        kSnackBar(
          message: json.decode(response.body)['message'].toString(),
          bgColor: AppColors.gray,
        );
        throw "Server Error";
      } else {
        debugPrint('ErrorCode: ${response.statusCode}');
        debugPrint('ErrorResponse: ${response.body}');

        String msg = "Something went wrong";
        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body)['errors'];
          if (data == null) {
            msg = jsonDecode(response.body)['message'] ?? msg;
          } else if (data is String) {
            msg = data;
          } else if (data is Map) {
            msg = data['email'][0];
          }
        }

        throw msg;
      }
    } on SocketException catch (_) {
      throw "noInternetMessage";
    } on FormatException catch (e) {
      print(e);
      throw "Bad response format";
    } catch (e) {
      throw e.toString();
    }
  }

  static void logout() {
    //  LocalStorage.removeData(key: AppConstant.token);
    //  Get.offAllNamed(AppRoute.signInScreen);
  }
}