import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nanoid/async.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/card/credit_card.dart';
import 'package:topkapi_bank/utilities/components/custom_elevated_button.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../../../line/view_models/app/loading_manager.dart';
import '../../../line/view_models/global_providers.dart';
import '../../../utilities/components/row_form_field.dart';
import '../../../utilities/constants/extension/context_extensions.dart';
import '../../../utilities/constants/extension/widget_extension.dart';
import '../../../utilities/init/theme/custom_colors.dart';
import '../../auth/customs/complex_inherited.dart';

class AddCreditCard extends ConsumerStatefulWidget {
  const AddCreditCard({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddCreditCardState();
}

class _AddCreditCardState extends ConsumerState<AddCreditCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars.typeBackOneAppBar("Kart Ekle"),
      body: ComplexInherited(
        child: const AddCreditCardForm(),
      ),
    );
  }
}

class AddCreditCardForm extends ConsumerStatefulWidget {
  const AddCreditCardForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddCreditCardFormState();
}

class _AddCreditCardFormState extends ConsumerState<AddCreditCardForm> {
  CreditCard? createdCard;

  @override
  Widget build(BuildContext context) {
    final addCreditCardFormKey =
        ComplexInherited.of(context).addCreditCardFormKey;
    return Form(
      key: addCreditCardFormKey,
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              RowFormField(
                  headerName: 'Kartı Kullanacak Kişinin Adı*',
                  inputType: TextInputType.text,
                  editingController:
                      ComplexInherited.of(context).creditCardHolderNameController,
                  custValidateFunction: (val) => val != null && val.isNotEmpty
                      ? null
                      : "Bu alan boş bırakılamaz"),
              SizedBox(
                height: 8.h,
              ),
              CustomElevatedButton(
                onPressed:
                    ref.watch(currentLoadingManager) != LoadingStates.loading
                        ? () {
                            addCreditCardFormKey.currentState!.save();
                            if (addCreditCardFormKey.currentState!.validate()) {
                              createRandomCard();
                            }
                          }
                        : null,
                inButtonText: 'Kredi Kartını Oluştur',
                primaryColor: CustomColors.primaryColor,
                inButtonTextStyle:
                    ThemeValueExtension.subtitle.copyWith(color: Colors.white),
                outBorder: const StadiumBorder(
                  side:
                      BorderSide(width: 3.0, color: CustomColors.customGreyColor),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              createdCard != null
                  ? SizedBox(
                      width: 100.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oluşturulan Kart",
                            style: ThemeValueExtension.subtitle,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CreditCardUi(
                            cardHolderFullName:
                                createdCard!.creditCardHolderName!,
                            cardNumber: createdCard!.cardNumber!,
                            validThru: createdCard!.validateDate!,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 4.h,
              ),
              createdCard != null
                  ? ref.watch(currentLoadingManager) != LoadingStates.loading
                      ? CustomElevatedButton(
                          onPressed: ref.watch(currentLoadingManager) !=
                                  LoadingStates.loading
                              ? () {
                                  ref
                                      .read(currentCreditCardWorks.notifier)
                                      .add(ref, createdCard!);
                                }
                              : null,
                          inButtonText: 'Kartı Kaydet',
                          primaryColor: CustomColors.cardColorTypeThree,
                          inButtonTextStyle: ThemeValueExtension.subtitle
                              .copyWith(color: Colors.white),
                          outBorder: const StadiumBorder(
                            side: BorderSide(
                                width: 3.0, color: CustomColors.customGreyColor),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createRandomCard() async {
    var customCardNumber = await customAlphabet('1234567890', 16);
    var creditCardId = await nanoid();
    var csv = await customAlphabet('123456789', 3);
    var lastDate = DateTime.now();
    lastDate = DateTime(lastDate.year + 10, lastDate.month, lastDate.day);
    var formattedDate = DateFormat('MM/yy').format(lastDate);
    logger.i(
        "Kart Numarası: $customCardNumber\nCsv: $csv\nFormatted Date: $formattedDate");

    createdCard = CreditCard(
        cardNumber: customCardNumber,
        creditCardHolderName:
            ComplexInherited.of(context).creditCardHolderNameController.text,
        createdAt: DateTime.now().toLocal().toString(),
        creditCardId: creditCardId,
        csv: csv,
        validateDate: formattedDate,
        amount: 0.0,
        userId: ref.read(currentBankUser)!.userId!);

    setState(() {});
  }
}
