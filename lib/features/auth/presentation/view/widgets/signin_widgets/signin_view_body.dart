import 'package:e_commerce_app/features/auth/presentation/view/widgets/head_text.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/signin_widgets/email_password_section.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/signin_widgets/signin_button_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [ 
                HeadText(
                  title: AppLocalizations.of(context)!.signInTitle,
                  body: AppLocalizations.of(context)!.signInDescription,
                ),
                const SizedBox(
                  height: 40,
                ),
                const EmailPasswordSection(),
                const SizedBox(
                  height: 40,
                ),
                const SigninButtonSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
