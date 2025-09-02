import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  int initialIndex = 0;

  DashboardController({required this.initialIndex});

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