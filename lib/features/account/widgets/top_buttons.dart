import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:diamart_commerce/constants/utils.dart';
import 'package:flutter/material.dart';

import '../services/account_services.dart';
import 'account_button.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Log Out', onTap: () => onBackDialog(context)),
            // AccountButton(
            //   text: 'Turn Seller',
            //   onTap: () {},
            // ),
          ],
        ),
        // const SizedBox(height: 10),
        // Row(
        //   children: [

        //     AccountButton(
        //       text: 'Your Wish List',
        //       onTap: () {},
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
