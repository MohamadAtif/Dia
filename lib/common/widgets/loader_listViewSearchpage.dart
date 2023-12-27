import 'package:diamart_commerce/common/widgets/item_shimmerSearchLoader.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaderListViewSearchPage extends StatelessWidget {
  const LoaderListViewSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.white,
            child: const ItemLoaderSearchPage()),
      ),
    );
  }
}
