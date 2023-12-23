import 'package:flutter/material.dart';

class EmptyCategoryProductsScreen extends StatelessWidget {
  const EmptyCategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Icon(Icons.no_sim, color: Colors.grey.shade400, size: 60),
          const SizedBox(
            height: 30,
          ),
          Text(
            "There are No Products Here",
            style: TextStyle(
                fontSize: 18, fontFamily: 'Kanit', color: Colors.grey.shade400),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
