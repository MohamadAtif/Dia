import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      // decoration: BoxDecoration(color: Colors.grey.shade100),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Kanit',
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: user.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Kanit',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
