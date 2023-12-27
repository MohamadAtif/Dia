import 'package:diamart_commerce/common/widgets/bottom_bar.dart';
import 'package:diamart_commerce/common/widgets/loader_listViewSearchpage.dart';
import 'package:diamart_commerce/common/widgets/search_container.dart';
import 'package:diamart_commerce/features/search/widget/buttonGoShoppingSearchPage.dart';
import 'package:diamart_commerce/features/search/widget/empty_searched_page.dart';
import 'package:diamart_commerce/features/search/widget/sortbuttonbody.dart';
import 'package:diamart_commerce/features/search/widget/textsort_modal.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
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
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SearchContainer(),
            const SizedBox(width: 7),
            InkWell(
              onTap: () {
                showModalsheet(context);
              },
              child: const SortButton(),
            )
          ]),
        ),
      ),
      bottomSheet: ButtonGoShoppingSearchPage(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomBar()),
              (route) => false);
        },
      ),
      body: products == null
          ? const LoaderListViewSearchPage()
          : products!.isEmpty
              ? EmptySearchedPage(searchQuery: widget.searchQuery)
              : Column(
                  children: [
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
                            child: SearchedProduct(
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

////////////////////////////////////////Functions Search And filtring Data
  ///

  fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  fetchSearchedProductHighestRated() async {
    products = await searchServices.fetchSearchedProductHighestRated(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  sortProductslowestPriceToHigh() {
    setState(() {
      products!.sort(
        (a, b) => a.price.compareTo(b.price),
      );
    });
  }

  sortProductsHighestPriceToLow() {
    setState(() {
      products!.sort(
        (a, b) => b.price.compareTo(a.price),
      );
    });
  }

  void showModalsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 320,
            color: Colors.grey.shade100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const SizedBox(width: 120),
                      const Text(
                        'SORT SEARCH',
                        style: TextStyle(
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextSort(
                    onTap: () {
                      setState(() {
                        fetchSearchedProductHighestRated();
                      });
                      Navigator.pop(context);
                    },
                    text: 'Highest-Rated',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextSort(
                    onTap: () {
                      sortProductsHighestPriceToLow();
                      Navigator.pop(context);
                    },
                    text: 'Highest Price To lowest',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextSort(
                    onTap: () {
                      sortProductslowestPriceToHigh();
                      Navigator.pop(context);
                    },
                    text: 'Lowest Price to Highest',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              GlobalVariables.secondaryColor)),
                      child: const Text(
                        'CANCLE SORTING',
                        style:
                            TextStyle(fontFamily: 'Kanit', color: Colors.white),
                      ),
                      onPressed: () {
                        fetchSearchedProduct();
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          );
        });
  }
}
