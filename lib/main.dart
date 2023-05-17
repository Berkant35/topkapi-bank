import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/ui/auth/register_page.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_route.dart';
import 'package:topkapi_bank/utilities/init/navigation/navigation_service.dart';
import 'package:topkapi_bank/utilities/init/theme/custom_colors.dart';

import 'firebase_options.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: TopkapiBankSystem()));


}

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
        home: const RegisterPage(),
      );
    });
  }
}
