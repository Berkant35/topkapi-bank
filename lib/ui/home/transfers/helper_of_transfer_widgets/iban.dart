import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IbanPage extends ConsumerStatefulWidget {
  const IbanPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _IbanPageState();
}

class _IbanPageState extends ConsumerState<IbanPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("İban")
      ],
    );
  }
}
