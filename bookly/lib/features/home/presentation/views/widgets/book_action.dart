import 'package:bookly/core/utils/launche_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  final BookModel bookModel;
  const BookAction({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 35),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            textColor: Colors.black,
            text: 'Free',
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchURL(context, bookModel.volumeInfo.previewLink);
            },
            fontSize: 16,
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
            textColor: Colors.white,
            text: getText(bookModel),
          ))
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null || bookModel.volumeInfo.previewLink!.isEmpty) {
      return 'Preview Not Available';
    }
    return 'Preview';
  }
}
