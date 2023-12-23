import 'package:diamart_commerce/common/widgets/search_container.dart';
import 'package:diamart_commerce/features/home/widgets/recently_added_list.dart';
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
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SearchContainer()],
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
            AllProductsListView(),
            // CollectionCategory()
            // BestSellerProduct(),
            TopRated(),
          ],
        ),
      ),
    );
  }
}
