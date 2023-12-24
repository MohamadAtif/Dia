import 'package:diamart_commerce/common/widgets/loader_listView.dart';
import 'package:diamart_commerce/common/widgets/single_product.dart';
import 'package:diamart_commerce/features/home/screens/allproducts_view.dart';
import 'package:diamart_commerce/features/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';
import '../services/home_services.dart';

class AllProductsListView extends StatefulWidget {
  const AllProductsListView({super.key});

  @override
  State<AllProductsListView> createState() => _AllProductsListViewState();
}

class _AllProductsListViewState extends State<AllProductsListView> {
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
    return productList == null
        ? const LoaderListView()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'RECENTLY ADDED',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade800,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AllProductsView()));
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Kanit',
                            color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 178,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: productList!.length,
                  itemExtent: 140,
                  scrollDirection: Axis.horizontal,
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
                            // height: 230,
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
              ),
            ],
          );
  }
}
