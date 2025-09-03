import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/modules/employee_user/create_project/view/employee_all_job_view.dart';
import 'package:construction_management_app/modules/employee_user/dashboard/controller/employee_dashboard_controller.dart';
import 'package:construction_management_app/modules/employee_user/home/view/employee_home_view.dart';
import 'package:construction_management_app/modules/employee_user/message/view/group_message.dart';
import 'package:construction_management_app/modules/employee_user/profile/view/employee_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmployeeDashboardView extends StatelessWidget {
  EmployeeDashboardView({super.key,required this.index});
  final int index;
  final List<Widget> _screens = [
    EmployeeHomeView(),
    EmployeeAllJobView(),
    EmployeeGroupMessage(),
    EmployeeProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    EmployeeDashboardController controller = Get.put(EmployeeDashboardController(initialIndex: index));
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
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.book, height: 24, width: 24),
              label: "Projects",
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

