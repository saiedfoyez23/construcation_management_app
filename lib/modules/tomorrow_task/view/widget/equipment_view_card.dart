import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class EquipmentViewCard extends StatelessWidget {
  const EquipmentViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Image.asset("name", height: 12, width: 12),
          CustomTextWidget(
            title: "title",
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
