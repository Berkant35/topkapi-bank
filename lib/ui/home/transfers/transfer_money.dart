import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/ui/home/transfers/helper_of_transfer_widgets/iban.dart';
import 'package:topkapi_bank/ui/home/transfers/helper_of_transfer_widgets/qr.dart';
import 'package:topkapi_bank/utilities/constants/extension/widget_extension.dart';

import '../../../utilities/constants/extension/context_extensions.dart';
import '../../../utilities/init/theme/custom_colors.dart';

class TransferMoney extends ConsumerStatefulWidget {
  const TransferMoney({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends ConsumerState<TransferMoney>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: ref.read(currentSendMoneyTabManagerIndex));
    tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      resizeToAvoidBottomInset: false,
      body: TabBarView(
          controller: tabController, children: const [IbanPage(), QrPage()]),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 10.h,
      elevation: 0,
      title: Text("Para Gönder",
          style: ThemeValueExtension.headline6
              .copyWith(color: CustomColors.primaryColor)),
      centerTitle: false,
      bottom: PreferredSize(
          preferredSize:  Size.fromHeight(2.h),
          child: SizedBox(
            child: TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    'IBAN ile Gönder',
                    style: ThemeValueExtension.subtitle,
                  ),
                ),
                Tab(
                  child: Text('QR ile Gönder',
                    style: ThemeValueExtension.subtitle,),
                )
              ],
            ),
          )),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  void _handleTabSelection() {
    ref
        .read(currentSendMoneyTabManagerIndex.notifier)
        .changState(tabController.index);
  }
}
