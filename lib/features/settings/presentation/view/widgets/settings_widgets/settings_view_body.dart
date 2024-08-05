import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/settings_widgets/setting_app_bar.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/settings_widgets/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SettingAppBar(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(
                    AssetsData.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.moMarket,
                style: Styles.textStyleNormal16,
              ),
              const SizedBox(
                height: 40,
              ),
              const SettingsData(),
               const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
