part of 'fb_db_manager.dart';


abstract class FirebaseDbBase {


  FirebaseDbBase();
  final FirebaseFirestore dbBase = FirebaseFirestore.instance;



  Future<dynamic> readUser(String userID);

  Future<bool> saveUser(BankUser bankUser);

  Future<bool> billPayment(String userId,PaymentModel? paymentModel);

  Future<bool> anyHasUserWithThisIban(String iban);

  Future<BankUser?> getBankUserWithIban(String iban);


}

abstract class TransactionBase {

  Future<bool?> doTransaction(CustomTransaction transaction);

}
