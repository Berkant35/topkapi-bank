import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';


part 'fb_db_base.dart';

class FirebaseDbManager extends FirebaseDbBase {


  @override
  Future<BankUser?> readUser(String userID) async {
    try{
      final bankMapData =  await dbBase.collection("users").doc(userID).get();

      final bankUser = bankMapData.data() != null ? BankUser.fromJson(bankMapData.data()!) : null;
      return bankUser;
    }catch(e){
      logger.e("Save User: ${e.toString()}");
      return null;
    }
  }

  @override
  Future<bool> saveUser(BankUser bankUser) async {
     try{
       await dbBase.collection("users").doc(bankUser.userId).set(bankUser.toJson());
       return true;
     }catch(e){
       logger.e("Save User: ${e.toString()}");
       return false;
     }
  }

}
