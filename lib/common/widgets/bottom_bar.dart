import 'package:diamart_commerce/features/orders/screens/orders_view_user.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../constants/global_variables.dart';
import '../../features/account/screens/account_screen.dart';
import '../../features/cart/screens/cart_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../providers/user_provider.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const OrdersViewUser(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
        body: pages[_page],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GNav(
                selectedIndex: _page,
                onTabChange: updatePage,
                color: Colors.black,
                // gap: 1,
                // backgroundColor: Colors.white,
                activeColor: Colors.black,
                tabBackgroundColor: Colors.grey.shade300,
                padding: const EdgeInsets.all(16),
                tabs: [
                  const GButton(
                    icon: Icons.home,
                    text: '   Home',
                  ),
                  const GButton(
                    icon: Icons.event_note_outlined,
                    text: '   Orders',
                  ),
                  const GButton(
                    icon: Icons.person_2,
                    text: ' Profile',
                  ),
                  GButton(
                    leading: badges.Badge(
                      badgeContent: Text(
                        userCartLen.toString(),
                        style: TextStyle(
                          color: _page == 3 ? Colors.black : Colors.black,
                        ),
                      ),
                      badgeStyle: const badges.BadgeStyle(
                          padding: EdgeInsets.all(1),
                          badgeColor: Colors.transparent),
                      child: _page == 3
                          ? const Icon(
                              Icons.shopping_cart_sharp,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.black,
                            ),
                    ),
                    icon: Icons.shopping_cart_rounded,
                    text: '    Cart',
                  ),
                ]),
          ),
        )

        //  BottomNavigationBar(
        //   currentIndex: _page,
        //   selectedItemColor: GlobalVariables.selectedNavBarColor,
        //   unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        //   backgroundColor: GlobalVariables.backgroundColor,
        //   iconSize: 28,
        //   onTap: updatePage,
        //   items: [
        //     // HOME
        //     BottomNavigationBarItem(
        //       icon: Container(
        //         width: bottomBarWidth,
        //         decoration: BoxDecoration(
        //           border: Border(
        //             top: BorderSide(
        //               color: _page == 0
        //                   ? GlobalVariables.selectedNavBarColor
        //                   : GlobalVariables.backgroundColor,
        //               width: bottomBarBorderWidth,
        //             ),
        //           ),
        //         ),
        //         child: const Icon(
        //           Icons.home,
        //         ),
        //       ),
        //       label: '',
        //     ),
        //     // ACCOUNT
        //     BottomNavigationBarItem(
        //       icon: Container(
        //         width: bottomBarWidth,
        //         decoration: BoxDecoration(
        //           border: Border(
        //             top: BorderSide(
        //               color: _page == 1
        //                   ? GlobalVariables.selectedNavBarColor
        //                   : GlobalVariables.backgroundColor,
        //               width: bottomBarBorderWidth,
        //             ),
        //           ),
        //         ),
        //         child: const Icon(
        //           Icons.person_2,
        //         ),
        //       ),
        //       label: '',
        //     ),
        //     // CART
        //     BottomNavigationBarItem(
        //       icon: Container(
        //         width: bottomBarWidth,
        //         decoration: BoxDecoration(
        //           border: Border(
        //             top: BorderSide(
        //               color: _page == 2
        //                   ? GlobalVariables.selectedNavBarColor
        //                   : GlobalVariables.backgroundColor,
        //               width: bottomBarBorderWidth,
        //             ),
        //           ),
        //         ),
        // child: badges.Badge(
        //   badgeContent: Text(userCartLen.toString()),
        //   badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
        //           child: const Icon(
        //             Icons.shopping_cart,
        //           ),
        //         ),
        //       ),
        // label: '',
        //     ),
        //   ],
        // ),
        );
  }
}
