import 'package:flutter/material.dart';

import '../Core/constant.dart';

Widget buildPageBuild(
    {required String image,
    required String title,
    String? desc,
    Widget? widget,
    required context}) {
  return Column(
    children: [
      Image.asset(
        image,
        height: MediaQuery.of(context).size.height * 0.45,
        width: double.infinity,
        fit: BoxFit.fitHeight,
      ),
      Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
     if (desc != null)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
        ),
      if (widget != null) UserType(),
    ],
  );
}
