import 'package:diamart_commerce/common/widgets/search_container.dart';
import 'package:diamart_commerce/constants/utils.dart';

import 'package:diamart_commerce/features/address/screens/address_screen.dart';
import 'package:diamart_commerce/features/cart/widgets/empty_cart_body.dart';

import 'package:diamart_commerce/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';
import '../../home/widgets/address_box.dart';
import '../widgets/cart_product.dart';
import '../widgets/cart_subtotal.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchScreen(
                  searchQuery: query,
                )));
  }

  void navigateToAddress(int sum) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddressScreen(totalAmount: sum.toString())));
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    print(sum);
    final cartQuantity =
        user.cart.map((e) => e['product']['quantity'] as int).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SearchContainer()],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              const AddressBox(),
              const SizedBox(height: 5),
              const CartSubtotal(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: 'CHECKOUT (${user.cart.length} items)',
                  onTap: () => user.cart.isEmpty
                      ? showSnackBar(context, 'Add Items First!')
                      : navigateToAddress(sum),
                  color: GlobalVariables.myTealColor,
                ),
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  Container(
                    color: Colors.black12.withOpacity(0.08),
                    height: 1,
                  ),
                ],
              ),
            ]),
          ),
          SliverFillRemaining(
            child: user.cart.isEmpty
                ? const EmptyCartBody()
                : ListView.builder(
                    itemCount: user.cart.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CartProduct(
                        index: index,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
