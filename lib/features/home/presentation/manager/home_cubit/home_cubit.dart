import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    if (kHomeModel != null) {
      emit(HomeSuccessState());
    } else {
      emit(HomeLoadingState());
      var data = await homeRepo.getHomeData();
      data.fold((failure) {
        emit(HomeErrorState(
            error: failure.errorMessage, lattieError: failure.lottie));
      }, (model) {
        kHomeModel = model;
        for (var element in model.data!.products!) {
          kWishListMap.addAll({element.id!: element.inFavorites!});
          kCartMap.addAll({element.id!: element.inCart!});
          kAmountMap.addAll({element.id!: 1});
        }
        emit(HomeSuccessState());
      });
    }
  }
}
