import 'package:e_commerce_app/core/shared/widgets/empty_screen.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/custom_search_error.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/search_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        switch (state) {
          case SearchError():
            return CustomSearchError(
              lottie: state.lottie,
              errorMessage: state.error,
            );
          case SearchSuccess():
            if (state.searchList[0].data!.data!.isEmpty) {
              return  EmptyScreen(
                image: AssetsData.emptySearch,
                text: AppLocalizations.of(context)!.emptySearch,
              );
            } else {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var data = state.searchList[0].data?.data?[index];

                  return SearchListViewItem(
                    imageUrl: data?.image ?? '',
                    price: data?.price ?? 00,
                    productDescription:
                        data?.description ?? AppLocalizations.of(context)!.emptyProduct,
                    productName: data?.name ?? AppLocalizations.of(context)!.product,
                    imagesList: data?.imagesList ?? [],
                    productId: data!.id!,
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Divider(
                    color: AppColors.grayColor,
                  ),
                ),
                itemCount: state.searchList[0].data?.data?.length ?? 0,
              );
            }

          case SearchLoading():
            return const LinearProgressIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.lightWhite,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
