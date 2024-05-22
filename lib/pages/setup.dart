import 'package:asadbek_firebase_auth/firebase_options.dart';
import 'package:asadbek_firebase_auth/services/sheared_preferens_servoce..dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences db;
late StorageService service;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  db = await SharedPreferences.getInstance();

  // Initialize StorageService with SharedPreferences instance
  service = StorageService(db: db);
  //Firebase
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
//1//0cMWlyncFY-9dCgYIARAAGAwSNwF-L9IrxzzvvH19cQ4-St3ZbtoRnPu3JbT8EIE4a7aDH42XooKNbuVxi-VuippJf4LIic_oV4o