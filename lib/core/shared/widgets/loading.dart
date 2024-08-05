import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 60,
        width: double.infinity,
        ),
       const CircularProgressIndicator(),
        const SizedBox(height: 20,
        width: double.infinity,
        ),
        AnimatedTextKit(
  animatedTexts: [
     FadeAnimatedText(
         AppLocalizations.of(context)!.loading,
      
      textStyle: Styles.textStyleBold14.copyWith(
        color: AppColors.primary,

      ),
    ),
  ],
  pause: const Duration(milliseconds: 300),
  displayFullTextOnTap: true,
  stopPauseOnTap: false,
  repeatForever: true,
)
      ],
    );
  }
}
