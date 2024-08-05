import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
   const CustomTextButton(
      {super.key,
      required this.text,
      this.underline=false,
      this.fontSize=14,
      this.fontWeight=FontWeight.normal,
      required this.onPressed,});

  final String text;
  final void Function()? onPressed;
  final bool underline;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 8,vertical: 2)),
      ),
      child: Text(
        text,
        style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: AppColors.primary,
        decoration: underline?TextDecoration.underline:null,
        decorationColor: AppColors.primary,
      ),
      ),
    );
  }
}
