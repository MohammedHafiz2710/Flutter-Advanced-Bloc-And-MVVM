import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final double rating;
  final int ratingsCount;
  final MainAxisAlignment mainAxisAlignment;
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.ratingsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      spacing: 6,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        Text(rating.toString(), style: Styles.textStyle16),
        Opacity(
          opacity: 0.5,
          child: Text(ratingsCount.toString(), style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
