import 'package:e_commerce_app/core/utls/service_locator.dart';
import 'package:e_commerce_app/features/auth/data/repo/singin_repo/singin_repo_implementation.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signin_Cubit/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/signin_widgets/signin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SignInCubit(getIt.get<SignInRepoImplementation>()),
      child: const Scaffold(
      body: SignInViewBody(),
    ),
    );
  }
}