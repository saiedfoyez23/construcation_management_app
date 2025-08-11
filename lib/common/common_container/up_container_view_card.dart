import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class UpContainerViewCard extends StatelessWidget {
  const UpContainerViewCard({
    super.key,
    required this.text,
    this.color,
    this.icon,
    this.width,
    this.border,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final Border? border;
  final Icon? icon;
  final double? width;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width ?? 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: border ?? Border.all(color: Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Icon(Icons.delete_outlined, color: Colors.red),
          SizedBox(width: 3),
          CustomTextWidget(
            title: text,
            color: color ?? Colors.red,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
