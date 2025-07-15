import 'package:bookly/core/utils/error_widget.dart';
import 'package:bookly/core/widgets/my_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerItemListView extends StatelessWidget {
  const BestSellerItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      sliver: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
          if (state is NewestBooksSuccess) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BestSellerItem(book: state.books[index]),
                );
              },
              childCount: state.books.length,
            ));
          } else if (state is NewestBooksFailure) {
            return SliverToBoxAdapter(
              child: MyErrorWidget(
                message: state.errorMessage,
              ),
            );
          } else {
            return SliverFillRemaining(
              child: MyLoadingIndicator(),
            );
          }
        },
      ),
    );
  }
}
