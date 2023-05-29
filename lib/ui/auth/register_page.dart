import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/line/view_models/auth/base_auth_control.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';

import 'package:topkapi_bank/ui/auth/customs/complex_inherited.dart';
import 'package:topkapi_bank/utilities/components/back_type_1.dart';
import 'package:topkapi_bank/utilities/components/custom_elevated_button.dart';
import 'package:topkapi_bank/utilities/components/row_form_field.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';
import 'package:topkapi_bank/utilities/init/theme/custom_colors.dart';

class RegisterFormBody extends ConsumerWidget {
  const RegisterFormBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ComplexInherited.of(context).formKey;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hesap Oluştur",
                    style: ThemeValueExtension.headline6
                        .copyWith(color: CustomColors.primaryColor)),
                IconButton(
                    onPressed: () => ref
                        .read(currentBaseAuth.notifier)
                        .changeState(BaseAuthPageType.login),
                    icon: const Icon(Icons.cancel_outlined))
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            RowFormField(
                headerName: "Kullanıcı Adı",
                hintText: "Ad",
                editingController:
                    ComplexInherited.of(context).userNameController,
                custValidateFunction: null),
            RowFormField(
                headerName: "E-posta",
                hintText: "Mail",
                editingController: ComplexInherited.of(context).emailController,
                custValidateFunction: null),
            RowFormField(
                headerName: "Şifre",
                hintText: "Şifre",
                visibleStatus: true,
                editingController:
                    ComplexInherited.of(context).passwordController,
                custValidateFunction: null),
            SizedBox(
              height: 4.h,
            ),
            ref.watch(currentLoadingManager) != LoadingStates.loading
                ? CustomElevatedButton(
                    onPressed: ref.watch(currentLoadingManager) !=
                            LoadingStates.loading
                        ? () {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              ref
                                  .read(currentBankUser.notifier)
                                  .createUserWithEmailAndPassword(
                                    ref,
                                    ComplexInherited.of(context)
                                        .emailController
                                        .text,
                                    ComplexInherited.of(context)
                                        .passwordController
                                        .text,
                                    ComplexInherited.of(context)
                                        .userNameController
                                        .text,
                                  );
                            }
                          }
                        : null,
                    //şifre: topkapibank1234
                    inButtonText: 'Hesap Oluştur',
                    primaryColor: Colors.white10,
                    inButtonTextStyle: ThemeValueExtension.subtitle
                        .copyWith(color: CustomColors.primaryColor),
                    outBorder: const StadiumBorder(
                      side: BorderSide(
                          width: 3.0, color: CustomColors.customGreyColor),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
            SizedBox(
              height: 4.h,
            ),
            Center(
                child: Text("© Topkapi Bank",
                    style: ThemeValueExtension.subtitle2
                        .copyWith(color: CustomColors.primaryColor)))
          ],
        ),
      ),
    );
  }
}
