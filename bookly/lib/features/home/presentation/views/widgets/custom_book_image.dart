import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String? imageUrl;
  const CustomBookImage({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.3 / 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(imageUrl ?? "https://template.canva.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg")),
          ),
        ));
  }
}
