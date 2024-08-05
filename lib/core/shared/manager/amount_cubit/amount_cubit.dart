import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/manager/amount_cubit/amount_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountCubit extends Cubit<AmountStates> {
  AmountCubit() : super(AmountInitialState());

  static AmountCubit get(context) => BlocProvider.of(context);

  int amount = 1;
// for cart screen
  void addCartAmount({required int productId}) {
    if (kAmountMap[productId]! < 10) {
      kAmountMap[productId] = kAmountMap[productId]! + 1;
      emit(AddAmountState());
    }
  }

  void removeCartAmount({required int productId}) {
    if (kAmountMap[productId]! > 1) {
      kAmountMap[productId] = kAmountMap[productId]! - 1;
      emit(RemoveAmountState());
    }
  }

// for details screen
  void addAmount() {
    if (amount < 10) {
      amount++;
      emit(AddAmountState());
    }
  }

  void removeAmount() {
    if (amount > 1) {
      amount--;
      emit(RemoveAmountState());
    }
  }
}
