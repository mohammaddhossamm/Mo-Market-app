import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:e_commerce_app/core/shared/widgets/loading.dart';
import 'package:e_commerce_app/features/settings/data/model/profile_var_model/profile_var_model.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/profile_cubit/profile_states.dart';
import 'package:e_commerce_app/features/settings/presentation/view/custom_divider.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/chage_password_widget.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/custom_profile_error.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/logout.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/profile_list_item.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
      if (state is UpdataProfileSuccessState) {
        if (state.state) {
          customSussessSnackBar(context, text: state.message);
        } else {
          customErrorSnackBar(context, text: state.message);
        }
      }
    }, builder: (context, state) {
      var profileCubit = ProfileCubit.get(context);
      switch (state) {
        case GetProfileErrorState():
          return CustomProfileError(
            lottie: state.lottie,
            errorMessage: state.error,
          );
        case UpdataProfileErrorState():
          return CustomProfileError(
            lottie: state.lottie,
            errorMessage: state.error,
          );
        case GetProfileSuccessState():
          return Column(
            children: [
              const WelcomeWidget(),
              ProfileListItem(
                  model: ProfileVarModel(
                    title: AppLocalizations.of(context)!.name,
                    icon: Icons.person,
                    content: profileCubit.profileModel.data?.name ?? '',
                    controller: profileCubit.nameController =
                        TextEditingController(
                            text: profileCubit.profileModel.data?.name ?? ''),
                  ),
                  onTapOk: () {
                    profileCubit
                        .updataProfileData(
                          name: profileCubit.nameController.text,
                          email: profileCubit.profileModel.data?.email ?? '',
                          phone: profileCubit.profileModel.data?.phone ?? '',
                        )
                        .then((value) => GoRouter.of(context).pop());
                  }),
              customDivider(),
              ProfileListItem(
                model: ProfileVarModel(
                    title: AppLocalizations.of(context)!.phone,
                    icon: Icons.phone,
                    content: profileCubit.profileModel.data?.phone ?? '',
                    controller: profileCubit.phoneController =
                        TextEditingController(
                            text: profileCubit.profileModel.data?.phone ?? ''),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.length != 11) {
                        return AppLocalizations.of(context)!.invalidPhone;
                      }
                      return null;
                    }),
                onTapOk: () {
                  if (kProfileKey.currentState!.validate()) {
                    profileCubit
                        .updataProfileData(
                          name: profileCubit.profileModel.data?.name ?? '',
                          email: profileCubit.profileModel.data?.email ?? '',
                          phone: profileCubit.phoneController.text,
                        )
                        .then((value) => GoRouter.of(context).pop());
                  }
                },
              ),
              customDivider(),
              ProfileListItem(
                  model: ProfileVarModel(
                    title: AppLocalizations.of(context)!.email,
                    icon: Icons.person,
                    content: profileCubit.profileModel.data?.email ?? '',
                    controller: profileCubit.emailController =
                        TextEditingController(
                            text: profileCubit.profileModel.data?.email ?? ''),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  onTapOk: () {
                    profileCubit
                        .updataProfileData(
                          name: profileCubit.profileModel.data?.name ?? '',
                          email: profileCubit.emailController.text,
                          phone: profileCubit.profileModel.data?.phone ?? '',
                        )
                        .then((value) => GoRouter.of(context).pop());
                  }),
              customDivider(),
              const ChagePasswordWidget(),
              const SizedBox(
                height: 60,
              ),
              const Logout(),
              const SizedBox(
                height: 40,
              ),
            ],
          );
        default:
          return const Loading();
      }
    });
  }
}
