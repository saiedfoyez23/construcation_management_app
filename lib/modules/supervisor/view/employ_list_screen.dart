// import 'package:construction_management_app/common/app_color/app_color.dart';
// import 'package:construction_management_app/common/app_images/app_images.dart';
// import 'package:construction_management_app/common/common_container/container_view.dart';
// import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
// import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
// import 'package:construction_management_app/modules/supervisor/controller/company_employees_controller.dart';
// import 'package:construction_management_app/modules/supervisor/controller/create_employ_controller.dart';
// import 'package:construction_management_app/modules/supervisor/view/supervisor_detalis.dart';
// import 'package:construction_management_app/modules/supervisor/view/widget/add_new_supervisor_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EmployListScreen extends StatefulWidget {
//   const EmployListScreen({super.key});
//
//   @override
//   State<EmployListScreen> createState() => _EmployListScreenState();
// }
//
// class _EmployListScreenState extends State<EmployListScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   // Sample data for Supervisors
//   final List<Map<String, String>> supervisors = [
//     {
//       "name": "Michael Anderson",
//       "role": "Supervisor",
//       "image": AppImages.darleneprofile,
//     },
//     {
//       "name": "Sarah Johnson",
//       "role": "Supervisor",
//       "image": AppImages.darleneprofile,
//     },
//     {
//       "name": "David Lee",
//       "role": "Supervisor",
//       "image": AppImages.darleneprofile,
//     },
//     {
//       "name": "Emma Watson",
//       "role": "Supervisor",
//       "image": AppImages.darleneprofile,
//     },
//   ];
//
//   // Sample data for Project Managers
//   final List<Map<String, String>> projectManagers = [
//     {
//       "name": "John Smith",
//       "role": "Project Manager",
//       "image": AppImages.darleneprofile,
//     },
//     {
//       "name": "Lisa Brown",
//       "role": "Project Manager",
//       "image": AppImages.darleneprofile,
//     },
//     {
//       "name": "Mark Taylor",
//       "role": "Project Manager",
//       "image": AppImages.darleneprofile,
//     },
//     {
//       "name": "Anna Davis",
//       "role": "Project Manager",
//       "image": AppImages.darleneprofile,
//     },
//   ];
//
//   // Widget for Supervisor Card
//   Widget supervisorCard(Map<String, String> employee) {
//     return Card(
//       color: AppColors.white,
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(16),
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(employee['image']!),
//           radius: 30,
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomTextWidget(
//               title: employee['name']!,
//               color: AppColors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//             CustomTextWidget(
//               title: employee['role']!,
//               color: AppColors.lightGray,
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: Icon(Icons.delete_outlined, color: Colors.red),
//           onPressed: () {
//             // Add delete logic for supervisor
//           },
//         ),
//         onTap: () {
//           Get.to(() => SupervisorDetalis());
//         },
//         isThreeLine: true,
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 8),
//             GestureDetector(
//               onTap: () {
//                 Get.to(() => SupervisorDetalis());
//               },
//               child: Row(
//                 children: [
//                   CustomTextWidget(
//                     title: "View Details",
//                     color: AppColors.blue,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   SizedBox(width: 10),
//                   Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 20),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget for Project Manager Card
//   Widget projectManagerCard(Map<String, String> employee) {
//     return Card(
//       color: AppColors.white,
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       elevation: 3, // Slightly different elevation for visual distinction
//       child: ListTile(
//         contentPadding: EdgeInsets.all(16),
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(employee['image']!),
//           radius: 30,
//           backgroundColor: AppColors.blue, // Different styling
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomTextWidget(
//               title: employee['name']!,
//               color: AppColors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//             CustomTextWidget(
//               title: employee['role']!,
//               color: AppColors.lightGray, // Different color for distinction
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: Icon(Icons.delete_outlined, color: Colors.red),
//           onPressed: () {
//             // Add delete logic for project manager
//           },
//         ),
//         onTap: () {
//           // Navigate to a different details page for Project Managers if needed
//           Get.to(
//             () => SupervisorDetalis(),
//           ); // Update to a ProjectManagerDetails page if available
//         },
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 8),
//             CustomTextWidget(
//               title: "Projects: 5 Active", // Example of additional info
//               color: AppColors.blue,
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     CompanyEmployeesController controller = Get.put(
//       CompanyEmployeesController(),
//     );
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         title: Text('Employee List', style: TextStyle(color: Colors.black)),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: GestureDetector(
//               onTap: () {
//                 Get.dialog(
//                   AlertDialog(
//                     backgroundColor: AppColors.white,
//                     content: AddNewSupervisorDialog(),
//                   ),
//                 );
//               },
//               child: CustomContainerTextView(
//                 width: 100,
//                 image: AppImages.add,
//                 text: "Add New",
//               ),
//             ),
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(110),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 CustomTextField(
//                   fillColor: AppColors.white,
//                   hintText: "Search Project...",
//                   prefixIcon: Icon(Icons.search),
//                 ),
//                 TabBar(
//                   controller: _tabController,
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.grey,
//                   indicatorColor: Colors.blue,
//                   tabs: [
//                     Tab(text: 'Supervisor', height: 60),
//                     Tab(text: 'Project Manager', height: 60),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//         child: TabBarView(
//           controller: _tabController,
//           children: [
//             // Supervisor Tab
//             ListView(
//               children:
//                   supervisors
//                       .map((employee) => supervisorCard(employee))
//                       .toList(),
//             ),
//             // Project Manager Tab
//             ListView(
//               children:
//                   projectManagers
//                       .map((employee) => projectManagerCard(employee))
//                       .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/common_container/container_view.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard.dart';
import 'package:construction_management_app/modules/supervisor/controller/company_employees_controller.dart';
import 'package:construction_management_app/modules/supervisor/view/widget/add_new_supervisor_dialog.dart';
import 'package:construction_management_app/modules/supervisor/view/widget/manager_screen.dart';
import 'package:construction_management_app/modules/supervisor/view/widget/supervisor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployListScreen extends StatefulWidget {
  const EmployListScreen({super.key});

  @override
  State<EmployListScreen> createState() => _EmployListScreenState();
}

class _EmployListScreenState extends State<EmployListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final CompanyEmployeesController controller = Get.put(
    CompanyEmployeesController(),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Fetch employees when the screen initializes
    controller.getCompanyEmployees();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(Dashboard());
          },
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0,
        title: Text('Employee List', style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    backgroundColor: AppColors.white,
                    content: AddNewSupervisorDialog(),
                  ),
                );
              },
              child: CustomContainerTextView(
                width: 100,
                image: AppImages.add,
                text: "Add New",
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomTextField(
                  fillColor: AppColors.white,
                  hintText: "Search Project...",
                  prefixIcon: const Icon(Icons.search),
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  tabs: const [
                    Tab(text: 'Supervisor', height: 60),
                    Tab(text: 'Project Manager', height: 60),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Obx(
          () =>
              controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.companyEmployeesList.isEmpty
                  ? const Center(child: Text('No employees found'))
                  : TabBarView(
                    controller: _tabController,
                    children: [
                      SupervisorScreen(),
                      // Project Manager Tab
                      ManagerScreen(),
                    ],
                  ),
        ),
      ),
    );
  }
}
