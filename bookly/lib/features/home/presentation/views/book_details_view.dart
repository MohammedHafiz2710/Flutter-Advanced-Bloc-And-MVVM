import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar_details_book.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomAppBarDetailsBook(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.19),
              child: CustomBookImage(),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              "The Jungle Book",
              style: Styles.textStyle30,
            ),
            SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: 0.7,
              child: Text(
                "Rudyard Kipling",
                style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            BookAction()
          ],
        ),
      ),
    );
  }
}
