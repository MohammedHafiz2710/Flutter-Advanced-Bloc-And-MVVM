import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Search City',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: TextField(
              onSubmitted: (value) {
                BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  label: Text(
                    "Search",
                  ),
                  suffixIcon: Icon(Icons.search),
                  hintText: "Enter City Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
        ));
  }
}
