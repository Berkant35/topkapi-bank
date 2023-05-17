
import 'package:state_notifier/state_notifier.dart';

enum LoadingStates {loading,idle}

class LoadingStateManagerNotifier extends StateNotifier<LoadingStates> {
  LoadingStateManagerNotifier(LoadingStates state) : super(LoadingStates.idle);

  void changeState(LoadingStates loadingStates){
    state = loadingStates;
  }

}