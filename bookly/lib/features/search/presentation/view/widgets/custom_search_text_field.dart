import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context).fetchSearchBooks(searchQuery: value);
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          focusedBorder: borderBuilder(),
          border: borderBuilder(),
          enabledBorder: borderBuilder(),
          hintText: "Search",
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Opacity(
                opacity: 0.8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 22,
                ),
              ))),
    );
  }

  OutlineInputBorder borderBuilder() => OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(12));
}
