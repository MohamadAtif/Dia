import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:diamart_commerce/features/home/services/home_services.dart';
import 'package:diamart_commerce/features/product_details/services/product_details_services.dart';
import 'package:diamart_commerce/models/product.dart';
import 'package:diamart_commerce/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class RattingBar extends StatefulWidget {
  final Product product;
  const RattingBar({super.key, required this.product});

  @override
  State<RattingBar> createState() => _RattingBarState();
}

class _RattingBarState extends State<RattingBar> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;
  bool isLoading = false;
  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();

    calculateRating();
  }

  void calculateRating() {
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;

      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: myRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 30,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
      itemBuilder: (context, _) => const Icon(
        Icons.star_border_outlined,
        color: GlobalVariables.secondaryColor,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          productDetailsServices.rateProduct(
            context: context,
            product: widget.product,
            rating: rating,
          );
        });
      },
    );
  }
}
