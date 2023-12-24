import 'package:diamart_commerce/common/widgets/single_product.dart';
import 'package:diamart_commerce/features/product_details/screens/product_details_screen.dart';
import 'package:diamart_commerce/models/product.dart';
import 'package:flutter/material.dart';

class YouMAyAlsoLike extends StatelessWidget {
  const YouMAyAlsoLike({
    super.key,
    required this.productList,
  });

  final List<Product>? productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 259,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productList!.length,
        itemExtent: 160,
        itemBuilder: (context, index) {
          final productData = productList![index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                                product: productData,
                              )));
                },
                child: SizedBox(
                  // height: 200,
                  child: SingleProduct(
                    image: productData.images[0],
                    name: productData.name,
                    price: productData.price,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Expanded(
              //         child: Column(
              //           children: [
              //             Text(
              //               productData.name,
              //               style: const TextStyle(
              //                   fontFamily: 'Kanit', fontSize: 16),
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //             Text(
              //               productData.price.toInt().toString(),
              //               style: const TextStyle(
              //                   color: Colors.red,
              //                   fontFamily: 'Kanit',
              //                   fontSize: 16),
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
