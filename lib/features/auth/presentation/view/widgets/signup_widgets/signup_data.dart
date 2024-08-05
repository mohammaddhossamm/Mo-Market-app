import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/manager/password_cubit/password_cubit.dart';
import 'package:e_commerce_app/core/shared/manager/password_cubit/password_states.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_tff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpData extends StatelessWidget {
  const SignUpData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit,PasswordStates>(
      builder: (context, state) {
         var appCubit = PasswordCubit.get(context);
        var signUpCubit=SignUpCubit.get(context);
        return Form(
          key: kSignUpKey,
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Text(
           AppLocalizations.of(context)!.name,
            style: Styles.textStyleBold14,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hintText: AppLocalizations.of(context)!.nameHint,
            controller: signUpCubit.nameController,
            keyboardType: TextInputType.name,
            ),
            const SizedBox(
            height: 20,
          ),
            Text(
          AppLocalizations.of(context)!.phone,
            style: Styles.textStyleBold14,

          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hintText: AppLocalizations.of(context)!.phoneHint,
            controller: signUpCubit.phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
             if(value?.length !=11 ){
              return AppLocalizations.of(context)!.invalidPhone;
             }
             return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
           AppLocalizations.of(context)!.email,
            style: Styles.textStyleBold14,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hintText: AppLocalizations.of(context)!.emailHint,
            controller: signUpCubit.emailController,
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
                controller: signUpCubit.passwordController,
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
                 validator: (value) {
                  if(value!.isEmpty){
                     return AppLocalizations.of(context)!.emptyPassword;
                  }
             if(value.length < 8 ){
              return AppLocalizations.of(context)!.shortPassword;
             }
             return null;
            },
              ),
                ],
              ),
        );
      },
      );
  }
}
