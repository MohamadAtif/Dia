import 'package:flutter/material.dart';

class ButtonGoShoppingSearchPage extends StatelessWidget {
  const ButtonGoShoppingSearchPage({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2),
        child: Container(
          height: 47,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.grey.shade300,
          ),
          child: const Center(
            child: Text(
              'GO SHOPPING',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit',
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
