import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/db/auth/auth_manager.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';

class CurrentBankUserNotifier extends StateNotifier<BankUser?> {
  CurrentBankUserNotifier(BankUser? bankUser) : super(null);
  //final _authService = AuthService();


  Future<bool> createUserWithEmailAndPassword(String email, String password,String userName,WidgetRef ref) async {
    try{
      ref.read(currentLoadingManager.notifier).changeState(LoadingStates.loading);
      //await _authService.createUserWithEmailAndPassword(email, password,userName);
      await Future.delayed(const Duration(seconds: 2));
      ref.read(currentLoadingManager.notifier).changeState(LoadingStates.idle);
      return true;
    }catch(e){
      logger.e("Error Message ${e.toString()}");
      return false;
    }
  }

  Future currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  Future<bool> deleteUser(String rootUserID) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  Future signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  Future<bool> updateEmail(String email, String password) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  Future<void> updatePassword(String currentPassword, String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }


}
