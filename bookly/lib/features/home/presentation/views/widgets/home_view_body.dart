import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/list_view_item_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          ListViewItemBuilder(),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Best Seller",
            style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
          ),
          SizedBox(
            height: 125,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1.3 / 2,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.red, image: DecorationImage(image: AssetImage(AssetsData.jungleBook), fit: BoxFit.fill)),
                  ),
                ),
                Column(
                  children: [],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
