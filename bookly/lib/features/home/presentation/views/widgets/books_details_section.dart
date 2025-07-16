import 'dart:math';

import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.19),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.smallThumbnail ?? " ",
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
        ),
        SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? "Unknown Author",
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? double.parse((Random().nextDouble() * 5).toStringAsFixed(1)),
          ratingsCount: bookModel.volumeInfo.ratingsCount ?? Random().nextInt(2500) + 1000,
        ),
        BookAction(),
      ],
    );
  }
}
