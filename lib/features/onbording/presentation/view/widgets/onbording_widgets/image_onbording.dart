import 'package:flutter/material.dart';

class ImageOnbording extends StatelessWidget {
  const ImageOnbording({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 30,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Image.asset(
              image,
            ),
          ),
        );
  }
}