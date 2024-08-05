import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/signup_widgets/have_acount.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signup_cubit/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpButtonSection extends StatelessWidget {
  const SignUpButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignupSuccesscState) {
          if (state.model.status == true) {
            customSussessSnackBar(
              context,
              text: state.model.message!,
            );
            SettingsService.saveSettings(
                    key: kToken, value: state.model.data!.token)
                .then(
              (value) {
                GoRouter.of(context).go(AppRoutes.layoutView);
              },
            );
          } else {
            customWorningSnackBar(
              context,
              text: state.model.message!,
            );
          }
        }
        if (state is SignUpErrorState) {
          customErrorSnackBar(
            context,
            text: state.error,
          );
        }
      },
      builder: (context, state) {
        var signUpCubit = SignUpCubit.get(context);
        return Column(
          children: [
            state is! SignupLoadingcState
                ? CustomButton(
                    textButton:AppLocalizations.of(context)!.signUpHaveAcount,
                    onPressed: () {
                      if (kSignUpKey.currentState!.validate()) {
                        signUpCubit.signUp(
                          name: signUpCubit.nameController.text,
                          phone: signUpCubit.phoneController.text,
                          email: signUpCubit.emailController.text,
                          password: signUpCubit.passwordController.text,
                        );
                      }
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            const SizedBox(
              height: 30,
            ),
            const AlreadyHaveAcount(),
          ],
        );
      },
    );
  }
}
