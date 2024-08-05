import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomLanguageRadio extends StatelessWidget {
  const CustomLanguageRadio({
    super.key,
    this.onChanged,
    required this.groupValue,
  });
  final void Function(String?)? onChanged;
  final String groupValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         AppLocalizations.of(context)!.chooseLanguageBS,
          style: Styles.textStyleNormal14,
        ),
        RadioListTile(
          title: const Text('English', style: TextStyle(fontSize: 12)),
          value: 'en',
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
        RadioListTile(
          title: const Text('العربية', style: TextStyle(fontSize: 12)),
          value: 'ar',
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
      ],
    );
  }
}
