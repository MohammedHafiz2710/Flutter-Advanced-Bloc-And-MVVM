import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String message;
  const MyErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
