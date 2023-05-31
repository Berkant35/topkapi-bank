import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QrPage extends ConsumerStatefulWidget {
  const QrPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _QrPageState();
}

class _QrPageState extends ConsumerState<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Qr"),
    );
  }
}
