import 'package:flutter/material.dart';
import 'package:topkapi_bank/ui/auth/register_page.dart';
import 'package:topkapi_bank/ui/home/home_page.dart';
import 'package:topkapi_bank/ui/payments_page.dart';

import '../utilities/constants/app/application_constants.dart';

class CustomNavigationBarX extends StatefulWidget {
  const CustomNavigationBarX({super.key});
  @override
  State<CustomNavigationBarX> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBarX> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const PaymentsPage(),
      const HomePage(),
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.black,
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: MenuStrings.mainPage,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.payment),
            icon: Icon(Icons.payment_outlined),
            label: MenuStrings.payments,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.menu),
            icon: Icon(Icons.menu_outlined),
            label: MenuStrings.menu,
          ),
        ],
      ),
      body: [
        const HomePage(),
        const PaymentsPage(),
        const RegisterPage()
      ][selectedPageIndex],
    );
  }
}
