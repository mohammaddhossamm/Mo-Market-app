import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/manager/password_cubit/password_cubit.dart';
import 'package:e_commerce_app/core/shared/manager/password_cubit/password_states.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_tff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomSheetBody extends StatelessWidget {
  final String title;
  final void Function()? onTapOk;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool? suffixIcon;

  const CustomBottomSheetBody({
    super.key,
    required this.title,
    required this.onTapOk,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, PasswordStates>(
      builder: (context, state) {
        var passwordCubit = PasswordCubit.get(context);
        return Form(
          key: kProfileKey,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Styles.textStyleNormal12,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormField(
                  hintText: hintText,
                  controller: controller,
                  keyboardType: keyboardType,
                  validator: validator,
                  suffixIcon: suffixIcon!
                      ? IconButton(
                          onPressed: () {
                            passwordCubit.changePasswordVisibility();
                          },
                          icon: passwordCubit.isVisible
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        )
                      : null,
                  obscureText: suffixIcon! ? passwordCubit.isVisible : false,
                ),
                Row(
                  children: [
                    CustomTextButton(
                      text: AppLocalizations.of(context)!.ok,
                      onPressed: onTapOk,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomTextButton(
                      text: AppLocalizations.of(context)!.cancel,
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

profileBottomSheet(
  BuildContext context, {
  required String title,
  required void Function()? onTapOk,
  required TextEditingController controller,
  required String hintText,
  TextInputType? keyboardType,
  String? Function(String? value)? validator,
  bool? suffixIcon,
  bool obscureText = false,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return CustomBottomSheetBody(
        title: title,
        onTapOk: onTapOk,
        controller: controller,
        hintText: hintText,
        keyboardType: keyboardType,
        validator: validator,
        suffixIcon: suffixIcon,
      );
    },
  );
}
