import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:topkapi_bank/line/view_models/eft/qr_with_send_money_manager.dart';
import 'package:topkapi_bank/utilities/components/custom_elevated_button.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_constants.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_service.dart';
import 'package:topkapi_bank/utilities/init/theme/custom_colors.dart';

import '../../../../../line/view_models/app/loading_manager.dart';
import '../../../../../line/view_models/global_providers.dart';
import '../../../../../utilities/constants/app/assets.dart';

class ResultOfQrContent extends ConsumerStatefulWidget {
  const ResultOfQrContent({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ResultOfQrContentState();
}

class _ResultOfQrContentState extends ConsumerState<ResultOfQrContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Lottie.asset(Assets.successLottie, repeat: false),
        Text(
          "İşleminiz Başarılı Bir Şekilde Gerçekleştirildi",
          textAlign: TextAlign.center,
          style: ThemeValueExtension.subtitle
              .copyWith(color: CustomColors.primaryColor),
        ),
        CustomElevatedButton(
          onPressed: () {
            NavigationService.instance
                .navigateToPageClear(path: NavigationConstants.homePage);
            ref
                .read(currentQrSendMoneyState.notifier)
                .changState(QrSendStates.search);
          },
          inButtonText: 'Tamam',
          primaryColor: CustomColors.primaryColor,
          inButtonTextStyle:
              ThemeValueExtension.subtitle.copyWith(color: Colors.white),
          outBorder: const StadiumBorder(
            side: BorderSide(width: 3.0, color: CustomColors.customGreyColor),
          ),
        ),
      ],
    );
  }
}
