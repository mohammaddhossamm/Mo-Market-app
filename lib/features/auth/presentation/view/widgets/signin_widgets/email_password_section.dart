import 'package:e_commerce_app/core/shared/manager/password_cubit/password_cubit.dart';
import 'package:e_commerce_app/core/shared/manager/password_cubit/password_states.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signin_Cubit/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_tff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailPasswordSection extends StatelessWidget {
  const EmailPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit,PasswordStates>(

      builder: (context, state) {
        var appCubit = PasswordCubit.get(context);
        var signInCubit=SignInCubit.get(context); 
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
            AppLocalizations.of(context)!.email,
              style: Styles.textStyleBold14,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: AppLocalizations.of(context)!.emailHint,
              controller: signInCubit.emailController,
              onFieldSubmitted: (value) {},
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
             AppLocalizations.of(context)!.password,
              style: Styles.textStyleBold14,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: AppLocalizations.of(context)!.passwordHint,
              controller: signInCubit.passwordController,
              obscureText: appCubit.isVisible,
              suffixIcon: IconButton(
                onPressed: () {
                  appCubit.changePasswordVisibility();
                },
                icon: appCubit.isVisible
                    ? const Icon(Icons.visibility_off_rounded)
                    :const Icon(Icons.visibility_rounded),
              ),
              keyboardType: TextInputType.text,
            ),
          ],
        );
      },
    );
  }
}
