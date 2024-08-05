import 'package:e_commerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/settings/presentation/view/widgets/profile_widgets/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(
                text: AppLocalizations.of(context)!.profile,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const ProfileList(),
            ],
          ),
        ),
      ),
    );
  }
}
