import 'package:e_commerce_app/core/shared/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/logout_cubit/logout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAlertDialoge extends StatelessWidget {
  const CustomAlertDialoge({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutStates>(builder: (context, state) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: state is LogoutLoadingState
              ? const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    ),
                  ),
                ]
              :  [
                  Text(
                   AppLocalizations.of(context)!.logoutDes,
                    style: Styles.textStyleNormal14,
                    textAlign: TextAlign.center,
                  ),
                ],
        ),
        actions: state is LogoutLoadingState
            ? null
            : [
                CustomTextButton(
                  text: AppLocalizations.of(context)!.cancel,
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                CustomTextButton(
                  text: AppLocalizations.of(context)!.logout,
                  onPressed: () {
                    LogoutCubit.get(context).logout().then(
                      (value) => GoRouter.of(context).go,
                    );
                  },
                ),
              ],
      );
    });
  }
}

void cusTomLogoutDialog(
  BuildContext context, {
  isLoading = false,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return const CustomAlertDialoge();
    },
  );
}
