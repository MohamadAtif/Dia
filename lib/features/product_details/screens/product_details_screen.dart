import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diamart_commerce/common/widgets/loader.dart';
import 'package:diamart_commerce/common/widgets/showdialog.dart';
import 'package:diamart_commerce/features/account/widgets/single_product.dart';
import 'package:diamart_commerce/features/address/screens/address_screen.dart';
import 'package:diamart_commerce/features/home/services/home_services.dart';
import 'package:diamart_commerce/features/product_details/widgets/youmay_like.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/stars.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../models/product.dart';
import '../../../providers/user_provider.dart';
import '../../search/screens/search_screen.dart';
import '../services/product_details_services.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;
  bool isLoading = false;
  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();

    calculateRating();
    fetchCategoryProducts();
  }

  void calculateRating() {
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;

      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.product.category,
    );
    setState(() {});
  }
  // void navigateToAddressScreen(int sum) {

  // }

  void navigateToSearchScreen(String query) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchScreen(searchQuery: query)));
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );

    alertDialogToast('Added To Cart Succefully');
    // showSnackBar(context, 'Added To Cart Succefully');
    // Navigator.pop(context);
  }

  void buyNow() {
    productDetailsServices.buyNow(
      context: context,
      product: widget.product,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddressScreen(
                  totalAmount: widget.product.price.toString(),
                )));
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                  margin: const EdgeInsets.only(left: 0),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey.shade700,
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
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Number of Rating : ( ${widget.product.rating!.length} )",
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.teal.shade600,
                          fontSize: 12,
                        ),
                      ),
                      Stars(
                        rating: avgRating,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 10,
                  ),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CarouselSlider(
                  items: widget.product.images.map(
                    (i) {
                      return Builder(
                        builder: (BuildContext context) => CachedNetworkImage(
                          imageUrl: i,
                          fit: BoxFit.contain,
                          height: 200,
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 290,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                // Container(
                //   color: Colors.black12,
                //   height: 5,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(
                      text: ' ',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit'),
                      children: [
                        TextSpan(
                          text: '${widget.product.price} EGP',
                          style: const TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.product.description,
                    style: const TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                // Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: CustomButton(
                //       color: GlobalVariables.myTealColor,
                //       text: 'Buy Now',
                //       onTap: buyNow,
                //     )),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        addToCart();
                        await Future.delayed(
                            const Duration(milliseconds: 1200));
                        setState(() {
                          isLoading = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: GlobalVariables.secondaryColor,
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Add to Cart'.toUpperCase(),
                              style: const TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                    )
                    //  CustomButton(
                    //   text: 'Add to Cart',
                    //   onTap: addToCart,
                    //   color: GlobalVariables.myTealColor,
                    //   // color: const Color.fromRGBO(254, 216, 19, 1),
                    // ),
                    ),
                const SizedBox(height: 10),
                // Container(
                //   color: Colors.black12,
                //   height: 5,
                // ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Rate The Product',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Kanit'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingBar.builder(
                  initialRating: myRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star_border_outlined,
                    color: GlobalVariables.secondaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    productDetailsServices.rateProduct(
                      context: context,
                      product: widget.product,
                      rating: rating,
                    );
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey.shade200,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'You may also Like',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const SizedBox(
                //   height: 1,
                // ),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: productList == null
                  ? const SizedBox(child: Loader())
                  : youMAyAlsoLike(productList: productList))
        ],
      ),
    );
  }
}

class youMAyAlsoLike extends StatelessWidget {
  const youMAyAlsoLike({
    super.key,
    required this.productList,
  });

  final List<Product>? productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 259,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productList!.length,
        itemExtent: 160,
        itemBuilder: (context, index) {
          final productData = productList![index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                                product: productData,
                              )));
                },
                child: SizedBox(
                  // height: 200,
                  child: SingleProduct(
                    image: productData.images[0],
                    name: productData.name,
                    price: productData.price,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Expanded(
              //         child: Column(
              //           children: [
              //             Text(
              //               productData.name,
              //               style: const TextStyle(
              //                   fontFamily: 'Kanit', fontSize: 16),
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //             Text(
              //               productData.price.toInt().toString(),
              //               style: const TextStyle(
              //                   color: Colors.red,
              //                   fontFamily: 'Kanit',
              //                   fontSize: 16),
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 2,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
