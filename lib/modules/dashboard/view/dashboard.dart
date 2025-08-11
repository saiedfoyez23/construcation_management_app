import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/modules/create_project/view/all_job_screen.dart';
import 'package:construction_management_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:construction_management_app/modules/home/view/home_screen.dart';
import 'package:construction_management_app/modules/message/view/group_message.dart';
import 'package:construction_management_app/modules/profile/view/profile_screen.dart';
import 'package:construction_management_app/modules/supervisor/view/employ_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> _screens = [
    HomeScreen(),
    AllJobScreen(),
    EmployListScreen(),
    GroupMessage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      body: Obx(
        () => _screens[controller.selectedIndex.value],
      ), // Dynamic screen update
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff2C5880),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.home, height: 24, width: 24),
              label: "Home",
              tooltip: "hi",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.book, height: 24, width: 24),
              label: "Projects",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.user, height: 24, width: 24),
              label: "Add User",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.nmessage, height: 24, width: 24),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.nprofile, height: 24, width: 24),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
