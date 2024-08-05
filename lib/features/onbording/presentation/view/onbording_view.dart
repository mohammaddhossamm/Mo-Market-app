import 'package:e_commerce_app/features/onbording/presentation/manager/onbording_cubit/onbording_cubit.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBordingCubit(),
      child:  const Scaffold(
      body: OnboardingViewBody(),
    ),
    );
  }
}