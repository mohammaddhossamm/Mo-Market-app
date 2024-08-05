import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/features/settings/data/repo/logout_repo/logout_repo.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/logout_cubit/logout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  final LogoutRepo repo;

  LogoutCubit(this.repo) : super(LogoutInItState());

  static LogoutCubit get(context) => BlocProvider.of(context);

  Future<void> logout() async {
    emit(LogoutLoadingState());
    var data = await repo.logout();
    data.fold((failure) {
      emit(LogoutErrorState(error: failure.errorMessage,lottie: failure.lottie));
    }, (data)async {
      if(data.status!){
         await SettingsService.deleteData(key: kToken);
        emit(LogoutSuccessState(message: data.message!, status: data.status!));
      }else{
        emit(LogoutSuccessState(message: data.message!, status: data.status!));
      }
      
    });
  }
}
