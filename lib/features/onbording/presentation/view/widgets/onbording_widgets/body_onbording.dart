import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';

class BodyOnbording extends StatelessWidget {
  const BodyOnbording({super.key, required this.title, required this.body});

  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 7,
            blurStyle: BlurStyle.normal,
            offset:const Offset(0,-10)
          ),
        ] ,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Styles.textStyleBold16,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              body,
              textAlign: TextAlign.center,
              style: Styles.textStyleNormal14,
            ),
          ],
        ),
      ),
    );
  }
}
