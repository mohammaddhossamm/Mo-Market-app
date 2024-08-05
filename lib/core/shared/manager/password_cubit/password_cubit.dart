import 'package:e_commerce_app/core/shared/manager/password_cubit/password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<PasswordStates> {
  bool isVisible = true;
  PasswordCubit() : super(InItPasswordState());
  static PasswordCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isVisible = !isVisible;

    emit(PasswordVisibilityState());
  }
}
