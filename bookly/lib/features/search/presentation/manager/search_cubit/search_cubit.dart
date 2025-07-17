import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());
  Future<void> fetchSearchBooks({required String searchQuery}) async {
    emit(SearchLoading());
    try {
      final result = await searchRepo.fetchSearchBooks(searchQuery: searchQuery);
      result.fold(
        (failure) => emit(SearchFailure(errorMessage: failure.errorMessage)),
        (books) => emit(SearchSuccess(books: books)),
      );
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
