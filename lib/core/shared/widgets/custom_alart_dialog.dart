import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void customAlartDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      Future.delayed(const Duration(milliseconds: 2500), () {
        GoRouter.of(context).pop();
      });
      return  AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline_rounded,
              color: AppColors.primary,
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.orderDone,
              style: Styles.textStyleBold14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    },
  );
}
