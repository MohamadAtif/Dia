import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 40,
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient
          // LinearGradient(
          //   colors: [
          //     Color.fromARGB(255, 5, 58, 55),
          //     Color.fromARGB(255, 16, 90, 88),
          //   ],
          //   stops: [0.5, 1.0],
          // ),
          ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 20,
            color: Colors.teal.shade300,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Delivery to ${user.name} - ${user.address}',
                style: TextStyle(
                  color: Colors.teal.shade300,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 5,
              top: 2,
            ),
            // child: Icon(
            //   Icons.arrow_drop_down_outlined,
            //   size: 18,
            // ),
          )
        ],
      ),
    );
  }
}
