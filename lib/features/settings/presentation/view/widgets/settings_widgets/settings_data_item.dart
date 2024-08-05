import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';

class SettingsDataItem extends StatelessWidget {
    final IconData icon;
    final String text;
    final void Function()? onTap;
  const SettingsDataItem({super.key, required this.icon, required this.text, this.onTap, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 18,
            ),
            const SizedBox(width: 20,),
             Text(
                 text,
                 style:Styles.textStyleNormal14,
                 ),
              const Spacer(),
              const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.primary,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
