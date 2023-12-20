import 'package:diamart_commerce/common/widgets/shimmer_Loader.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaderListView extends StatelessWidget {
  const LoaderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.white,
            child: const ItemLoader()),
      ),
    );
  }
}
