import 'package:e_commerce_app/core/shared/widgets/custom_fav_icon.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.onPressed,
    this.haveFavIcon = false, 
    this.productId,
  });
  final String text;
  final void Function() onPressed;
  final bool haveFavIcon; 
  final int? productId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: haveFavIcon?AppColors.lightWhite:Colors.transparent,
            border: haveFavIcon? null: Border.all(
              width: 1,
              color: AppColors.grayColor,
            ),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 18,
            ),
          ),
        ),
        const Spacer(),
        Text(
          text,
          style: Styles.textStyleBold16,
        ),
        const Spacer(),
        haveFavIcon?
           CustomFavIcon(
            productId:productId!,
          ):const SizedBox(width: 36,),
        
      ],
    );
  }
}
