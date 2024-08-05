import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/manager/app_management_cubit.dart/app_management_cubit.dart';
import 'package:e_commerce_app/core/shared/manager/app_management_cubit.dart/app_management_states.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/features/settings/presentation/view/custom_divider.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/settings_widgets/custom_language_radio.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/settings_widgets/settings_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsData extends StatelessWidget {
  const SettingsData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagementCubit, AppManagementStates>(
      builder: (context, state) {
        return Column(
      children: [
         SettingsDataItem(
          icon: Icons.person,
          text: AppLocalizations.of(context)!.profile,
          onTap: (){
            GoRouter.of(context).push(AppRoutes.profileView);
          },
         ),
         customDivider(),
         CustomLanguageRadio(
          groupValue:AppManagementCubit.get(context).language,
          onChanged: (value) {
            AppManagementCubit.get(context).changeLanguage(value!);
            kHomeModel=null;
            kWishListModel=null;
            kCartModel=null;
          },
         ),
         customDivider(),
           SettingsDataItem(
            icon: Icons.info_outline_rounded,
            text: AppLocalizations.of(context)!.aboutUs,

          ),
      ],
    );
      },
    );
  }
}

