import 'package:flutter/material.dart';
import 'package:topkapi_bank/ui/auth/base_auth.dart';
import 'package:topkapi_bank/ui/auth/register_page.dart';
import 'package:topkapi_bank/ui/home/credit_card/add_credit_card.dart';
import 'package:topkapi_bank/ui/home/home_page.dart';
import 'package:topkapi_bank/ui/payments_page.dart';

import '../../../ui/help/not_found.dart';
import '../../../ui/home/payments/pay_bill_page.dart';
import '../../../ui/home/transfers/transfer_money.dart';
import '../../../ui/navigation_page.dart';
import 'navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.baseAuthPage:
        return normalNavigate(const BaseAuth());
      case NavigationConstants.homePage:
        return normalNavigate(const CustomNavigationBarX());
      case NavigationConstants.payBillPage:
        return normalNavigate(const PayBillPage());
      case NavigationConstants.addCreditCardPage:
        return normalNavigate(const AddCreditCard());
      case NavigationConstants.transferMoneyPage:
        return normalNavigate(const TransferMoney());
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
