import 'package:e_commerce_app/core/utls/service_locator.dart';
import 'package:e_commerce_app/features/search/data/repo/search_repo_implemetation.dart';
import 'package:e_commerce_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImplemetation>()),
      child:  const Scaffold(
      body: SearchViewBody(),
    ),
    );
    
  }
}