import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/ui/auth/customs/complex_inherited.dart';
import 'package:topkapi_bank/utilities/constants/extension/context_extensions.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_constants.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_service.dart';

import '../../init/theme/custom_colors.dart';

class DialogMenu extends ConsumerStatefulWidget {
  const DialogMenu({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DialogMenuState();
}

class _DialogMenuState extends ConsumerState<DialogMenu> {
  @override
  Widget build(BuildContext context) {
    return ComplexInherited(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(6.w),
            child: Text(
              "İşlem Menü",
              style: ThemeValueExtension.headline6.copyWith(
                  color: CustomColors.customGreyColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          perMenuItem("Fatura Ödeme", NavigationConstants.payBillPage,Icons.payment),
          perMenuItem("Kart Ekle", NavigationConstants.payBillPage,Icons.credit_card),

        ],
      ),
    );
  }

  Widget perMenuItem(String content, String path, IconData iconData) {
    return GestureDetector(
      onTap: () => NavigationService.instance.navigateToPage(path: path),
      child: SizedBox(
        height: 8.h,
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(flex: 1),
                Expanded(
                    flex: 8,
                    child: Padding(
                      padding:  EdgeInsets.only(right: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            content,
                            style: ThemeValueExtension.subtitle
                                .copyWith(color: CustomColors.primaryColor),
                          ),
                          Icon(
                            iconData,
                            size: 2.h,
                            color: CustomColors.primaryColor,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 8,
                    child: Divider(
                      color: CustomColors.cardColorTypeOne,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
