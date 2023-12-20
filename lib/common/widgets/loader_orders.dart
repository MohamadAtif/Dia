import 'package:diamart_commerce/common/widgets/shimmer_Loader.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaderOrdersListView extends StatelessWidget {
  const LoaderOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 350,
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: const ItemLoaderOrder()),
      ),
    );
  }
}

class ItemLoaderOrder extends StatelessWidget {
  const ItemLoaderOrder({super.key});

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
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
