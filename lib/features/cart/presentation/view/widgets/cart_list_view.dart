import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_error_widget.dart';
import 'package:e_commerce_app/core/shared/widgets/empty_screen.dart';
import 'package:e_commerce_app/core/shared/widgets/loading.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_states.dart';
import 'package:e_commerce_app/features/cart/presentation/view/widgets/cart_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
      builder: (context, state) { 
        switch (state) { 
          case ChangeInCartErrorState():
            return CustomErrorWidget(errorMessage: state.error, lottie: state.lottie,);
          case CartErrorState():
             return CustomErrorWidget(errorMessage: state.error, lottie: state.lottie,);
          case CartSuccessState():
           return kCartModel!.data!.cartsItem!.isNotEmpty?
          ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>  CartListViewItem(index: index,model: kCartModel,),
                separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Divider( 
            color: AppColors.grayColor,
            height: 1,
          ),
                ),
                itemCount: kCartModel!.data!.cartsItem!.length,
              ) 
              : EmptyScreen(
              image: AssetsData.emptyCart,
              text: AppLocalizations.of(context)!.emptyCart,
            );
          default:
            return const Loading();
        }
      },
    );
  }
}