import 'package:e_commerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/custom_search_section.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                text:AppLocalizations.of(context)!.search,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomSearchSection(),
               const SizedBox(
                height: 20,
              ),
              const SearchListView(),
            ],
          ),
        ),
      ),
    );
  }
}
