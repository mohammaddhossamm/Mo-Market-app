import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/features/cart/data/repo/cart_repo.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitialState());
  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> getCartList() async {
    emit(CartLoadingState());
    var data = await cartRepo.getCartList();
    data.fold(
      (failure) {
        emit(CartErrorState(
          error: failure.errorMessage,
          lottie: failure.lottie,
        ));
      },
      (model) {
        kCartModel = model;
        emit(CartSuccessState());
      },
    );
  }
  Future<void> changeCart({required int productId}) async {
    kCartMap[productId] = !kCartMap[productId]!;
    emit(ChangeInCartState());
    var data = await cartRepo.changeCart(productId: productId);
    data.fold(
      (failure) {
        kCartMap[productId] = !kCartMap[productId]!;
        emit(ChangeInCartErrorState(
          error: failure.errorMessage,
          lottie: failure.lottie,
        ));
      },
      (model) {
        if(model.status==false){
          kCartMap[productId] = !kCartMap[productId]!;
        }else{
          getCartList();
        }
        emit(ChangeInCartSuccessState());
      },
    );
  }
}
