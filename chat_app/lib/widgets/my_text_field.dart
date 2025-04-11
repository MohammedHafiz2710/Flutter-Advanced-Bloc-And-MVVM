import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  Function(String)? onChanged;
  MyTextFormField({
    super.key,
    required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your $label";
        }
        return null;
      },
      onChanged: onChanged,
      obscureText: label == "Password",
      style: TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: Colors.white)),
        hintText: "Enter your $label",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
