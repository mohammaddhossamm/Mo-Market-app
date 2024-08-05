import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/custom_page_view.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/indicator_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomTextButton(
                text: 'Skip',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                onPressed: () {
                  SettingsService.saveSettings(key: kOnBording, value: true)
                      .then(
                    (value) => GoRouter.of(context).go(AppRoutes.signIn),
                  );
                },
              ),
            ),
            const Expanded(
              child: CustomPageView(),
            ),
            const IndicatorSection(),
          ],
        ),
      ),
    );
  }
}
