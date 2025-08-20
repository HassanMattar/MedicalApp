import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    super.key,
    required this.hintText,
    this.textInputType,
    required this.controller,
    this.prefixIcon,
    this.onTap,
    this.initialValue,
    this.suffixIcon,
    this.validator
  });

  String hintText;
  VoidCallback? onTap;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  Icon? prefixIcon;
  Icon? suffixIcon;
  String? initialValue;

  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      onTap: onTap,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
