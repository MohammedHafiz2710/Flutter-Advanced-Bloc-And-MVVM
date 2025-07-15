import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
            SliverToBoxAdapter(child: CustomSearchTextField()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Search Results",
                  style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                ),
              ),
            ),
            SearchResultListView(),
          ]),
        ));
  }
}
