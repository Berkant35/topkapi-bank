part of 'auth_manager.dart';

class AuthService extends AuthManager {

  @override
  Future<User?> createUserWithEmailAndPassword(String email, String password,String userName) async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      logger.e("Firebase Exception ${e.toString()}");
    }
    return null;
  }

  @override
  Future currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUser(String rootUserID) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> updateEmail(String email, String password) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(String currentPassword, String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }



}
