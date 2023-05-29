import 'package:flutter/material.dart';
import 'package:topkapi_bank/ui/auth/base_auth.dart';
import 'package:topkapi_bank/ui/auth/register_page.dart';
import 'package:topkapi_bank/ui/home/home_page.dart';

import '../../../ui/help/not_found.dart';
import 'navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.registerPage:
        return normalNavigate(const BaseAuth());
      case NavigationConstants.homePage:
        return normalNavigate(const HomePage());
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
