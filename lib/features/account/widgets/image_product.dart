import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final String image;
  const ImageProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade100,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
