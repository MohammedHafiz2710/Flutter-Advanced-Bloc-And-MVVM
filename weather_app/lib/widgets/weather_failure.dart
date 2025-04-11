import 'package:flutter/material.dart';

class WeatherFailureBody extends StatelessWidget {
  const WeatherFailureBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "😔",
              style: TextStyle(fontSize: 120),
            ),
            Text("there was an error", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
