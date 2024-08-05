import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signin_Cubit/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signin_Cubit/signin_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SigninButtonSection extends StatelessWidget {
  const SigninButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInSuccessState) { 
          if (state.signInModel.status == true) {
        customSussessSnackBar(
          context,
          text: state.signInModel.message!,
        );
        SettingsService.saveSettings(key: kToken, value: state.signInModel.data!.token).then(
          (value) => GoRouter.of(context).go(AppRoutes.layoutView),
        );
      } else {
        customWorningSnackBar(
          context,
          text: state.signInModel.message!,
        );
      }
        }
        if (state is SignInErrorState) {
         customErrorSnackBar(
        context,
        text: state.error,
      );
        }
      },
      builder: (context, state) {
        var signInCubit = SignInCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state is! SignInLoadingState
                ? CustomButton(
                    textButton: AppLocalizations.of(context)!.signInHaveAcount,
                    onPressed: () {
                      signInCubit.signIn(
                        email: signInCubit.emailController.text,
                        password: signInCubit.passwordController.text,
                        context: context,
                      );
                    },
                  )
                : const Center(
                  child:CircularProgressIndicator(),
                ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                 AppLocalizations.of(context)!.dontHaveAccount,
                  style: Styles.textStyleNormal14,
                ),
                CustomTextButton(
                  text: AppLocalizations.of(context)!.signUpHaveAcount,
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.signUp);
                  },
                  underline: true,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
