import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/async.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/eft/qr_with_send_money_manager.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/models/transaction/custom_transaction.dart';
import 'package:topkapi_bank/utilities/components/dialogs/custom_dialogs.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';

import '../../../../../line/view_models/app/loading_manager.dart';
import '../../../../../utilities/components/custom_elevated_button.dart';
import '../../../../../utilities/components/row_form_field.dart';
import '../../../../../utilities/init/theme/custom_colors.dart';
import '../../../../auth/customs/complex_inherited.dart';

class EnterValueOfAmountQrContent extends ConsumerStatefulWidget {
  const EnterValueOfAmountQrContent({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EnterValueOfAmountQrContentState();
}

class _EnterValueOfAmountQrContentState
    extends ConsumerState<EnterValueOfAmountQrContent> {
  @override
  Widget build(BuildContext context) {
    final formKey = ComplexInherited.of(context).qrSendMoneyForm;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mainTitle("Güncel Bilgilerim"),
                infoCol(
                    "Mevcut Bakiye", "${ref.read(currentBankUser)!.balance!}₺"),
                mainTitle("Gönderilecek Kişinin Bilgileri"),
                infoCol(
                    "Gönderilen Kişinin Adı",
                    ref
                        .read(currentQrSendMoneyState.notifier)
                        .receiverBankUser!
                        .userName!),
                infoCol(
                    "Gönderilen Kişinin Mail Adresi",
                    ref
                        .read(currentQrSendMoneyState.notifier)
                        .receiverBankUser!
                        .email!),
                infoCol(
                    "Gönderilen IBAN",
                    ref
                        .read(currentQrSendMoneyState.notifier)
                        .receiverBankUser!
                        .iban!),
                mainTitle("İşlemi Bilgisi"),
                RowFormField(
                    headerName: 'Ödeme Miktarı',
                    inputType: TextInputType.number,
                    editingController: ComplexInherited.of(context)
                        .sendMoneyQrAmountController,
                    custValidateFunction: (val) => val != null && val.isNotEmpty
                        ? null
                        : "Lütfen Ödeme Giriniz"),
                RowFormField(
                    headerName: "Açıklama",
                    maxLines: 5,
                    editingController:
                        ComplexInherited.of(context).sendQrExplainController,
                    custValidateFunction: (val) => val != null && val.isNotEmpty
                        ? null
                        : "Boş Bırakılamaz"),
                SizedBox(
                  height: 2.h,
                ),
                CustomElevatedButton(
                  onPressed: ref.watch(currentLoadingManager) !=
                          LoadingStates.loading
                      ? () async {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            final amount = int.parse(
                                ComplexInherited.of(context)
                                    .sendMoneyQrAmountController
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
                                          .sendQrExplainController
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
                CustomElevatedButton(
                  onPressed: () => ref
                      .read(currentQrSendMoneyState.notifier)
                      .changState(QrSendStates.search),
                  inButtonText: 'Vazgeç',
                  primaryColor: CustomColors.secondaryColor,
                  inButtonTextStyle: ThemeValueExtension.subtitle
                      .copyWith(color: Colors.white),
                  outBorder: const StadiumBorder(
                    side: BorderSide(
                        width: 3.0, color: CustomColors.customGreyColor),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
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
}
