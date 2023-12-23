import 'package:diamart_commerce/common/widgets/bottom_bar.dart';
import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:flutter/material.dart';

class EmptyCartBody extends StatelessWidget {
  const EmptyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 5),
          const SizedBox(
            height: 80,
          ),
          Icon(Icons.remove_shopping_cart,
              color: Colors.grey.shade400, size: 60),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Your Cart is Empty Yet',
            style: TextStyle(
                fontSize: 18, fontFamily: 'Kanit', color: Colors.grey.shade400),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomBar()),
                    (route) => false);
              },
              child: const Text('Go Shopping',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Kanit',
                      color: GlobalVariables.myTealColor)))
        ],
      ),
    );
  }
}
