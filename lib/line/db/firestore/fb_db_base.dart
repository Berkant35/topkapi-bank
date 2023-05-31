part of 'fb_db_manager.dart';


abstract class FirebaseDbBase {


  FirebaseDbBase();
  final FirebaseFirestore dbBase = FirebaseFirestore.instance;



  Future<dynamic> readUser(String userID);

  Future<bool> saveUser(BankUser bankUser);

  Future<bool> billPayment(String userId,PaymentModel? paymentModel);

}
