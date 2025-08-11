import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFromFieldWidget extends StatefulWidget {
  const CustomTextFromFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.color,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters, // Added inputFormatters parameter
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;
  final Color? color;
  final TextInputType? keyboardType;
  final int? maxLength; // Changed from double? to int? to match TextFormField
  final List<TextInputFormatter>? inputFormatters; // Added inputFormatters

  @override
  State<CustomTextFromFieldWidget> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFromFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      maxLength: widget.maxLength, // Pass maxLength
      inputFormatters: widget.inputFormatters, // Pass inputFormatters
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.lightGray),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: _obscureText ? Colors.grey : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}