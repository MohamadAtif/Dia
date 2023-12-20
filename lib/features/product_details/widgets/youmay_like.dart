import 'package:diamart_commerce/features/account/widgets/single_product.dart';
import 'package:diamart_commerce/features/home/services/home_services.dart';
import 'package:diamart_commerce/features/product_details/screens/product_details_screen.dart';
import 'package:diamart_commerce/models/product.dart';
import 'package:flutter/material.dart';

class YouMayAlsoLike extends StatefulWidget {
  const YouMayAlsoLike({super.key, required this.product});
  final Product? product;
  @override
  State<YouMayAlsoLike> createState() => _YouMayAlsoLikeState();
}

class _YouMayAlsoLikeState extends State<YouMayAlsoLike> {
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
      category: widget.product!.category,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: 9,
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
                  height: 140,
                  child: SingleProduct(
                    image: productData.images[0],
                    name: productData.name,
                    price: productData.price,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        productData.name,
                        style:
                            const TextStyle(fontFamily: 'Kanit', fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
