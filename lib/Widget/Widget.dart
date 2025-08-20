  import  'package:flutter/material.dart';


Widget buildAvatar() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade300,
          child: const Icon(Icons.person_outlined,
              size: 60, color: Colors.black87),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              splashRadius: 24,
              icon: const Icon(Icons.camera_alt),
              color: Colors.blue,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

