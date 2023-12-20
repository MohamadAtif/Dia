import 'package:diamart_commerce/features/account/widgets/single_product.dart';
import 'package:diamart_commerce/features/home/widgets/collection_category.dart';
import 'package:diamart_commerce/features/home/widgets/recently_added_list.dart';
import 'package:diamart_commerce/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../search/screens/search_screen.dart';
import '../widgets/address_box.dart';
import '../widgets/carousel_image.dart';
import '../widgets/top_rated.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchScreen(searchQuery: query)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Diamart',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   color: Colors.transparent,
              //   height: 42,
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   child: const Icon(Icons.mic, color: Colors.black, size: 25),
              // ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(height: 10),
            TopCategories(),
            SizedBox(height: 10),
            CarouselImage(),
            AllProductsListView()
            // CollectionCategory()
            // BestSellerProduct(),
            ,
            TopRated(),
          ],
        ),
      ),
    );
  }
}
