import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MyPasswordTextFiled extends StatelessWidget {
  MyPasswordTextFiled({
    super.key,
    required this.visible,
    required this.changeVisible,
    required this.controller,
    this.validator,
  });

  String? Function(String?)? validator;
  final bool visible;
  Function() changeVisible;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: !visible,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
          hintText: '********',
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: InkWell(
            onTap: changeVisible,
            child: visible
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
