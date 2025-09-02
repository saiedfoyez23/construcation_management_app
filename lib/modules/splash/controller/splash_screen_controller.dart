import 'dart:convert';

import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/company_user/dashboard/view/dashboard_view.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/view/employee_dashboard_view.dart';
import 'package:construction_management_app/modules/splash/view/welcome_screen_view.dart';
import 'package:get/get.dart';
import '../../../common/app_constant/app_constant.dart';
import '../../../common/local_store/local_store.dart';

class SplashScreenController extends GetxController {


  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel(success: null, message: null, data: null).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 2),() async {
      await checkTheUserLogin();
    });
  }


  Future<void> checkTheUserLogin() async {
    print(LocalStorage.getData(key: AppConstant.token));
    if(LocalStorage.getData(key: AppConstant.token) != null) {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));
      Map<String, dynamic> decodedToken = parseJwt(loginResponseModel.value.data!.accessToken!);
      if(decodedToken['role'] == "company_admin") {
        Get.off(()=>DashboardView(index: 0,),preventDuplicates: false);
      } else {
        Get.off(()=>EmployeeDashboardView(index: 0),preventDuplicates: false);
      }
    } else {
      Get.off(()=>WelcomeScreenView(),preventDuplicates: false);
    }
  }






  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
      case 3:
        output += '=' * (4 - output.length % 4);
        break;
    }

    return utf8.decode(base64Url.decode(output));
  }



}