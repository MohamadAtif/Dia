// import 'package:flutter/material.dart';

// import '../../../models/product.dart';
// import '../../product_details/screens/product_details_screen.dart';
// import '../services/home_services.dart';

// class BestSellerProduct extends StatefulWidget {
//   const BestSellerProduct({super.key, });

//   @override
//   State<BestSellerProduct> createState() => _BestSellerProductState();
// }

// class _BestSellerProductState extends State<BestSellerProduct> {
//   final HomeServices homeServices = HomeServices();
//   final List<Product>? productList;

//   _BestSellerProductState(this.productList);

//   @override
//   void initState() {
//     super.initState();
//     fetchCategoryProducts();
//   }

//   fetchCategoryProducts() async {
//     productList = await homeServices.fetchCategoryProducts(
//       context: context,
//       category: widget.category,
//     );
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           const Row(
//             children: [
//               Text(
//                 'Best Seller',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontFamily: 'Kanit',
//                     fontWeight: FontWeight.bold),
//               ),
//               Spacer(),
//               Text(
//                 'See All Products',
//                 style: TextStyle(
//                     fontSize: 15, fontFamily: 'Kanit', color: Colors.teal),
//               )
//             ],
//           ),
//           SizedBox(
//             child: GridView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.only(left: 15),
//               itemCount: widget.productList!.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 childAspectRatio: 1.4,
//                 mainAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 final product = widget.productList![index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ProductDetailScreen(
//                                   product: product,
//                                 )));
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 130,
//                         child: DecoratedBox(
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black12,
//                               width: 0.5,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: Image.network(
//                               product.images[0],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.topLeft,
//                         padding: const EdgeInsets.only(
//                           left: 0,
//                           top: 5,
//                           right: 15,
//                         ),
//                         child: Text(
//                           product.name,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
