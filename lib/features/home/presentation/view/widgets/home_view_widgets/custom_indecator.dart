import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:flutter/material.dart';

List<Widget> customIndecatpr({required int index,required int length}) {
  List<Widget> list = [];
  for (int i = 0; i < length; i++) {
    if (i == index) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: AppColors.primary, 
            shape: BoxShape.circle,
          ),
        ),
      ));
    } else {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          width: 8,
          height: 8,
          decoration:  const BoxDecoration(
            color: AppColors.lightWhite,
            shape: BoxShape.circle,
          ),
        ),
      ));
    }
  }
  return list;
}
