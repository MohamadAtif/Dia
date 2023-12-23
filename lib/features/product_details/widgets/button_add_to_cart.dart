import 'package:diamart_commerce/common/widgets/showdialog.dart';
import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:diamart_commerce/features/home/services/home_services.dart';
import 'package:diamart_commerce/features/product_details/services/product_details_services.dart';
import 'package:diamart_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ButtonAddToCart extends StatefulWidget {
  final Product product;
  const ButtonAddToCart({super.key, required this.product});

  @override
  State<ButtonAddToCart> createState() => _ButtonAddToCartState();
}

class _ButtonAddToCartState extends State<ButtonAddToCart> {
  bool isLoading = false;

  List<Product>? productList;

  final HomeServices homeServices = HomeServices();
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  @override
  void initState() {
    super.initState();
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );

    alertDialogToast('Added To Cart Succefully');
  }

  @override
  Widget build(BuildContext context) {
    final productQuantity = widget.product.quantity;
    return ElevatedButton(
      onPressed: () async {
        if (productQuantity == 0) {
          alertDialogToast('This Product is Out of Stock');
        } else {
          setState(() {
            isLoading = true;
          });

          addToCart();
          await Future.delayed(const Duration(milliseconds: 1200));
          setState(() {
            isLoading = false;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: GlobalVariables.secondaryColor,
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              'Add to Cart'.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Kanit',
                fontSize: 15,
                color: Colors.white,
              ),
            ),
    );
  }
}
