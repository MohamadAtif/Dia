import 'package:cached_network_image/cached_network_image.dart';
import 'package:diamart_commerce/features/account/widgets/single_product.dart';
import 'package:diamart_commerce/features/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
import '../services/home_services.dart';

class AllProductsView extends StatefulWidget {
  const AllProductsView({
    Key? key,
  }) : super(key: key);

  @override
  State<AllProductsView> createState() => _AllProductsView();
}

class _AllProductsView extends State<AllProductsView> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchAllProductsRecentlyAdded(
      context: context,
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
          title: const Text(
            'All Products',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : CustomScrollView(
              slivers: [
                // SliverToBoxAdapter(
                //     child: Column(children: [
                //   Container(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 15, vertical: 10),
                //     alignment: Alignment.topLeft,
                //     child: const Text(
                //       'See All Products',
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontFamily: 'Kanit',
                //         fontSize: 20,
                //       ),
                //     ),
                //   ),
                // ])),
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
                                      builder: (context) => ProductDetailScreen(
                                            product: productData,
                                          )));
                            },
                            child: SizedBox(
                              // height: 140,
                              child: SingleProduct(
                                image: productData.images[0],
                                name: productData.name,
                                price: productData.price,
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
    );
  }
}
