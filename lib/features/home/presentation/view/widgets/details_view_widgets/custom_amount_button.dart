import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:flutter/material.dart';

class CustomAmountButton extends StatelessWidget {
  const CustomAmountButton({
    super.key,
    required this.onPressed, 
   this.isAdd=true,
  });
  final void Function() onPressed;
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color:isAdd? AppColors.primary:AppColors.lightWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      minWidth: 25,
      padding: const EdgeInsets.all(0),
      height: 25,
      child: Icon(
        isAdd? Icons.add:Icons.remove,
        color: isAdd? Colors.white:AppColors.balckColor,
        size: 20,
      ),
    );
  }
}
