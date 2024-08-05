import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:flutter/material.dart';

Widget customDivider(){
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 5.0),
    child: Divider(color: AppColors.grayColor,),
  );
}