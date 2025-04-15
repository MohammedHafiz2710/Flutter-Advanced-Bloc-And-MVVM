import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarDetailsBook extends StatelessWidget {
  const CustomAppBarDetailsBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                size: 32,
              )),
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 32,
              )),
        ],
      ),
    );
  }
}
