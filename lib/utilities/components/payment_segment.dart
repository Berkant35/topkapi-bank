import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';

class PaymentSegment extends StatefulWidget {
  final Segments segment;
  const PaymentSegment(
      {super.key,
      required this.paymentSection,
      required this.debt,
      required this.icon,
      required this.segment});
  final String paymentSection;
  final double debt;
  final Widget icon;

  @override
  State<PaymentSegment> createState() => _PaymentSegmentState();
}

class _PaymentSegmentState extends State<PaymentSegment> {
  late Segments segment;
  late Widget icon;
  late double debt;
  late String paymentSection;

  @override
  void initState() {
    super.initState();
    segment = widget.segment;
    icon = widget.icon;
    debt = widget.debt;
    paymentSection = widget.paymentSection;
  }

  Map<Segments, Color> colorMap = {
    Segments.food: const Color.fromARGB(255, 239, 207, 205),
    Segments.shopping: Colors.blue,
    Segments.other: Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    Color? cardColor = colorMap[segment];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
        ),
        width: 35.w,
        height: 20.h,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 01.h),
              child: Text(
                paymentSection,
                style: context.textTheme.headlineSmall,
              ),
            ),
            Text(
              '$debt TL',
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

enum Segments {
  food('Yemek'),
  shopping('Alışveriş'),
  other('Diğer');

  const Segments(this.message);
  final String message;
}
