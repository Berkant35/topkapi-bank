import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/ui/auth/base_auth.dart';
import 'package:topkapi_bank/ui/home/home_page.dart';

import '../navigation_page.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  bool isWaiting = true;

  @override
  void initState() {
    super.initState();
    setCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return !isWaiting
        ? Consumer(
            builder: (context, customRef, child) {
              return customRef.read(currentBankUser) != null
                  ? const CustomNavigationBarX()
                  : const BaseAuth();
            },
          )
        : Container(
            color: Colors.white,
            width: 100.w,
            height: 100.h,
            child: const CircularProgressIndicator.adaptive(),
          );
  }

  Future<void> setCurrentUser() async {
    ref.read(currentBankUser.notifier).currentUser(ref);
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      isWaiting = false;
      setState(() {});
    });
  }
}
