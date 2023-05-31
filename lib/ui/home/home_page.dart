import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/models/payment_model.dart';
import 'package:topkapi_bank/utilities/components/back_type_2.dart';
import 'package:topkapi_bank/utilities/constants/app/application_constants.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../../models/credit_card_model.dart';
import '../../models/transactions_model.dart';
import '../../utilities/constants/extension/context_extensions.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<State> _sliderKey = GlobalKey();



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

  SizedBox _transactions() {
    return SizedBox(
        height: 32.h,
        width: 90.h,
        child: FutureBuilder<List<PaymentModel?>>(
          future: ref
              .read(currentPaymentWorks.notifier)
              .getPaymentList(ref, ref.read(currentBankUser)!.userId!),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<PaymentModel?>? listOfPayment = snapshot.data;

            return snapshot.connectionState == ConnectionState.done && listOfPayment != null
                ? ListView.builder(
                    itemCount: listOfPayment.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: 4.w, left: 4.w, right: 4.w),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/image/${listOfPayment[index]!.typeOfPayment!.toLowerCase()}_logo.png"),
                            radius: 25,
                            backgroundColor: Colors.transparent,
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text(
                              listOfPayment[index]!.typeOfPayment!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          trailing: Text(
                            "${listOfPayment[index]!.amount} TL",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          },
        ));
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
              padding: EdgeInsets.only(right: 4.w, bottom: 3.h),
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
