import 'package:diamart_commerce/features/account/widgets/top_buttons.dart';
import 'package:diamart_commerce/features/admin/widgets/category_products_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as charts;

import '../../../common/widgets/loader.dart';
import '../models/sales.dart';
import '../services/admin_services.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  Sales? sales;
  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const TopButtons(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Total sales: $totalSales EGP',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const SizedBox(
              //     height: 430,
              //     child: CategoryProductsChart(
              //       seriesList: [],
              //     )
              //     //  CategoryProductsChart(seriesList: [
              //     //   charts.Series(
              //     //     id: 'Sales',
              //     //     data: earnings!,
              //     //     domainFn: (Sales sales, _) => sales.label,
              //     //     measureFn: (Sales sales, _) => sales.earning,
              //     //   ),
              //     // ]),
              //     ),
            ],
          );
  }
}
