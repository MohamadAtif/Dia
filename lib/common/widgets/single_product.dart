import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;

  final String? name;
  final double? price;
  const SingleProduct({
    Key? key,
    required this.image,
    this.name,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // height: 220,

        Column(
      children: [
        CachedNetworkImage(
          height: 130,
          width: 120,
          imageUrl: image,
          // s
        ),
        Text(
          ' ${name.toString()}',
          style: const TextStyle(fontFamily: 'Kanit', fontSize: 16),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          "${price.toString()} EGP",
          style: const TextStyle(
              color: Colors.red, fontFamily: 'Kanit', fontSize: 14),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
