import 'package:e_commerce_app/core/shared/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/get_start_widgets/custom_lang_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseLanguageWidget extends StatelessWidget {
  const ChooseLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
         AppLocalizations.of(context)!.chooseLanguage,
          style: Styles.textStyleNormal14,
        ),
        CustomTextButton(
          text:  AppLocalizations.of(context)!.fromHere,
          onPressed: () {
            customLangBottomSheet(
              context,
            );
          },
          underline: true,
        ),
      ],
    );
  }
}
