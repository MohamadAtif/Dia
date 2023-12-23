import 'package:flutter/material.dart';

class EmptySearchedPage extends StatelessWidget {
  final String searchQuery;
  const EmptySearchedPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          Icon(Icons.no_cell, color: Colors.grey.shade400, size: 60),
          const SizedBox(
            height: 30,
          ),
          Text(
            " Sorry, we could'nt find any results for \n\t\t\t\t\t\t\t\t     #${searchQuery.toString()} \n           Try Adjusting Your Search",
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
