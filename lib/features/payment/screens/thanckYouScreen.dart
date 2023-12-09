import 'package:diamart_commerce/features/payment/widgets/thankyoubody.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Container(
              alignment: Alignment.center,
              child: const Center(
                child: Text(
                  'Thank You',
                  style: TextStyle(
                      fontFamily: 'Kanit', fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
      body: const ThankYouBody(),
    );
  }
}
