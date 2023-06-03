import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';

import '../../constants/extension/context_extensions.dart';

class CustomDialogs {
  static void deleteConsumer(WidgetRef ref, String rootUserID) {
    final deleteAwesomeDialog = AwesomeDialog(
        context: ref.context,
        dialogType: DialogType.warning,
        title: "Müşteri Sil",
        desc: "Müşteri Sil",
        body: Text(
          "Bu işlemi yapmaktan emin misiniz?",
          style: ThemeValueExtension.subtitle,
        ),
        btnOkText: "Sil",
        btnCancelText: "Vazgeç",
        btnCancelOnPress: () {},
        btnOkOnPress: () {});
    deleteAwesomeDialog.show();
  }

  static void successTitleAndOk(
      WidgetRef ref, String rootUserID, String title, String desc,
      {Function? pressOk}) {
    final deleteAwesomeDialog = AwesomeDialog(
        context: ref.context,
        dialogType: DialogType.success,
        title: title,
        desc: desc,
        btnOkText: "Tamam",
        btnOkOnPress: pressOk != null ? () => pressOk : null);

    deleteAwesomeDialog.show();
  }

  static void failed(WidgetRef ref, String title, String desc,
      {Function? pressOk}) {
    final deleteAwesomeDialog = AwesomeDialog(
        context: ref.context,
        dialogType: DialogType.error,
        title: title,
        desc: desc,
        btnOkText: "Tamam",
        btnOkOnPress: pressOk != null ? () => pressOk : null);

    deleteAwesomeDialog.show();
  }

  static void areYouSureToExitApp(
    WidgetRef ref,
    String title,
    String desc,
  ) {
    final deleteAwesomeDialog = AwesomeDialog(
        context: ref.context,
        dialogType: DialogType.warning,
        title: title,
        desc: desc,
        btnOkText: "Evet",
        btnCancelText: "Vazgeç",
        btnOkOnPress: () => ref.read(currentBankUser.notifier).signOut(ref),
        btnCancelOnPress: () {});

    deleteAwesomeDialog.show();
  }
}
