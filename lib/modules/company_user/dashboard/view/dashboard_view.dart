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
              icon: Image.asset(
                controller.selectedIndex.value == 0 ?
                AppImages.home : AppImages.blackHome,
                height: 24,
                width: 24,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 1 ?
                AppImages.book : AppImages.blackBook,
                height: 24,
                width: 24,
              ),
              label: "Projects",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 2 ?
                AppImages.user : AppImages.blackUser,
                height: 24,
                width: 24,
              ),
              label: "Add User",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 3 ?
                AppImages.nmessage : AppImages.blackMessage,
                height: 24,
                width: 24,
              ),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 4 ?
                AppImages.nprofile : AppImages.blackProfile,
                height: 24,
                width: 24,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

