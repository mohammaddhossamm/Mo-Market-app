import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/onbording/presentation/manager/onbording_cubit/onbording_cubit.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/custom_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IndicatorSection extends StatelessWidget {
  const IndicatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnBordingCubit.get(context);
    return Row(
      children: [
         CustomButton(
          textButton:AppLocalizations.of(context)!.back,
          buttonWidth: 80,
          buttonColor: AppColors.grayColor,
          onPressed: (){
           cubit.onbordingController.previousPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn,
            );
          },
        ),
        const Spacer(),
        const CustomPageIndicator(),
        const Spacer(),
        CustomButton(
          textButton: AppLocalizations.of(context)!.next,
          buttonWidth: 80,
          onPressed: (){
            if (cubit.isLast) {
              SettingsService.saveSettings(key: kOnBording, value: true).then(
                (value) => GoRouter.of(context).go(AppRoutes.signIn),
              );
            } else {
              cubit.onbordingController.nextPage(
                duration: const Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn,
              );
            }
          },
        ),
      ],
    );
  }
}
