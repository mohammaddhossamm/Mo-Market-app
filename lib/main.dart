import 'package:e_commerce_app/core/shared/manager/app_management_cubit.dart/app_management_cubit.dart';
import 'package:e_commerce_app/core/shared/manager/app_management_cubit.dart/app_management_states.dart';
import 'package:e_commerce_app/core/shared/bloc_observer.dart';
import 'package:e_commerce_app/core/shared/manager/password_cubit/password_cubit.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/shared/widgets/status_bar.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/service_locator.dart';
import 'package:e_commerce_app/features/cart/data/repo/cart_repo_implementation.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/settings/data/repo/logout_repo/logout_repo_implemetation.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_commerce_app/features/wishlist/data/repo/wishlist_repo/wishlist_repo_implementation.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) async {
      Bloc.observer = MyBlocObserver();
      await SettingsService.init();
      setupServiceLocator();
      runApp(
        const MyApp(),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppManagementCubit()),
        BlocProvider(
            create: (context) => WishlistCubit(
                  getIt.get<WishlistRepoImplementation>(),
                )),
        BlocProvider(
          create: (context) => CartCubit(getIt.get<CartRepoImplementation>()),
        ),
        BlocProvider(
          create: (context) =>
              LogoutCubit(getIt.get<LogoutRepoImplemetation>()),
        ),
        BlocProvider(
          create: (context) => PasswordCubit(),
        ),
      ],
      child: BlocBuilder<AppManagementCubit, AppManagementStates>(
        builder: (context, state) {
          customStatusBar();
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Mo Market',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(AppManagementCubit.get(context).language, ''),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
            ),
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
