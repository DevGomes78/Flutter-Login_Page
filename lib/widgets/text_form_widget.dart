import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  String? labelText;
  String? hintText;
  Widget? icon;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  bool obscureText;

  TextFormWidget(
    this.labelText,
    this.hintText,
    this.icon, {
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: icon,
      ),
      validator: validator,
      controller: controller,
      obscureText: obscureText,
    );
  }
}
