import 'package:bookly/core/utils/error_widget.dart';
import 'package:bookly/core/widgets/my_loading_indicator.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/view/widgets/find_book.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        minimum: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
            SliverToBoxAdapter(child: CustomSearchTextField()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
                if (state is SearchInitial) {
                  return FindBook();
                } else if (state is SearchSuccess) {
                  return SearchResultListView(bookModel: state.books);
                } else if (state is SearchFailure) {
                  return MyErrorWidget(message: state.errorMessage);
                } else {
                  return MyLoadingIndicator();
                }
              }),
            ),
          ]),
        ));
  }
}
