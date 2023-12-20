import 'package:cached_network_image/cached_network_image.dart';
import 'package:diamart_commerce/common/widgets/loader_gridview.dart';
import 'package:diamart_commerce/features/account/widgets/single_product.dart';
import 'package:diamart_commerce/features/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
import '../services/home_services.dart';

class CategoryDealsScreen extends StatefulWidget {
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: productList == null
          ? const LoaderGridView()
          : productList!.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Icon(Icons.no_sim, color: Colors.grey.shade400, size: 60),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "There are No Products Here",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            color: Colors.grey.shade400),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'See All for ${widget.category}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ])),
                    SliverFillRemaining(
                      child: GridView.builder(
                        itemCount: productList!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          final productData = productList![index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                product: productData,
                                              )));
                                },
                                child: SizedBox(
                                  child: SingleProduct(
                                    name: productData.name,
                                    price: productData.price,
                                    image: productData.images[0],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
      // CustomScrollView(
      //     slivers: [
      //       SliverFillRemaining(
      //

      //             SizedBox(
      //               // height: 170,
      //               child:
      // GridView.builder(
      //                 shrinkWrap: true,
      //                 // scrollDirection: Axis.vertical,
      //                 padding: const EdgeInsets.only(left: 1),
      //                 itemCount: productList!.length,
      //                 gridDelegate:
      //                     const SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   // childAspectRatio: 1.4,
      //                   // mainAxisSpacing: 10,
      //                 ),
      //                 itemBuilder: (context, index) {
      //                   final product = productList![index];
      //                   return GestureDetector(

      //                     child: Column(
      //                       children: [
      //                         SizedBox(
      //                           height: 150,
      //                           child: DecoratedBox(
      //                             decoration: BoxDecoration(
      //                               border: Border.all(
      //                                 color: Colors.black12,
      //                                 width: 0.5,
      //                               ),
      //                             ),
      //                             child: Padding(
      //                               padding: const EdgeInsets.all(10),
      //                               child: CachedNetworkImage(
      //                                 imageUrl: product.images[0],
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Container(
      //                           alignment: Alignment.topLeft,
      //                           padding: const EdgeInsets.only(
      //                             left: 5,
      //                             top: 5,
      //                             right: 15,
      //                           ),
      //                           child: Text(
      //                             product.name,
      //                             style: const TextStyle(
      //                                 fontFamily: 'Kanit',
      //                                 fontWeight: FontWeight.bold),
      //                             maxLines: 1,
      //                             overflow: TextOverflow.ellipsis,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
    );
  }
}
