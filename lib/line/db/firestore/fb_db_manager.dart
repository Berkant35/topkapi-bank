import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';
import 'package:topkapi_bank/models/payment_model.dart';

part 'fb_db_base.dart';

class FirebaseDbManager extends FirebaseDbBase {
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

  Future<List<PaymentModel?>> getPayments(String userId) async {
    try {
      List<PaymentModel?> payments = [];

      final documents = await dbBase.collection("payments").get();

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
}
