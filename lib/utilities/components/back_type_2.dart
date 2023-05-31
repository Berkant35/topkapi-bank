import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/utilities/components/dialogs/custom_dialogs.dart';
import 'package:topkapi_bank/utilities/components/menu/dialog_menu.dart';
import 'package:topkapi_bank/utilities/constants/app/application_constants.dart';

import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;

import '../constants/extension/context_extensions.dart';
import '../constants/extension/edge_extension.dart';
import '../init/theme/custom_colors.dart';

class BackTypeTwo extends ConsumerWidget {
  final Widget contentWidget;

  const BackTypeTwo({Key? key, required this.contentWidget}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          color: CustomColors.primaryColor,
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => CustomDialogs.areYouSureToExitApp(ref,
                            "Çıkış Yap", "Çıkış Yapmak İstediğine Emin Misin?"),
                        icon: Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: Transform.rotate(
                            angle: 3.14,
                            child: Icon(
                              Icons.exit_to_app_sharp,
                              color: Colors.white,
                              size: 3.h,
                            ),
                          ),
                        )),
                    Center(
                      child: Text(
                        ApplicationConstants.appName,
                        style: ThemeValueExtension.headline6
                            .copyWith(color: CustomColors.backgroundColor),
                      ),
                    ),
                    IconButton(
                        onPressed: () => _showDialog(context),
                        icon: Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 3.h,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 100.w,
            height: 75.h,
            decoration: BoxDecoration(
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(EdgeExtension.hugeEdge.edgeValue))),
            child: Padding(
              padding: EdgeInsets.only(top: EdgeExtension.highEdge.edgeValue),
              child: contentWidget,
            ),
          ),
        )
      ],
    );
  }

  void _showDialog(BuildContext context) {
    slideDialog.showSlideDialog(
      context: context,
      child: const DialogMenu(),
      barrierColor: Colors.white.withOpacity(0.7),
      pillColor: CustomColors.primaryColor,
      backgroundColor: Colors.white,
    );
  }
}
