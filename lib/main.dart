import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/ui/onboard/landing_page.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_route.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_service.dart';
import 'package:topkapi_bank/utilities/init/theme/custom_colors.dart';

void main() => runApp(const TopkapiBankSystem());

class TopkapiBankSystem extends StatelessWidget {
  const TopkapiBankSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Topkapı Bank',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
        theme: Theme.of(context).copyWith(
            primaryColor: CustomColors.primaryColor,
            secondaryHeaderColor: CustomColors.secondaryColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: CustomColors.primaryColor
            ),
            scaffoldBackgroundColor: Colors.white
        ),
        home: const LandingPage(),
      );
    });
  }
}
