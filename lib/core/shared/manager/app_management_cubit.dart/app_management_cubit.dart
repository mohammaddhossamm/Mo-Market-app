import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/manager/app_management_cubit.dart/app_management_states.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppManagementCubit extends Cubit<AppManagementStates> {
  AppManagementCubit() : super(AppManagementInitialState());

  static AppManagementCubit get(context) => BlocProvider.of(context);
  String language = SettingsService.getLanguage(key: kLanguage);

  void changeLanguage(String lang) {
    language = lang;
    SettingsService.saveSettings(key: kLanguage, value: lang).then(
      (value) => emit(ChangeAppLanguageState()),
    );
  }
}
