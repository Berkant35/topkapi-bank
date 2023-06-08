import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';
import 'package:topkapi_bank/utilities/components/back_type_2.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});
  @override
  ConsumerState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var read = ref.read(currentBankUser);
    return BackTypeTwo(
        contentWidget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _nameAndSurname(read, context),
        _balance(read, context),
        _ibanAndCopy(read),
        _ibanQR(read)
      ],
    ));
  }

  Padding _ibanQR(BankUser? read) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Image.network(
        read?.qrLink ?? "",
        width: 80.w,
      ),
    );
  }

  Padding _ibanAndCopy(BankUser? read) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      child: Container(
        width: 90.w,
        height: 05.h,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 200, 200),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'IBAN: ${read?.iban}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.content_copy),
            color: Colors.black,
            onPressed: () {
              FlutterClipboard.copy(read?.iban ?? "");
            },
          ),
        ]),
      ),
    );
  }

  Padding _balance(BankUser? read, BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.w, top: 1.h),
        child: Text(
          "Toplam bakiye: ${read?.balance} TL",
          style: context.textTheme.bodyLarge,
        ));
  }

  Padding _nameAndSurname(BankUser? read, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h),
      child: Text(
        "${read?.userName} ${read?.surName}",
        style: context.textTheme.headlineSmall,
      ),
    );
  }
}
