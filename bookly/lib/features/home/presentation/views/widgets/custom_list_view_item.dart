import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: AspectRatio(
        aspectRatio: 1.4 / 2,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.red, image: DecorationImage(image: AssetImage(AssetsData.jungleBook), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
