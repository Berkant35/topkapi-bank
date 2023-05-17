import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:topkapi_bank/ui/auth/customs/complex_inherited.dart';
import 'package:topkapi_bank/utilities/components/back_type_1.dart';
import 'package:topkapi_bank/utilities/components/custom_elevated_button.dart';
import 'package:topkapi_bank/utilities/components/row_form_field.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';
import 'package:topkapi_bank/utilities/init/theme/custom_colors.dart';


class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackTypeOne(
        contentWidget: ComplexInherited(
            child: const RegisterFormBody()
        ),
      ),
    );
  }
}


class RegisterFormBody extends StatelessWidget {
  const RegisterFormBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hesap Oluştur",style: ThemeValueExtension.headline6.copyWith(
            color: CustomColors.primaryColor
          )),
          SizedBox(height: 2.h,),
          RowFormField(
              headerName: "Kullanıcı Adı",
              hintText: "Ad",
              editingController: ComplexInherited.of(context).userNameController,
              custValidateFunction: null),
          RowFormField(
              headerName: "E-posta",
              hintText: "Mail",
              editingController: ComplexInherited.of(context).emailController,
              custValidateFunction: null),
          RowFormField(
              headerName: "Şifre",
              hintText: "Şifre",
              editingController: ComplexInherited.of(context).passwordController,
              custValidateFunction: null),
          SizedBox(height: 15.h,),
          CustomElevatedButton(
            onPressed: (){},
            inButtonText: 'Hesap Oluştur',
            primaryColor: Colors.white10,
            inButtonTextStyle: ThemeValueExtension.subtitle.copyWith(
              color: CustomColors.primaryColor
            ),
            outBorder: const StadiumBorder(side: BorderSide(width: 3.0, color: CustomColors.customGreyColor),),
          ),
          SizedBox(height: 4.h,),
          Center(child: Text("© TopkapiBank",style: ThemeValueExtension.subtitle2.copyWith(
            color: CustomColors.primaryColor
          )))
        ],
      ),
    );
  }
}