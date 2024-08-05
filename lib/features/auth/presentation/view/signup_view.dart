import 'package:e_commerce_app/core/shared/widgets/custom_back_appbar.dart';
import 'package:e_commerce_app/core/utls/service_locator.dart';
import 'package:e_commerce_app/features/auth/data/repo/signup_repo/signup_repo_implementation.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/signup_widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<SignUpRepoImplementation>()),
      child:   Scaffold(
      appBar: customBackAppBar(context),
      body: const SignUpViewBody(),
    ),
    );
  }
}
