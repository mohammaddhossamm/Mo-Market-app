import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.primary,
          child: Text(
            AppLocalizations.of(context)!.mo,
            style: Styles.textStyleBold16.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
         Text(
           AppLocalizations.of(context)!.market,
          style: Styles.textStyleBold16,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.searchView);
          },
          icon: const Icon(
            Icons.search_rounded,
            color: AppColors.primary,
          ),
        )
      ],
    );
  }
}
