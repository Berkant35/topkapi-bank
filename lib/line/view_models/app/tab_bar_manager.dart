import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class TabManagerIndexControlNotifier extends StateNotifier<int> {
  TabManagerIndexControlNotifier(int state) : super(0);

  void changState(int val) => state = val;
}
