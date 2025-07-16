import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/error_widget.dart';
import 'package:bookly/core/widgets/my_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListViewItemBuilder extends StatelessWidget {
  const ListViewItemBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.height * 0.23;
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return SizedBox(
              height: mediaQuery,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        height: mediaQuery,
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: state.books[index]);
                          },
                          child: CustomBookImage(
                            imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? " ",
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else if (state is FeaturedBooksFailure) {
            return MyErrorWidget(
              message: state.errorMessage,
            );
          } else {
            return SizedBox(height: mediaQuery, child: MyLoadingIndicator());
          }
        },
      ),
    );
  }
}
