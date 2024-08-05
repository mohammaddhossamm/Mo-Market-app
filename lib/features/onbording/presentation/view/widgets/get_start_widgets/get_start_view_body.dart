import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/get_start_widgets/choose_language_widget.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/get_start_widgets/get_start_images.dart';
import 'package:e_commerce_app/core/shared/widgets/mix_colored_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStartViewBody extends StatelessWidget {
  const GetStartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const GetStartImages(),
            const SizedBox(
              height: 30,
            ),
             MixColoredText(
              text1:  AppLocalizations.of(context)!.statedTitle1,
              colorestext: AppLocalizations.of(context)!.moApp,
              text2: AppLocalizations.of(context)!.statedTitle2,
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              AppLocalizations.of(context)!.statedDescription,
              style: Styles.textStyleNormal12,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomButton(
                textButton: AppLocalizations.of(context)!.startButton,
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.onBoardingView);
                },
              ),
            ),
            const ChooseLanguageWidget(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
