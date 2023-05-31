part of 'auth_manager.dart';

class AuthService extends AuthManager {
  @override
  Future<BankUser?> createUserWithEmailAndPassword(
      WidgetRef ref, String email, String password, String userName) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final ibanNo = customAlphabet('0123456789', 24);

      logger.i("Iban No: $ibanNo");

      final createBankUser = BankUser(
          userId: credential.user!.uid,
          userName: userName,
          email: email,
          iban: 'TR$ibanNo');

      final result = await dbbManager.saveUser(createBankUser);

      return result ? createBankUser : null;
    } catch (e) {
      logger.e("Firebase Exception ${e.toString()}");
    }
    return null;
  }

  @override
  Future<BankUser?> currentUser() async {
    try {
      User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        return await dbbManager.readUser(currentUser.uid);
      }
      return null;
    } catch (e) {
      logger.e("Firebase Exception ${e.toString()}");
    }
    return null;
  }

  @override
  Future<bool> deleteUser(WidgetRef ref, String rootUserID) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(WidgetRef ref, String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<BankUser?> signIn(WidgetRef ref, String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return await dbbManager.readUser(credential.user!.uid);
      }
    } catch (e) {
      FirebaseExceptions.handleFirebaseException(e.toString(), ref);
    }
    return null;
  }

  @override
  Future<bool> signOut(WidgetRef ref) async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      FirebaseExceptions.handleFirebaseException(e.toString(), ref);
      return false;
    }
  }

  @override
  Future<bool> updateEmail(WidgetRef ref, String email, String password) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(
      WidgetRef ref, String currentPassword, String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
