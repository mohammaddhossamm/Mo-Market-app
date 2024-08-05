import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    delayAndRoute();
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 20,
            child: Text(
             AppLocalizations.of(context)!.mo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppLocalizations.of(context)!.market,
            style: Styles.textStyleExtraBold18,
          ),
          const SizedBox(
            width: 3,
          ),
          const CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 3,
          ),
        ],
      ),
    );
  }

  void delayAndRoute() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then(
      (value) {
        if (SettingsService.isOnBordingFinished(key: kOnBording)) {
          if(SettingsService.getToken(key: kToken)!=null){
            GoRouter.of(context).go(AppRoutes.layoutView);
          }else{
            GoRouter.of(context).go(AppRoutes.signIn);
          }
        } else {
          GoRouter.of(context).go(AppRoutes.getStartView);
        }
      },
    );
  }
}
