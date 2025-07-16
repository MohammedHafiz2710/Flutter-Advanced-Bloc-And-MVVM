import 'dart:math';

import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';

import 'package:bookly/core/utils/styles.dart';

import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  final BookModel book;
  const BestSellerItem({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.3 / 2,
              child: CustomBookImage(
                imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? " ",
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Free", style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold)),
                      BookRating(
                        rating: book.volumeInfo.averageRating ?? double.parse((Random().nextDouble() * 5).toStringAsFixed(1)),
                        mainAxisAlignment: MainAxisAlignment.start,
                        ratingsCount: book.volumeInfo.ratingsCount ?? Random().nextInt(2500) + 1000,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
