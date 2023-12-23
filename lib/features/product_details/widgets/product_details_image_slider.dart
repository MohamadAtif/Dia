import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diamart_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSlider extends StatelessWidget {
  const ProductDetailsImageSlider({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: product.images.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => CachedNetworkImage(
              imageUrl: i,
              fit: BoxFit.contain,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 290,
      ),
    );
  }
}
