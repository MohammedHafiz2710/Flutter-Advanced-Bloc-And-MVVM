  import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message, style: TextStyle(color: Colors.white, fontSize: 16))));
  }