import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ProfileViewBody(),
    );
  }
}