import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/manager/app_management_cubit.dart/app_management_cubit.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/settings_widgets/custom_language_radio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

customLangBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    useSafeArea: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomLanguageRadio(
              groupValue: SettingsService.getLanguage(key: kLanguage),
              onChanged: (value) {
                AppManagementCubit.get(context).changeLanguage(value!);
                GoRouter.of(context).pop(); 
              },
            ),
          ],
        ),
      );
    },
  );
}
