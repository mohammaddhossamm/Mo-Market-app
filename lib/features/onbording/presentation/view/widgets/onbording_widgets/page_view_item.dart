import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/body_onbording.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/image_onbording.dart';
import 'package:e_commerce_app/features/onbording/data/models/onbording_model/onboarding_model.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem( {super.key, required this.model});

  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
         ImageOnbording(
          image: model.image,
        ),
         BodyOnbording(title: model.title,body: model.body,),
      ],
    );
  }
}