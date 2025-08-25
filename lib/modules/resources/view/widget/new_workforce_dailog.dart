// import 'package:construction_management_app/common/app_color/app_color.dart';
// import 'package:construction_management_app/common/common_container/up_container_view_card.dart';
// import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
// import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
// import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
// import 'package:construction_management_app/modules/resources/controller/workforce_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class NewWorkforceDialog extends StatefulWidget {
//   const NewWorkforceDialog({super.key});
//
//   @override
//   State<NewWorkforceDialog> createState() => _NewWorkforceDialogState();
// }
//
// class _NewWorkforceDialogState extends State<NewWorkforceDialog> {
//   @override
//   Widget build(BuildContext context) {
//     WorkforceController workforceController = Get.put(WorkforceController());
//     return Container(
//       height: 250, // Increased height for dynamic fields
//       width: 350,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 CustomTextWidget(
//                   title: "Add New Workforce",
//                   color: AppColors.black,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 17,
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Obx(
//               () => Padding(
//                 padding: EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomTextWidget(
//                             title: "Worker",
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15,
//                           ),
//                           SizedBox(height: 10),
//                           SizedBox(
//                             height: 45,
//                             width: 130,
//                             child: CustomTextField(
//                               fillColor: AppColors.white,
//                               controller: workforceController.name,
//                               hintText: 'Laborers',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Expanded(
//                       flex: 2,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomTextWidget(
//                             title: "Quantity",
//                             color: AppColors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15,
//                           ),
//                           SizedBox(height: 10),
//                           SizedBox(
//                             height: 48,
//                             width: 130,
//                             child: CustomTextField(
//                               controller: workforceController.quantity,
//                               fillColor: AppColors.white,
//                               hintText: '1',
//                               //keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // workforceController.addWorkerField();
//                   },
//                   child: UpContainerViewCard(
//                     text: 'Add Worker',
//                     border: Border.all(color: AppColors.blue),
//                     color: AppColors.blue,
//                     icon: Icon(Icons.add, color: AppColors.blue),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: () {
//                     // if (workforceController.workerFields.length > 1) {
//                     //   workforceController.removeWorkerField(
//                     //     workforceController.workerFields.length - 1,
//                     //   );
//                     // }
//                   },
//                   child: UpContainerViewCard(
//                     text: 'Remove',
//                     icon: Icon(Icons.delete_outlined, color: AppColors.red),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomButtonWidget(
//                     onTap: () {
//                       Get.back();
//                     },
//                     width: 150,
//                     title: "Cancel",
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     cardColor: Color(0xFFF3F4F6),
//                     color: AppColors.lightGray,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Obx(
//                     () => CustomButtonWidget(
//                       width: 150,
//                       title: "Save",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       cardColor: AppColors.blue,
//                       onTap: () {
//                         workforceController.postWorkforce(
//                           name: workforceController.name.text,
//                           quantity: int.parse(
//                             workforceController.quantity.text,
//                           ),
//                         );
//                         //workforceController.saveAllWorkers();
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///
library;

import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_field.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewWorkforceDialog extends StatefulWidget {
  const NewWorkforceDialog({super.key});

  @override
  State<NewWorkforceDialog> createState() => _NewWorkforceDialogState();
}

class _NewWorkforceDialogState extends State<NewWorkforceDialog> {
  @override
  Widget build(BuildContext context) {
   // WorkforceController workforceController = Get.put(WorkforceController());
    return Container(
      height: 220,
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      // child: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           CustomTextWidget(
      //             title: "Add New Workforce",
      //             color: AppColors.black,
      //             fontWeight: FontWeight.w600,
      //             fontSize: 17,
      //           ),
      //         ],
      //       ),
      //       SizedBox(height: 10),
      //       Padding(
      //         padding: EdgeInsets.only(bottom: 10),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Expanded(
      //               flex: 2,
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   CustomTextWidget(
      //                     title: "Worker",
      //                     color: AppColors.black,
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 15,
      //                   ),
      //                   SizedBox(height: 10),
      //                   SizedBox(
      //                     height: 45,
      //                     width: 130,
      //                     child: CustomTextField(
      //                       fillColor: AppColors.white,
      //                       controller: workforceController.name,
      //                       hintText: 'Laborers',
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             SizedBox(width: 5),
      //             Expanded(
      //               flex: 2,
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   CustomTextWidget(
      //                     title: "Quantity",
      //                     color: AppColors.black,
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 15,
      //                   ),
      //                   SizedBox(height: 10),
      //                   SizedBox(
      //                     height: 48,
      //                     width: 130,
      //                     child: CustomTextField(
      //                       controller: workforceController.quantity,
      //                       fillColor: AppColors.white,
      //                       hintText: '1',
      //                       //keyboardType: TextInputType.number,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //       Row(
      //         children: [
      //           Expanded(
      //             child: CustomButtonWidget(
      //               onTap: () {
      //                 Get.back();
      //               },
      //               width: 150,
      //               title: "Cancel",
      //               fontWeight: FontWeight.w400,
      //               fontSize: 14,
      //               cardColor: Color(0xFFF3F4F6),
      //               color: AppColors.lightGray,
      //             ),
      //           ),
      //           SizedBox(width: 10),
      //           Expanded(
      //             child: Obx(
      //               () =>
      //                   workforceController.isLoading.value
      //                       ? Center(child: CircularProgressIndicator())
      //                       : CustomButtonWidget(
      //                         onTap: () {
      //                           workforceController.postWorkforce(
      //                             name: workforceController.name.text,
      //                             quantity: int.parse(
      //                               workforceController.quantity.text,
      //                             ),
      //                           );
      //                         },
      //                         width: 150,
      //                         title: "Save",
      //                         fontWeight: FontWeight.w400,
      //                         fontSize: 14,
      //                         cardColor: AppColors.blue,
      //                       ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
