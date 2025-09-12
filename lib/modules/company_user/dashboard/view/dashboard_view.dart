import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/modules/company_user/create_project/view/all_job_view.dart';
import 'package:construction_management_app/modules/company_user/dashboard/controller/dashboard_controller.dart';
import 'package:construction_management_app/modules/company_user/home/view/home_view.dart';
import 'package:construction_management_app/modules/company_user/message/view/group_message_view.dart';
import 'package:construction_management_app/modules/company_user/profile/view/profile_view.dart';
import 'package:construction_management_app/modules/company_user/supervisor/view/employee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardView extends StatelessWidget {
  DashboardView({super.key,required this.index});
  final int index;
  final List<Widget> _screens = [
    HomeView(),
    AllJobView(),
    EmployeeListView(),
    GroupMessageView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController(initialIndex: index));
    return Scaffold(
      body: Obx(() => _screens[controller.selectedIndex.value],),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (int index) {
            controller.onItemTapped(index);
          },
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

