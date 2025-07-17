import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementaion implements SearchRepo {
  final ApiService apiService;
  SearchRepoImplementaion(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String searchQuery}) async {
    try {
      var result = await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=$searchQuery");
      List<BookModel> books = [];
      for (var book in result["items"]) {
        books.add(BookModel.fromJson(book));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
