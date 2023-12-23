import 'package:diamart_commerce/common/widgets/loader_gridview.dart';
import 'package:diamart_commerce/features/account/widgets/single_product.dart';
import 'package:diamart_commerce/features/home/widgets/empty_categoryproductsScreen.dart';
import 'package:diamart_commerce/features/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
import '../services/home_services.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String category;
  const CategoryProductsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
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
            'See All for ${widget.category}'.toUpperCase(),
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Kanit',
                fontSize: 19,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: productList == null
          ? const LoaderGridView()
          : productList!.isEmpty
              ? const EmptyCategoryProductsScreen()
              : CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                        child: Column(children: [
                      SizedBox(
                        height: 15,
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
    );
  }
}
