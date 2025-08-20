import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildRadio(
    {required String value, Function(String?)? onChanged, String? groupValue}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      Text(value),
    ],
  );
}
