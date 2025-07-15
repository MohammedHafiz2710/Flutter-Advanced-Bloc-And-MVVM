import 'package:cached_network_image/cached_network_image.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl ??
              "https://template.canva.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg",
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: 24,
          ),
        ),
      ),
    );
  }
}
