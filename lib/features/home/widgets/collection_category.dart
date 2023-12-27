// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:diamart_commerce/common/widgets/single_product.dart';
// import 'package:diamart_commerce/features/home/services/home_services.dart';
// import 'package:diamart_commerce/models/product.dart';
// import 'package:flutter/material.dart';

// class CollectionCategory extends StatefulWidget {
//   const CollectionCategory({
//     super.key,
//   });

//   @override
//   State<CollectionCategory> createState() => _CollectionCategoryState();
// }

// class _CollectionCategoryState extends State<CollectionCategory> {
//   List<Product>? productList;
//   final HomeServices homeServices = HomeServices();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchCategoryProducts();
//   // }

//   // fetchCategoryProducts() async {
//   //   productList = await homeServices.fetchCategoryProducts(
//   //     context: context,
//   //     category: widget.category,
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Text(
//                 'RECENTLY ADDED',
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Kanit',
//                     fontWeight: FontWeight.normal),
//               ),
//               Spacer(),
//               Text(
//                 'See All',
//                 style: TextStyle(
//                     fontSize: 15, fontFamily: 'Kanit', color: Colors.teal),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 180,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 1,
//             itemBuilder: (context, index) => CachedNetworkImage(
//                 imageUrl:
//                     //  productList![index].images[0]
//                     'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg'),
//           ),
//         ),
//       ],
//     );
//   }
// }
