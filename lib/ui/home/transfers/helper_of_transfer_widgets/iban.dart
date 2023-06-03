import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/ui/auth/customs/complex_inherited.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';

import '../../../../line/view_models/app/loading_manager.dart';
import '../../../../line/view_models/global_providers.dart';
import '../../../../utilities/components/custom_elevated_button.dart';
import '../../../../utilities/components/row_form_field.dart';
import '../../../../utilities/init/theme/custom_colors.dart';

class IbanPage extends ConsumerStatefulWidget {
  const IbanPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _IbanPageState();
}

class _IbanPageState extends ConsumerState<IbanPage> {
  @override
  Widget build(BuildContext context) {
    final ibanFormKey = ComplexInherited.of(context).ibanFormKey;
    return Form(
        key: ibanFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RowFormField(
                    headerName: "Miktar",
                    editingController:
                    ComplexInherited.of(context).sendMoneyWithIbanAmountController,
                    custValidateFunction: (val) =>
                    val != null && val.isNotEmpty ? null : "Boş Bırakılamaz"),
                ibanInput(context),
                RowFormField(
                    headerName: "Gönderici Adı Ve Soyadı",
                    editingController:
                        ComplexInherited.of(context).sendIbanNumberController,
                    custValidateFunction: (val) =>
                        val != null && val.isNotEmpty ? null : "Boş Bırakılamaz"),
                RowFormField(
                    headerName: "Açıklama",
                    maxLines: 5,
                    editingController:
                        ComplexInherited.of(context).sendIbanExplainController,
                    custValidateFunction: (val) =>
                        val != null && val.isNotEmpty ? null : "Boş Bırakılamaz"),
                SizedBox(
                  height: 4.h,
                ),
                CustomElevatedButton(
                  onPressed:
                      ref.watch(currentLoadingManager) != LoadingStates.loading
                          ? () {
                              ibanFormKey.currentState!.save();
                              if (ibanFormKey.currentState!.validate()) {

                              }
                            }
                          : null,
                  inButtonText: 'Gönder',
                  primaryColor: CustomColors.primaryColor,
                  inButtonTextStyle:
                      ThemeValueExtension.subtitle.copyWith(color: Colors.white),
                  outBorder: const StadiumBorder(
                    side: BorderSide(
                        width: 3.0, color: CustomColors.customGreyColor),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Row ibanInput(BuildContext context) {
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
                final isNumber = int.tryParse(val!);

                if (val.isNotEmpty && val.length == 24 && isNumber != null) {
                  return null;
                } else if (isNumber == null) {
                  return "Iban yazı karakteri içeremez";
                } else {
                  return "Geçersiz Iban";
                }
              }),
        ),
      ],
    );
  }
}
