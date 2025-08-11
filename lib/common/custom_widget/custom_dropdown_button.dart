import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedRole = 'Green Valley School';
  // Default role
  final List<String> roles = [
    'Green Valley School',
    'Select you role',
    'Select you role2',
  ];

  // Function to update form based on role selection
  void updateForm(String? role) {
    setState(() {
      selectedRole = role;
      // Add logic to update form fields based on role if needed
      // For example, changing email domain or enabling/disabling fields
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.white,
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      value: selectedRole,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      items:
          roles.map((String role) {
            return DropdownMenuItem<String>(
              value: role,
              child: Text(role, style: TextStyle(color: AppColors.lightGray)),
            );
          }).toList(),
      onChanged: (String? newValue) {
        updateForm(newValue);
      },
    );
  }
}
