import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomImageError extends StatelessWidget {
  const CustomImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
         AppLocalizations.of(context)!.noImage,
          style: Styles.textStyleBold12,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.error,
          color: AppColors.primary,
        ),
      ],
    );
  }
}