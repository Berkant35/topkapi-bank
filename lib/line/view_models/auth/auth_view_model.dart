import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/db/auth/auth_manager.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';
import 'package:topkapi_bank/utilities/components/dialogs/custom_dialogs.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_service.dart';

import '../../../utilities/init/navigation/navigation_constants.dart';

class CurrentBankUserNotifier extends StateNotifier<BankUser?> {
  CurrentBankUserNotifier(BankUser? bankUser) : super(null);
  final _authService = AuthService();

  Future<bool> createUserWithEmailAndPassword(
      WidgetRef ref, String email, String password, String userName) async {
    try {
      ref
          .read(currentLoadingManager.notifier)
          .changeState(LoadingStates.loading);
      final currentUser = await _authService.createUserWithEmailAndPassword(
          ref, email, password, userName);

      if (currentUser != null) {

        state = currentUser;

        CustomDialogs.successTitleAndOk(ref, "", "Başarılı",
            "Kaydınız oluşturuldu. Giriş sağlayabilirsiniz.",
            pressOk: () => NavigationService.instance
                .navigateToPage(path: NavigationConstants.homePage));
      }

      ref.read(currentLoadingManager.notifier).changeState(LoadingStates.idle);
      return true;
    } catch (e) {
      logger.e("Error Message ${e.toString()}");
      return false;
    }
  }

  Future<void> currentUser(WidgetRef ref) async {
    state = await _authService.currentUser();
  }

  Future<bool> deleteUser(String rootUserID) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  Future signIn(WidgetRef ref, String email, String password) async {
    try {
      ref
          .read(currentLoadingManager.notifier)
          .changeState(LoadingStates.loading);
      state = await _authService.signIn(ref, email, password);
      ref.read(currentLoadingManager.notifier).changeState(LoadingStates.idle);
      if (state != null) {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.homePage);
      }
      return true;
    } catch (e) {
      logger.e("Error Message ${e.toString()}");
      return false;
    }
  }

  Future<bool> signOut(
    WidgetRef ref,
  ) async {
    try {
      if (await _authService.signOut(ref)) {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.baseAuthPage);
      }
      return true;
    } catch (e) {
      logger.e("Error Message ${e.toString()}");
      return false;
    }
  }

  Future<bool> updateEmail(WidgetRef ref, String email, String password) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  Future<void> updatePassword(
      WidgetRef ref, String currentPassword, String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
