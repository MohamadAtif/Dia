// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:diamart_commerce/features/admin/models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sales sales;

    return BarChart(
      BarChartData(
        borderData: FlBorderData(),
        maxY: 100,
        minY: 0,
        // borderData:
      ),
      swapAnimationCurve: Curves.bounceIn,
      swapAnimationDuration: const Duration(milliseconds: 9),
    );
    // seriesList,
  }
}
