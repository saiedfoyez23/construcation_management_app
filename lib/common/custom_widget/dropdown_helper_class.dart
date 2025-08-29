import 'package:construction_management_app/common/common.dart';
import 'package:flutter/material.dart';

class CustomDropdownHelperClass<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final double? width;
  final bool showDropdownIcon;
  final String Function(T)? itemToString;
  final Widget Function(T)? itemBuilder;
  final EdgeInsetsGeometry? contentPadding;
  final double iconSize;
  final Color iconColor;
  final TextStyle? hintStyle;
  final TextStyle? itemStyle;
  final TextStyle? selectedItemStyle;
  final Color fillColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;

  const CustomDropdownHelperClass({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = "Select",
    this.width,
    this.showDropdownIcon = true,
    this.itemToString,
    this.itemBuilder,
    this.contentPadding,
    this.iconSize = 24,
    this.iconColor = Colors.black,
    this.hintStyle,
    this.itemStyle,
    this.selectedItemStyle,
    this.fillColor = Colors.white,
    this.borderColor = const Color.fromRGBO(229, 231, 235, 1),
    this.borderRadius = 8,
    this.borderWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<T>(
        value: value,
        icon: const SizedBox.shrink(),
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: contentPadding ?? EdgeInsets.symmetric(
            horizontal: 16.hpm(context),
            vertical: 11.vpm(context),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r(context)),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          suffixIcon: showDropdownIcon
              ? Icon(
            Icons.keyboard_arrow_down_outlined,
            size: iconSize.r(context),
            color: iconColor,
          )
              : null,
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp(context),
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: itemBuilder != null ? itemBuilder!(item) : TextHelperClass.headingText(
              context: context,
              text: itemToString != null ? itemToString!(item) : item.toString(),
              fontSize: 20.sp(context),
              textColor: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          );
        }).toList(),
        onChanged: onChanged,
        style: selectedItemStyle ?? TextStyle(
          fontSize: 16.sp(context),
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}