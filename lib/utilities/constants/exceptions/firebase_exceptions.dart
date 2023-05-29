import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/dialogs/auth_dialogs.dart';

class FirebaseExceptions {
  static handleFirebaseException(String errorMessage, WidgetRef ref,{String? title}) {
    if (errorMessage.contains("email-already-in-use")) {
      AuthDialogs.createUserActionFailed(ref, "E-mail Zaten Kullanımda");
    } else if (errorMessage.contains("invalid-email")) {
      AuthDialogs.createUserActionFailed(ref, "Geçersiz E-Mail Formatı");
    } else if (errorMessage.contains("weak-password")) {
      AuthDialogs.createUserActionFailed(
          ref, "Zayıf Şifre");
    }else if(errorMessage.contains("The password is invalid")){
      AuthDialogs.createUserActionFailed(ref, "Yanlış Şifre");
    } else {
      AuthDialogs.createUserActionFailed(ref, "Belirlenilemeyen Bir Hata Gerçekleşti");
    }
  }
}
