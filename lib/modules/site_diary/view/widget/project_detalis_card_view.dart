// import 'package:construction_management_app/common/app_color/app_color.dart';
// import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
// import 'package:flutter/material.dart';
//
// class ProjectDetalisCardView extends StatelessWidget {
//   const ProjectDetalisCardView({
//     super.key,
//     required this.image,
//     required this.name,
//   });
//
//   final String image;
//   final String name;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: AppColors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(image, height: 20, width: 20),
//             SizedBox(height: 8),
//             CustomTextWidget(
//               title: name,
//               fontWeight: FontWeight.w600,
//               fontSize: 13,
//               color: AppColors.lightGray,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ProjectDetalisCardView extends StatelessWidget {
  const ProjectDetalisCardView({
    super.key,
    required this.image,
    required this.name,
    this.isSelected = false, // Add isSelected parameter with default value
  });

  final String image;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? AppColors.blue.withOpacity(0.2) : AppColors.white, // Change background color when selected
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? AppColors.blue : AppColors.gray, // Change border color when selected
          width: isSelected ? 2 : 1, // Thicker border when selected
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 20,
              width: 20,
              color: isSelected ? AppColors.blue : null, // Optional: tint image when selected
            ),
            SizedBox(height: 8),
            CustomTextWidget(
              title: name,
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: isSelected ? AppColors.blue : AppColors.lightGray, // Change text color when selected
            ),
          ],
        ),
      ),
    );
  }
}