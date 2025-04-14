import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerItemListView extends StatelessWidget {
  const BestSellerItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: const BestSellerItem(),
          );
        },
        childCount: 10,
      )),
    );
  }
}
