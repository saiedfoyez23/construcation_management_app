import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:get/get.dart';

class PaymentSuccessController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 5),() async {
      Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
    });
  }


}