import 'package:asadbek_firebase_auth/pages/hemo_page.dart';
import 'package:asadbek_firebase_auth/pages/register_page.dart';
import 'package:asadbek_firebase_auth/pages/setup.dart';
import 'package:flutter/material.dart';

String? uid;
void main(List<String> args) async {
  await setup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    uid = service.read("uid");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: uid != null ? const Home() : const RegisterPage(),
      // highContrastDarkTheme: ,
      // home:
    );
  }
}
