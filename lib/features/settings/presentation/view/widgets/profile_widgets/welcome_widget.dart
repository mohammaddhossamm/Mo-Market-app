import 'package:e_commerce_app/core/shared/widgets/mix_colored_text.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
     var profileCubit = ProfileCubit.get(context);
    return Column(
      children: [
          MixColoredText(
                colorestext: profileCubit.profileModel.data?.name ?? '',
                text2: '',
                text1:  AppLocalizations.of(context)!.welcome,
                style: Styles.textStyleBold16,
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
               AppLocalizations.of(context)!.profileDes,
                style: Styles.textStyleNormal12,
              ),
              const SizedBox(
                height: 30,
              ), 
      ],
    );
  }
}
