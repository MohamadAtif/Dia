import 'package:diamart_commerce/common/widgets/shimmer_Loader.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaderListView extends StatelessWidget {
  const LoaderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
              height: 30,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 13,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.white,
                child: const ItemLoaderHomePage()),
          ),
        ),
      ],
    );
  }
}

class ItemLoaderHomePage extends StatelessWidget {
  const ItemLoaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 137,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 13,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
