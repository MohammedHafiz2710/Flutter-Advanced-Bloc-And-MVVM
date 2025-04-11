import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const MyButton({
    super.key,
    required this.label,this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
