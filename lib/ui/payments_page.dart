import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utilities/components/back_type_2.dart';
import '../utilities/components/main_navigation_bar.dart';
import '../utilities/components/payment_segment.dart';
import '../utilities/constants/app/application_constants.dart';
import '../utilities/constants/extension/context_extensions.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});
  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> data = <CircularStackEntry>[
    const CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(1300.0, Colors.green, rankKey: 'Q2'),
        CircularSegmentEntry(2000.0, Colors.blue, rankKey: 'Q3'),
        CircularSegmentEntry(700.0, Colors.yellow, rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const double foodDebt = 1865;
    const double shoppingDebt = 8999;
    const double otherDebt = 3349;
    const double totalAmount = foodDebt + shoppingDebt + otherDebt;
    return Scaffold(
        
        body: BackTypeTwo(
            contentWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _transactionsText(context),
            Center(
              child: AnimatedCircularChart(
                key: _chartKey,
                size: Size(70.w, 70.w),
                initialChartData: data,
                chartType: CircularChartType.Radial,
                holeLabel: "${totalAmount}TL",
                labelStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
              ),
            ),
            _expensesText(context),
            _divider(),
            ExpensesSegment(
              expensesSegment: [
                PaymentSegment(
                    paymentSection: Segments.food.message,
                    debt: foodDebt,
                    icon: const Icon(
                      Icons.food_bank_sharp,
                      size: 56,
                    ),
                    segment: Segments.food),
                PaymentSegment(
                    paymentSection: Segments.shopping.message,
                    debt: shoppingDebt,
                    icon: const Icon(
                      Icons.shop,
                      size: 56,
                    ),
                    segment: Segments.shopping),
                PaymentSegment(
                    paymentSection: Segments.other.message,
                    debt: otherDebt,
                    icon: const Icon(
                      Icons.pie_chart_outline_sharp,
                      size: 56,
                    ),
                    segment: Segments.other),
              ],
            ),
          ],
        )));
  }

  Divider _divider() {
    return const Divider(
      color: Colors.black,
      thickness: 0.1,
    );
  }

  Padding _expensesText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.paddingNormal.left),
      child: Text(
        HomePageStrings.expenses,
        style: ThemeValueExtension.headline6,
      ),
    );
  }
}

class ExpensesSegment extends StatelessWidget {
  List<Widget> expensesSegment = [];
  ExpensesSegment({super.key, required List<Widget> expensesSegment})
      : expensesSegment = expensesSegment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 20.h,
      child:
          ListView(scrollDirection: Axis.horizontal, children: expensesSegment),
    );
  }
}

Padding _transactionsText(BuildContext context) {
  return Padding(
      padding: EdgeInsets.only(left: context.paddingNormal.left),
      child: Text(
        HomePageStrings.transactions,
        style: ThemeValueExtension.headline6,
      ));
}
