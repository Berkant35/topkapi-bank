import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}
