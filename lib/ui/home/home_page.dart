import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/utilities/components/back_type_2.dart';
import 'package:topkapi_bank/utilities/components/main_navigation_bar.dart';
import 'package:topkapi_bank/utilities/constants/app/application_constants.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../../models/credit_card_model.dart';
import '../../models/transactions_model.dart';
import '../../utilities/constants/extension/context_extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<State> _sliderKey = GlobalKey();

  List<TransactionModel> transactions = [
    TransactionModel("assets/image/apple_logo.png", "Apple", 7999.99),
    TransactionModel("assets/image/netflix_logo.jpeg", "Netflix", 139.49),
    TransactionModel("assets/image/steam_logo.png", "Steam", 499.80),
  ];

  List<CreditCardWidget> creditCards = [
    CreditCardWidget(
        cardNumber: '5434567890123456',
        cardHolderName: "Mucahit",
        cvv: "3213",
        expiryDate: "213213"),
    CreditCardWidget(
        cardNumber: '1234567890123456',
        cardHolderName: "Yusuf",
        cvv: "4324",
        expiryDate: "213213"),
  ];

  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: BackTypeTwo(
            contentWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardsText(context),
            _cardUI(),
            _transactionsText(context),
            _transactions(),
          ],
        )));
  }

  NavigationBar _navigationBar() {
    return NavigationBar(

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
    );
  }

  SizedBox _transactions() {
    return SizedBox(
      height: 32.h,
      width: 90.h,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 4.w, left: 4.w, right: 4.w),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(transactions[index].imagePath),
                  radius: 25,
                  backgroundColor: Colors.transparent,
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    transactions[index].name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                trailing: Text(
                  "${transactions[index].price} TL",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            );
          }),
    );
  }

  Padding _cardsText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.paddingNormal.left),
      child: Text(
        HomePageStrings.cards,
        style: ThemeValueExtension.headline6,
      ),
    );
  }

  SizedBox _cardUI() {
    return SizedBox(
      height: 27.h,
      child: CarouselSlider.builder(
          slideIndicator: CircularSlideIndicator(),
          key: _sliderKey,
          viewportFraction: 0.9,
          slideBuilder: (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 30),
              child: CreditCardUi(
                cardHolderFullName: creditCards[index].cardHolderName,
                cardNumber: creditCards[index].cardNumber,
                validThru: creditCards[index].expiryDate,
              ),
            );
          },
          itemCount: creditCards.length),
    );
  }

  Padding _transactionsText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: context.paddingNormal.left, top: 02.h),
        child: Text(
          HomePageStrings.transactions,
          style: ThemeValueExtension.headline6,
        ));
  }
}
