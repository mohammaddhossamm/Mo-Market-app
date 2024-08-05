import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:flutter/material.dart';

OutlineInputBorder borderTFF({Color borderColor = AppColors.grayColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: borderColor,
    ),
  );
}