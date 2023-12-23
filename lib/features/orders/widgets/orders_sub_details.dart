import 'package:diamart_commerce/common/widgets/bottom_bar.dart';
import 'package:diamart_commerce/common/widgets/loader_orders.dart';
import 'package:diamart_commerce/features/account/widgets/single_product.dart';
import 'package:diamart_commerce/features/orders/screens/order_details.dart';
import 'package:diamart_commerce/features/orders/widgets/empty_order_page.dart';
import 'package:diamart_commerce/features/orders/widgets/orders_subdetails_card.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variables.dart';
import '../../../models/order.dart';
import '../../account/services/account_services.dart';

class OrdersSubDetails extends StatefulWidget {
  const OrdersSubDetails({Key? key}) : super(key: key);

  @override
  State<OrdersSubDetails> createState() => _OrdersSubDetailsState();
}

class _OrdersSubDetailsState extends State<OrdersSubDetails> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const LoaderOrdersListView()
        : orders!.isEmpty
            ? const EmptyOrderPage()
            : Container(
                // height: 170,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OrderDetailScreen(order: orders![index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OrderSubDetailsCard(order: orders![index]),
                      ),
                    );
                  },
                ),
              );
  }
}
