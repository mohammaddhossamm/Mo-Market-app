import 'package:e_commerce_app/features/search/data/repo/search_repo.dart';
import 'package:e_commerce_app/features/search/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo searchRepo;
  var searchController= TextEditingController();
  SearchCubit(this.searchRepo) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  Future<void> getSearchData(String text) async {
    emit(SearchLoading());
    var result = await searchRepo.getSearchData(text);
    result.fold(
      (failure) {
        emit(SearchError(error: failure.errorMessage, lottie: failure.lottie));
      },
      (model) {
        emit(SearchSuccess(model));
        
      },
    );
  }
}
