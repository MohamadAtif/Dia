import 'package:diamart_commerce/common/widgets/bottom_bar.dart';
import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:diamart_commerce/features/orders/widgets/orders.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            // leading: Icons.arrow_back_ios_new_outlined,
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'FAVOURITES  ',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w100,
                                fontSize: 23),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 33,
                          )
                        ],
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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Opacity(
                opacity: .5,
                child: Image.asset(
                  'assets/images/broken-heart.png',
                  height: 80,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "NO HEARTED ITEMS!",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Kanit',
                    color: Colors.grey.shade400),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomBar()),
                        (route) => false);
                  },
                  child: const Text('Keep Shopping',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Kanit',
                          color: Colors.red)))
            ],
          ),
        ));
  }
}
