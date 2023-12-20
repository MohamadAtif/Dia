import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
import '../../home/widgets/address_box.dart';
import '../../product_details/screens/product_details_screen.dart';
import '../services/search_services.dart';
import '../widget/searched_product.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

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
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: products == null
          ? const Loader()
          : products!.isEmpty
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Icon(Icons.no_cell,
                          color: Colors.grey.shade400, size: 60),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        " Sorry, we could'nt find any results for #${widget.searchQuery.toString()} \n           Try Adjusting Your Search",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            color: Colors.grey.shade400),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    const AddressBox(),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                            product: products![index],
                                          )));
                            },
                            child: products![index] == ''
                                ? const Text('dfjjjjjjjjjj')
                                : SearchedProduct(
                                    product: products![index],
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
