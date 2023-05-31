import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:topkapi_bank/line/db/firestore/fb_db_manager.dart';
import 'package:topkapi_bank/line/view_models/app/loading_manager.dart';
import 'package:topkapi_bank/line/view_models/global_providers.dart';
import 'package:topkapi_bank/models/card/credit_card.dart';
import 'package:topkapi_bank/utilities/components/dialogs/custom_dialogs.dart';

import '../../../main.dart';

class CreditCardManagerNotifier extends StateNotifier<bool> {
  CreditCardManagerNotifier(bool state) : super(false);
  final _dbWorks = FirebaseDbManager();

  void create() {}

  Future<List<CreditCard?>> getCardList(WidgetRef ref, String userId) async {
    try {
      return await _dbWorks.getCards(userId);
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  void update() {}

  Future<void> add(WidgetRef ref, CreditCard creditCard) async {
    ref.read(currentLoadingManager.notifier).changeState(LoadingStates.loading);
    final result = await _dbWorks.createCreditCard(creditCard);
    if (result) {
      CustomDialogs.successTitleAndOk(ref, ref.read(currentBankUser)!.userId!,
          "Başarılı", "Yeni kartınız başarılı bir şekilde oluşturuldu");
    }
    ref.read(currentLoadingManager.notifier).changeState(LoadingStates.idle);
  }

  void delete() {}
}
