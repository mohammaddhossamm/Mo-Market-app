import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/features/settings/data/model/profile_var_model/profile_var_model.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChagePasswordWidget extends StatelessWidget {
  const ChagePasswordWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var profileCubit = ProfileCubit.get(context);

    return ProfileListItem(
      model: ProfileVarModel(
        title: AppLocalizations.of(context)!.password,
        icon: Icons.person,
        content: '**********',
        controller: profileCubit.passwordController,
        hintText: AppLocalizations.of(context)!.passwordHint,
        keyboardType: TextInputType.visiblePassword,
        validator: (value){
          if(value!.isEmpty){
            return AppLocalizations.of(context)!.emptyPassword;
          }
          if(value.length<8){
            return AppLocalizations.of(context)!.shortPassword;
          }
          return null;
        }
      ),
      suffixIcon: true,
      onTapOk: () {
        if(kProfileKey.currentState!.validate()){
profileCubit
            .updataProfilePassword(
          name: profileCubit.profileModel.data?.name ?? '',
          email: profileCubit.profileModel.data?.email ?? '',
          phone: profileCubit.profileModel.data?.phone ?? '',
          password: profileCubit.passwordController.text,
        )
            .then(
          (value) {
            profileCubit.passwordController = TextEditingController();
            GoRouter.of(context).pop();
          },
        );
        }
        
      },
    );
  }
}
