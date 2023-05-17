


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/line/view_models/auth/auth_view_model.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';

final currentLoadingManager =
StateNotifierProvider<LoadingStateManagerNotifier, LoadingStates>(
        (ref) {
      return LoadingStateManagerNotifier(LoadingStates.idle);
    });


//You can handle all authentication bussiniess logics
final currentBankUser =
StateNotifierProvider<CurrentBankUserNotifier, BankUser?>((ref) {
  return CurrentBankUserNotifier(null);
});
