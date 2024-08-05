import 'package:e_commerce_app/features/onbording/data/models/onbording_model/onboarding_model.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<OnBoardingModel> onBoardingModel(BuildContext context){
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: AssetsData.cartOnbording,
    title: AppLocalizations.of(context)!.onBoardingTitle1,
    body:  AppLocalizations.of(context)!.onBoardingDescription1,
  ),
  OnBoardingModel(
    image: AssetsData.wishlistOnbording,
    title: AppLocalizations.of(context)!.onBoardingTitle2,
    body:  AppLocalizations.of(context)!.onBoardingDescription2,
  ),
  OnBoardingModel(
    image: AssetsData.buyOnbording,
    title:  AppLocalizations.of(context)!.onBoardingTitle3,
    body:  AppLocalizations.of(context)!.onBoardingDescription3,
  ),
];

return onBoardingList;
}

 