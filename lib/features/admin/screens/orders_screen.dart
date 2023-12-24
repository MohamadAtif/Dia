import 'package:diamart_commerce/common/widgets/loader_gridview.dart';
import 'package:diamart_commerce/features/account/widgets/image_product.dart';
import 'package:diamart_commerce/features/orders/screens/order_details.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/loader.dart';
import '../../../models/order.dart';
import '../../../common/widgets/single_product.dart';
import '../services/admin_services.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const LoaderGridView()
        : GridView.builder(
            itemCount: orders!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailScreen(
                                order: orderData,
                              )));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: ImageProduct(
                        image: orderData.products[0].images[0],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        orderData.products[0].name,
                        style: const TextStyle(fontFamily: 'Kanit'),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
