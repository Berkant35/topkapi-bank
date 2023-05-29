import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/ui/auth/register_page.dart';

import '../../line/view_models/auth/base_auth_control.dart';
import '../../utilities/components/back_type_1.dart';
import 'customs/complex_inherited.dart';
import 'login_page.dart';

class BaseAuth extends ConsumerStatefulWidget {
  const BaseAuth({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BaseAuthState();
}

class _BaseAuthState extends ConsumerState<BaseAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackTypeOne(
        contentWidget: Consumer(
          builder: (context, customRef, child) {
            final baseAuthType = customRef.watch(currentBaseAuth);

            switch (baseAuthType) {
              case BaseAuthPageType.register:
                return ComplexInherited(child: const RegisterFormBody());
              case BaseAuthPageType.login:
                return ComplexInherited(child: const LoginFormBody());
              case BaseAuthPageType.forgotPassword:
                return ComplexInherited(child: const RegisterFormBody());
            }
          },
        ),
      ),
    );
  }
}
