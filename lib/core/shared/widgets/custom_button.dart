import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton( 
      {super.key,
      required this.textButton,
      this.buttonColor=AppColors.primary,
      required this.onPressed,
        this.buttonWidth=double.infinity,
        this.buttonHeight=45,
      });

  final String textButton;
  final Color buttonColor;
  final double buttonWidth;
  final double buttonHeight;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const StadiumBorder(),
          foregroundColor: AppColors.grayColor,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Styles.textStyleNormal14.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
