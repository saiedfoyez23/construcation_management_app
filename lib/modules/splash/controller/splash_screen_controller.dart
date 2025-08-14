import 'package:construction_management_app/modules/splash/view/welcome_screen_view.dart';
import 'package:get/get.dart';

import '../../../common/app_constant/app_constant.dart';
import '../../../common/local_store/local_store.dart';
import '../../dashboard/view/dashboard_view.dart';

class SplashScreenController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await redirectionFunction();
    });
  }


  Future<void> redirectionFunction() async {
    // Navigate to the main screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      var token = LocalStorage.getData(key: AppConstant.token);
      //Get.to(() => WelcomeScreenView());
      Get.to(() => DashboardView(index: 0,));
      // if (token != '') {
      //   Get.to(() => Dashboard()); // Navigate to the home screen
      // } else {
      //   Get.to(() => WelcomeScreen()); // Navigate to the home screen
      // }
    });
  }



}