import 'package:get/get.dart';

class EmployeeDashboardController extends GetxController {
  var selectedIndex = 0.obs;

  int initialIndex = 0;

  EmployeeDashboardController({required this.initialIndex});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onItemTapped(initialIndex);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}