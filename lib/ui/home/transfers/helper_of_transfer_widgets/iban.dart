import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/async.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/eft/qr_with_send_money_manager.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/ui/auth/customs/complex_inherited.dart';
import 'package:topkapi_bank/ui/home/transfers/helper_of_transfer_widgets/qr_states/result_of_qr_content.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';

import '../../../../line/view_models/app/loading_manager.dart';
import '../../../../line/view_models/global_providers.dart';
import '../../../../models/transaction/custom_transaction.dart';
import '../../../../utilities/components/custom_elevated_button.dart';
import '../../../../utilities/components/dialogs/custom_dialogs.dart';
import '../../../../utilities/components/row_form_field.dart';
import '../../../../utilities/init/theme/custom_colors.dart';
import 'iban_states/enter_value_of_amount_iban.dart';

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
    return Consumer(
      builder: (context, customRef, child) {
        final sendMoneyState = ref.watch(currentQrSendMoneyState);
        return sendMoneyState == QrSendStates.result
            ? const ResultOfQrContent()
            : const EnterValueOfAmountIbanContent();
      },
    );
  }
}
