import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_tff.dart';
import 'package:e_commerce_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchSection extends StatelessWidget {
  const CustomSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        var searchCubit = SearchCubit.get(context);
        return Form(
          key: searchKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
              AppLocalizations.of(context)!.search,
                style: Styles.textStyleBold14,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: searchCubit.searchController,
                hintText:   AppLocalizations.of(context)!.searchHint,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.searchValidate;
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    if (searchKey.currentState!.validate()) {
                      searchCubit
                          .getSearchData(searchCubit.searchController.text);
                    }
                  },
                ),
                onFieldSubmitted: (value) {
                  if (searchKey.currentState!.validate()) {
                    searchCubit.getSearchData(value);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
