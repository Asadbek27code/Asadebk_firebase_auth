import 'package:asadbek_firebase_auth/services/util_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  //createUser

  static Future<User?> registerUser(BuildContext context, {required String name, required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user?.updateDisplayName(name);
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } catch (e) {
      Utils.fireSnackBar("$e", context);
      return null;
    }
  }

  // loginUser

  static Future<User?> loginUser(BuildContext context, {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } catch (e) {
      Utils.fireSnackBar("$e", context);
      return null;
    }
  }

  //deletUser

  static Future<void> deleteUser() async {
    await auth.currentUser?.delete();
  }

  //logOut

  static Future<void> logOut() async {
    await auth.signOut();
  }
}
