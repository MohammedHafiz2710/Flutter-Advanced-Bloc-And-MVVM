import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  final List<BookModel> bookModel;
  const SearchResultListView({
    super.key,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.77,
      child: ListView.builder(
          itemCount: bookModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: BestSellerItem(book: bookModel[index]),
            );
          }),
    );
  }
}
