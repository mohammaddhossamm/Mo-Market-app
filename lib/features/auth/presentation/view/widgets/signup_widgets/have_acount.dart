import 'package:e_commerce_app/core/shared/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlreadyHaveAcount extends StatelessWidget {
  const AlreadyHaveAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
         AppLocalizations.of(context)!.haveAccount,
          style: Styles.textStyleNormal14,
        ),
        CustomTextButton(
          text: AppLocalizations.of(context)!.signInHaveAcount,
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.signIn);
          },
          underline: true,
        ),
      ],
    );
  }
}
