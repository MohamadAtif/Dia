import 'package:diamart_commerce/features/orders/widgets/orders_sub_details.dart';
import 'package:flutter/material.dart';

class OrdersViewUser extends StatefulWidget {
  const OrdersViewUser({super.key});

  @override
  State<OrdersViewUser> createState() => _OrdersViewUserState();
}

class _OrdersViewUserState extends State<OrdersViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          // leading: Icons.arrow_back_ios_new_outlined,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: const Center(
                    child:
                        //      Image.asset(
                        //   'assets/images/twitter.png',
                        //   height: 30,
                        // )
                        Text(
                      'ORDERS',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 25),
                    ),
                  )),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Row(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(right: 15),
                    //   child: Icon(Icons.notifications_outlined),
                    // ),
                    // Icon(
                    //   Icons.search,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const OrdersSubDetails(),
    );
  }
}
