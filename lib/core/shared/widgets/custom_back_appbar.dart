import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget? customBackAppBar(context){
return AppBar(
  backgroundColor: Colors.white,
  surfaceTintColor: Colors.white,
  elevation: 0,
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grayColor,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
    );

}
    