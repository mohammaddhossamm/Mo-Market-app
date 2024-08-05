import 'package:e_commerce_app/features/auth/presentation/view/widgets/head_text.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/signup_widgets/signup_button_section.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/signup_widgets/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeadText(
              title: AppLocalizations.of(context)!.signUpTitle,
              body:  AppLocalizations.of(context)!.signUpDescription,
            ),
            const SizedBox(
              height: 40,
            ),
            const SignUpData(),
            const SizedBox(
              height: 40,
            ),
            const SignUpButtonSection(),
          ],
        ),
      ),
    );
  }
}
