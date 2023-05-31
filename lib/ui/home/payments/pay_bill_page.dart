import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/nanoid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/payment_model.dart';
import 'package:topkapi_bank/utilities/components/custom_elevated_button.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';

import '../../../line/view_models/app/loading_manager.dart';
import '../../../line/view_models/global_providers.dart';
import '../../../utilities/components/row_form_field.dart';
import '../../../utilities/init/theme/custom_colors.dart';
import '../../auth/customs/complex_inherited.dart';

class PayBillPage extends ConsumerStatefulWidget {
  const PayBillPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PayBillPageState();
}

class _PayBillPageState extends ConsumerState<PayBillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 4.w,
        centerTitle: false,
        title: Text("Fatura Ödeme",
            style: ThemeValueExtension.headline6
                .copyWith(color: CustomColors.primaryColor)),
      ),
      body: ComplexInherited(child: const BuildForm()),
    );
  }
}

class BuildForm extends ConsumerStatefulWidget {
  const BuildForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BuildFormState();
}

class _BuildFormState extends ConsumerState<BuildForm> {
  List<String> demoPaymentBussiniess = ['Apple', 'Netflix', 'Steam'];

  late String selectedPaymentBusiness = demoPaymentBussiniess.first;

  @override
  Widget build(BuildContext context) {
    final payBillFormKey = ComplexInherited.of(context).doPayBillFormKey;

    return Form(
      key: payBillFormKey,
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            RowFormField(
                headerName: 'Ödeme Miktarı',
                inputType: TextInputType.number,
                editingController:
                    ComplexInherited.of(context).paymentAmountController,
                custValidateFunction: (val) => val != null && val.isNotEmpty
                    ? null
                    : "Lütfen Ödeme Giriniz"),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Firma",
                    style: ThemeValueExtension.subtitle.copyWith(),
                  ),
                  DropdownButton<String>(
                    value: selectedPaymentBusiness,
                    hint: const Text('Firma Seçiniz'),
                    onChanged: (String? value) {
                      setState(() {
                        selectedPaymentBusiness = value!;
                      });
                    },
                    items: demoPaymentBussiniess.map((String paymentBusiness) {
                      return DropdownMenuItem<String>(
                        value: paymentBusiness,
                        child: Text(paymentBusiness),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              onPressed:
                  ref.watch(currentLoadingManager) != LoadingStates.loading
                      ? () {
                          payBillFormKey.currentState!.save();
                          if (payBillFormKey.currentState!.validate()) {
                            var id = nanoid();

                            final currentPayment = PaymentModel(
                                payerId: ref.read(currentBankUser)!.userId,
                                paymentDate: DateTime.now()
                                    .toLocal()
                                    .toString()
                                    .substring(0, 16),
                                paymentId: id,
                                receiverName: selectedPaymentBusiness,
                                receiverId: selectedPaymentBusiness,
                                typeOfPayment: selectedPaymentBusiness,
                                amount: int.parse(ComplexInherited.of(context)
                                    .paymentAmountController
                                    .text));
                            ref.read(currentPaymentWorks.notifier).billPayment(
                                ref,
                                ref.read(currentBankUser)!.userId!,
                                currentPayment);
                          }
                        }
                      : null,
              inButtonText: 'Ödemeyi Gerçekleştir',
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
          ],
        ),
      ),
    );
  }
}
