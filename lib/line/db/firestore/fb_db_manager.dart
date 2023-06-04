import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';
import 'package:topkapi_bank/models/card/credit_card.dart';
import 'package:topkapi_bank/models/payment_model.dart';
import 'package:topkapi_bank/models/transaction/custom_transaction.dart';

part 'fb_db_base.dart';

class FirebaseDbManager extends FirebaseDbBase implements TransactionBase {
  @override
  Future<BankUser?> readUser(String userID) async {
    try {
      final bankMapData = await dbBase.collection("users").doc(userID).get();

      final bankUser = bankMapData.data() != null
          ? BankUser.fromJson(bankMapData.data()!)
          : null;
      return bankUser;
    } catch (e) {
      logger.e("Save User: ${e.toString()}");
      return null;
    }
  }

  @override
  Future<bool> saveUser(BankUser bankUser) async {
    try {
      await dbBase
          .collection("users")
          .doc(bankUser.userId)
          .set(bankUser.toJson());
      return true;
    } catch (e) {
      logger.e("Save User: ${e.toString()}");
      return false;
    }
  }

  @override
  Future<bool> billPayment(String userId, PaymentModel? paymentModel) async {
    try {
      await dbBase
          .collection("payments")
          .doc(paymentModel!.paymentId)
          .set(paymentModel.toJson());
      return true;
    } catch (e) {
      logger.e("Payment Failed: ${e.toString()}");
      return false;
    }
  }

  Future<bool> createCreditCard(CreditCard creditCard) async {
    try {
      await dbBase
          .collection("cards")
          .doc(creditCard.creditCardId)
          .set(creditCard.toJson());
      return true;
    } catch (e) {
      logger.e("createCreditCard Failed: ${e.toString()}");
      return false;
    }
  }

  Future<List<CreditCard?>> getCards(String userId) async {
    try {
      List<CreditCard?> cards = [];

      final documents = await dbBase
          .collection("cards")
          .where('userId', isEqualTo: userId)
          .get();

      for (var perDoc in documents.docs) {
        final card = CreditCard.fromJson(perDoc.data());
        logger.i("Per Payment:${card.toJson()}");
        cards.add(card);
      }

      cards.sort((a, b) => b!.createdAt!.compareTo(a!.createdAt!));

      return cards;
    } catch (e) {
      logger.e("Payment Failed: ${e.toString()}");
      return [];
    }
  }

  Future<List<PaymentModel?>> getPayments(String userId) async {
    try {
      List<PaymentModel?> payments = [];

      final documents = await dbBase
          .collection("payments")
          .where('payerId', isEqualTo: userId)
          .get();

      for (var perDoc in documents.docs) {
        final payment = PaymentModel.fromJson(perDoc.data());
        logger.i("Per Payment:${payment.toJson()}");
        payments.add(payment);
      }

      payments.sort((a, b) => b!.paymentDate!.compareTo(a!.paymentDate!));

      return payments;
    } catch (e) {
      logger.e("Payment Failed: ${e.toString()}");
      return [];
    }
  }

  @override
  Future<bool> anyHasUserWithThisIban(String iban) async {
    try {
      final documents =
          await dbBase.collection("users").where('iban', isEqualTo: iban).get();
      return documents.docs.isNotEmpty;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  @override
  Future<BankUser?> getBankUserWithIban(String iban) async {
    try {
      final document =
          await dbBase.collection("users").where('iban', isEqualTo: iban).get();
      final bankUser = document.docs.isNotEmpty
          ? BankUser.fromJson(document.docs.first.data())
          : null;
      return bankUser;
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }

  @override
  Future<bool?> doTransaction(
    CustomTransaction transaction,
  ) async {
    try {

      final futureList = <Future>[
        dbBase
            .collection("transactions")
            .doc(transaction.transactionId)
            .set(transaction.toJson()),
        dbBase
            .collection('users')
            .doc(transaction.senderId)
            .update({"balance": FieldValue.increment(-transaction.amount!)}),
        dbBase
            .collection('users')
            .doc(transaction.receiverId)
            .update({"balance": FieldValue.increment(transaction.amount!)})
      ];

      await Future.wait(futureList);

      return true;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
