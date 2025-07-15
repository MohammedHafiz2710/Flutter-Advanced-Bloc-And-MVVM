import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';

import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    var result = await homeRepo.fetchNewsetBooks();
    result.fold(
      (failure) => emit(NewestBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
