import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/logout_cubit/logout_states.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/custom_logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutStates>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          if (state.status == true) {
            customSussessSnackBar(
              context,
              text: state.message,
            );
            GoRouter.of(context).go(AppRoutes.signIn);
          } else {
            customWorningSnackBar(
              context,
              text: state.message,
            );
          }
        }
        if (state is LogoutErrorState) {
          customErrorSnackBar(
            context,
            text: state.error,
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            textButton: AppLocalizations.of(context)!.logout,
            onPressed: () {
              cusTomLogoutDialog(context);
            },
            buttonWidth: MediaQuery.of(context).size.width / 3,
          ),
        ],
      ),
    );
  }
}
