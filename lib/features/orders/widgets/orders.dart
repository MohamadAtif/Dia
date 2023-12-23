import 'package:diamart_commerce/common/widgets/loader_gridview.dart';
import 'package:diamart_commerce/features/account/widgets/image_product.dart';
import 'package:diamart_commerce/features/orders/screens/order_details.dart';
import 'package:diamart_commerce/features/orders/widgets/empty_order_page.dart';
import 'package:flutter/material.dart';
import '../../../models/order.dart';
import '../../account/services/account_services.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
        ? const LoaderGridView()
        : orders!.isEmpty
            ? const EmptyOrderPage()
            : Container(
                // height: 170,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
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
                        child: ImageProduct(
                          image: orders![index].products[0].images[0],
                        ),
                      ),
                    );
                  },
                ),
              );
  }
}
