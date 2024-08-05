import 'package:e_commerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      text: AppLocalizations.of(context)!.settings,
      onPressed: () {
        LayoutCubit.get(context).changeNavBarIndex(0);
      },
    );
  }
}
