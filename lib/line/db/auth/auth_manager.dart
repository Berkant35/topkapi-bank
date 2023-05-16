
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'auth_service.dart';

abstract class AuthManager {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      String email, String password);

  Future<dynamic> currentUser();

  Future<bool> signOut();

  Future<dynamic> signIn(String email, String password);

  Future<void> forgotPassword(String email);

  Future<void> updatePassword(String currentPassword,String newPassword);


  Future<bool> updateEmail(String email,String password);

  Future<bool> deleteUser(String rootUserID);
}
