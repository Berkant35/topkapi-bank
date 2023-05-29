import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/auth/base_auth_control.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_constants.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_service.dart';

import '../../line/view_models/global_providers.dart';
import '../../utilities/components/back_type_1.dart';
import '../../utilities/components/custom_elevated_button.dart';
import '../../utilities/components/row_form_field.dart';
import '../../utilities/constants/app/enums.dart';
import '../../utilities/constants/extension/context_extensions.dart';
import '../../utilities/init/theme/custom_colors.dart';
import 'customs/complex_inherited.dart';



class LoginFormBody extends ConsumerWidget {
  const LoginFormBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Giriş Yap",
                style: ThemeValueExtension.headline6
                    .copyWith(color: CustomColors.primaryColor)),
            SizedBox(
              height: 2.h,
            ),
            RowFormField(
                headerName: "E-posta",
                hintText: "Mail",
                editingController:
                    ComplexInherited.of(context).loginEmailController,
                custValidateFunction: null),
            RowFormField(
                headerName: "Şifre",
                hintText: "Şifre",
                visibleStatus: true,
                editingController:
                    ComplexInherited.of(context).loginPasswordController,
                custValidateFunction: null),
            SizedBox(
              height: 4.h,
            ),
            ref.watch(currentLoadingManager) != LoadingStates.loading
                ? Column(
                    children: [
                      CustomElevatedButton(
                        onPressed: ref.watch(currentLoadingManager) !=
                                LoadingStates.loading
                            ? () {
                                loginFormKey.currentState!.save();
                                if (loginFormKey.currentState!.validate()) {
                                  ref.read(currentBankUser.notifier).signIn(
                                      ref,
                                      ComplexInherited.of(context)
                                          .loginEmailController
                                          .text,
                                      ComplexInherited.of(context)
                                          .loginPasswordController
                                          .text);
                                }
                              }
                            : null,
                        inButtonText: 'Giriş Yap',
                        primaryColor: CustomColors.primaryColor,
                        inButtonTextStyle: ThemeValueExtension.subtitle
                            .copyWith(color: Colors.white),
                        outBorder: const StadiumBorder(
                          side: BorderSide(
                              width: 3.0, color: CustomColors.customGreyColor),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomElevatedButton(
                        onPressed: ref.watch(currentLoadingManager) !=
                                LoadingStates.loading
                            ? () => ref.read(currentBaseAuth.notifier).changeState(BaseAuthPageType.register)
                            : null,
                        inButtonText: 'Hesap Oluştur',
                        primaryColor: Colors.white10,
                        inButtonTextStyle: ThemeValueExtension.subtitle
                            .copyWith(color: CustomColors.primaryColor),
                        outBorder: const StadiumBorder(
                          side: BorderSide(
                              width: 3.0, color: CustomColors.customGreyColor),
                        ),
                      ),
                    ],
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
