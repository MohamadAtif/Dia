import 'package:cached_network_image/cached_network_image.dart';
import 'package:diamart_commerce/features/orders/screens/order_details.dart';
import 'package:diamart_commerce/models/order.dart';
import 'package:diamart_commerce/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderSubDetailsCard extends StatelessWidget {
  const OrderSubDetailsCard({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderDetailScreen(order: order)));
      },
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDER ID :  ${order.id}',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Kanit',
                          color: Colors.grey.shade700),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'ORDERED At :   ${DateFormat().format(
                        DateTime.fromMillisecondsSinceEpoch(order.orderedAt),
                      )}',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Kanit',
                          color: Colors.grey.shade700),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'SHPPING ADDRESS :  ${order.address}',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Kanit',
                          color: Colors.grey.shade700),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          'TOTALL : ',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Kanit',
                              color: Colors.grey.shade700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${order.totalPrice} EGP',
                          style: const TextStyle(
                              fontSize: 16, fontFamily: 'Kanit'),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i < order.products.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          child: CachedNetworkImage(
                            imageUrl: order.products[i].images[0],
                            height: 120,
                            width: 120,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.products[i].name.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Kanit'),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Qty: ${order.quantity[i]}',
                                style: const TextStyle(fontFamily: 'Kanit'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Divider(
          //   thickness: 3,
          //   color: Colors.grey.shade400,
          // )
        ],
      ),
    );
  }
}
