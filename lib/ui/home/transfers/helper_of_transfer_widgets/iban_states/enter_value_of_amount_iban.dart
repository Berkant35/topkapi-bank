

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/async.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/ui/auth/customs/complex_inherited.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';

import '../../../../../line/view_models/global_providers.dart';

import '../../../../../models/transaction/custom_transaction.dart';
import '../../../../../utilities/components/custom_elevated_button.dart';
import '../../../../../utilities/components/dialogs/custom_dialogs.dart';
import '../../../../../utilities/components/row_form_field.dart';
import '../../../../../utilities/init/theme/custom_colors.dart';

class EnterValueOfAmountIbanContent extends ConsumerStatefulWidget {
  const EnterValueOfAmountIbanContent({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EnterValueOfAmountIbanContentState();
}

class _EnterValueOfAmountIbanContentState extends ConsumerState<EnterValueOfAmountIbanContent> {
  @override
  Widget build(BuildContext context) {
    final ibanFormKey = ComplexInherited.of(context).ibanFormKey;

    return Form(
        key: ibanFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mainTitle("Güncel Bilgilerim"),
                infoCol(
                    "Mevcut Bakiye", "${ref.read(currentBankUser)!.balance!}₺"),
                RowFormField(
                    headerName: "Miktar",
                    editingController: ComplexInherited.of(context)
                        .sendMoneyWithIbanAmountController,
                    custValidateFunction: (val) => val != null && val.isNotEmpty
                        ? null
                        : "Boş Bırakılamaz"),
                ibanInput(context, ref),
                RowFormField(
                    headerName: "Gönderici Adı Ve Soyadı",
                    editingController:
                    ComplexInherited.of(context).sendIbanNumberController,
                    custValidateFunction: (val) => val != null && val.isNotEmpty
                        ? null
                        : "Boş Bırakılamaz"),
                RowFormField(
                    headerName: "Açıklama",
                    maxLines: 5,
                    editingController:
                    ComplexInherited.of(context).sendIbanExplainController,
                    custValidateFunction: (val) => val != null && val.isNotEmpty
                        ? null
                        : "Boş Bırakılamaz"),
                SizedBox(
                  height: 4.h,
                ),
                CustomElevatedButton(
                  onPressed: ref.watch(currentLoadingManager) !=
                      LoadingStates.loading
                      ? () async {
                    ibanFormKey.currentState!.save();
                    if (ibanFormKey.currentState!.validate()) {
                      final amount = int.parse(
                          ComplexInherited.of(context)
                              .sendMoneyWithIbanAmountController
                              .text);
                      if (ref.read(currentBankUser)!.balance! <
                          amount.toDouble()) {
                        CustomDialogs.failed(ref, "Yetersiz Bakiye",
                            "Bakiyeniz yetersiz olduğu için işlemenizi gerçekleştiremiyoruz");
                      } else {
                        ref
                            .read(currentLoadingManager.notifier)
                            .changeState(LoadingStates.loading);
                        final transactionId = await nanoid();
                        final transaction = CustomTransaction(
                            amount: amount,
                            transactionDate: DateTime.now()
                                .toString()
                                .substring(0, 16),
                            transactionId: transactionId,
                            senderIban: ref.read(currentBankUser)!.iban,
                            receiverId: ref
                                .read(currentQrSendMoneyState.notifier)
                                .receiverBankUser!
                                .userId!,
                            receiverIban: ref
                                .read(currentQrSendMoneyState.notifier)
                                .receiverBankUser!
                                .iban,
                            senderId: ref.read(currentBankUser)!.userId,
                            transactionExplain:
                            ComplexInherited.of(context)
                                .sendIbanExplainController
                                .text,
                            withQr: "1");
                        ref
                            .read(
                            currentCustomTransactionManager.notifier)
                            .doTransaction(ref, transaction);
                        ref
                            .read(currentLoadingManager.notifier)
                            .changeState(LoadingStates.idle);
                      }
                    }
                  }
                      : null,
                  inButtonText: 'Parayı Gönder',
                  primaryColor: CustomColors.primaryColor,
                  inButtonTextStyle: ThemeValueExtension.subtitle
                      .copyWith(color: Colors.white),
                  outBorder: const StadiumBorder(
                    side: BorderSide(
                        width: 3.0, color: CustomColors.customGreyColor),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                )
              ],
            ),
          ),
        ));
  }
  Padding mainTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        title,
        style: ThemeValueExtension.headline6,
      ),
    );
  }

  Column infoCol(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: ThemeValueExtension.subtitle
                .copyWith(fontWeight: FontWeight.bold)),
        Text(content,
            style: ThemeValueExtension.subtitle2
                .copyWith(fontWeight: FontWeight.w500)),
        const Divider(thickness: 0.75, color: CustomColors.primaryColor)
      ],
    );
  }
  Row ibanInput(BuildContext context, WidgetRef ref) {
    String? lastCheckedIban;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Center(
                child: Text(
                  'TR',
                  style: ThemeValueExtension.subtitle,
                  textAlign: TextAlign.center,
                ))),
        Expanded(
          flex: 8,
          child: RowFormField(
            headerName: "Iban",
            hintText: "",
            inputType: TextInputType.number,
            maxLength: 24,
            editingController:
            ComplexInherited.of(context).ibanNumberController,
            custValidateFunction: (val) {
              if (val != null && val.isNotEmpty && val.length == 24)
              {
                return null;
              } else {
                return "Geçersiz Iban";
              }
            },
            customOnChanged: (value) {

              if (value != null && value.isNotEmpty)
              {
                lastCheckedIban = "";
              }

              if (value != null &&
                  value.length == 24 &&
                  value != lastCheckedIban) {

                lastCheckedIban = value;
                ref.read(currentQrSendMoneyState.notifier).checkAnyHasUser(
                    'TR$value',
                    getAndSetForStandartIbanMode: true,
                    ref: ref);
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
