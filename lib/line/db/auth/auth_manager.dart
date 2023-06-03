
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/nanoid.dart';
import 'package:topkapi_bank/line/db/firestore/fb_storage_manager.dart';
import 'package:topkapi_bank/main.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';
import 'package:topkapi_bank/utilities/constants/exceptions/firebase_exceptions.dart';

import '../firestore/fb_db_manager.dart';

part 'auth_service.dart';

abstract class AuthManager {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _storageBase = FirebaseStorageManager();
  final dbbManager = FirebaseDbManager();

  Future<BankUser?> createUserWithEmailAndPassword(
      WidgetRef ref,String email, String password,String userName);

  Future<dynamic> currentUser();

  Future<bool> signOut(WidgetRef ref);

  Future<dynamic> signIn(WidgetRef ref,String email, String password);

  Future<void> forgotPassword(WidgetRef ref,String email);

  Future<void> updatePassword(WidgetRef ref,String currentPassword,String newPassword);


  Future<bool> updateEmail(WidgetRef ref,String email,String password);

  Future<bool> deleteUser(WidgetRef ref,String rootUserID);
}
