import 'package:e_commerce_app/core/utls/service_locator.dart';
import 'package:e_commerce_app/features/home/data/models/details_model/details_model.dart';
import 'package:e_commerce_app/features/home/presentation/view/details_view.dart';
import 'package:e_commerce_app/features/layout/presentation/view/layout_view.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/get_start_view.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/onbording_view.dart';
import 'package:e_commerce_app/features/auth/presentation/view/signin_view.dart';
import 'package:e_commerce_app/features/auth/presentation/view/signup_view.dart';
import 'package:e_commerce_app/features/search/presentation/view/search_view.dart';
import 'package:e_commerce_app/features/settings/data/repo/profile_repo/profile_repo_implementation.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/view/profile_view.dart';
import 'package:e_commerce_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String onBoardingView = '/onboardingView';
  static const String getStartView = '/getStartView';
  static const String layoutView = '/layoutView';
  static const String signIn = '/signInView';
  static const String signUp = '/signUpView';
  static const String detailsView = '/detailsView';
  static const String profileView = '/profileView';
  static const String searchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: getStartView,
        builder: (context, state) => const GetStartView(),
      ),
       GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: onBoardingView,
        builder: (context, state) => const OnbordingView(),
      ),
      GoRoute(
        path: layoutView,
        builder: (context, state) => const LayoutView(),
      ),
      GoRoute(
        path: signIn,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: detailsView,
        builder: (context, state) {
          final extra = state.extra as DetailsModel;
          return DetailsView(
            detailsModel: extra,
          );
        },
      ),
      GoRoute(
        path: profileView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ProfileCubit(
              getIt.get<ProfileRepoImplementation>(),
            )..getProfile(),
            child: const ProfileView(),
          );
        },
      ),
    ],
  );
}
