

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../init/navigation/navigation_constants.dart';
import '../../init/navigation/navigation_service.dart';

class AuthDialogs {
  static createUserActionSuccess(WidgetRef ref) => AwesomeDialog(
    context: ref.context,
    dialogType: DialogType.warning,
    animType: AnimType.bottomSlide,
    title: "Başarılı",
    desc: "Login Olabilirsiniz",
    btnOkOnPress: () => NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.loginPage),
  ).show();

  static createUserActionFailed(WidgetRef ref,String errorMessage,
      {String? title}) => AwesomeDialog(
    context: ref.context,
    dialogType: DialogType.error,
    animType: AnimType.bottomSlide,
    title: title ?? "Başarısız",
    desc: errorMessage,
    btnOkOnPress: () {},
  ).show();
}
