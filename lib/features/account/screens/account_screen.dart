import 'package:diamart_commerce/constants/utils.dart';
import 'package:diamart_commerce/features/account/widgets/favouritespage.dart';
import 'package:diamart_commerce/features/account/widgets/profile_rows.dart';
import 'package:diamart_commerce/features/orders/screens/orders_view_user.dart';
import 'package:diamart_commerce/models/user.dart';
import 'package:diamart_commerce/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../widgets/below_app_bar.dart';
import '../../orders/widgets/orders.dart';
import '../widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          // leading: Icons.arrow_back_ios_new_outlined,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarPrivate),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Center(
                      child: Image.asset(
                    'assets/images/twitter.png',
                    height: 30,
                  )
                      //  Text(
                      //   'PROFILE',
                      //   style: TextStyle(
                      //       fontFamily: 'Kanit',
                      //       color: Colors.grey.shade100,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 25),
                      // ),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(children: [
            const Center(
              child: Text(
                'DIAMART',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            const BelowAppBar(),
            Text(
              user.email,
              style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 15,
                  color: Colors.grey.shade800),
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileRows(
              title: 'my orders',
              desc: 'Order Status, History And Traking',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrdersViewUser()));
              },
            ),
            ProfileRows(
              title: 'my Favourites',
              desc: 'View Favourite Items',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouritePage()));
              },
            ),
            ProfileRows(
              title: 'Address',
              desc: 'Manage Your Address',
              onPressed: () {},
            ),
            // const ProfileRows(
            //   title: 'my cart',
            //   desc: 'View Your Cart-Items',
            // ),
            ProfileRows(
              title: 'Log Out',
              desc: 'log out from the Account',
              onPressed: () => onBackDialog(context),
            ),
            ProfileRows(
              title: 'Exit',
              desc: 'Exit From the Application',
              onPressed: () => onExitDialog(context),
            ),
            // const SizedBox(height: 10),
            // const TopButtons(),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: const Text(
                    'MY ORDERS',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrdersViewUser()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.myTealColor,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ])),
          const SliverFillRemaining(
            child: Orders(),
          )
        ],
      ),
    );
  }
}
