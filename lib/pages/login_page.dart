import 'package:asadbek_firebase_auth/pages/hemo_page.dart';
import 'package:asadbek_firebase_auth/pages/register_page.dart';
import 'package:asadbek_firebase_auth/pages/setup.dart';
import 'package:asadbek_firebase_auth/services/firebase_auth_service.dart';
import 'package:asadbek_firebase_auth/services/util_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<void> register() async {
    String email = emailC.text;
    String pass = passwordC.text;
    User? user = await AuthService.loginUser(context, email: email, password: pass);
    if (user != null) {
      if (mounted) {
        await service.store("uid", AuthService.auth.currentUser!.uid.toString());
        Utils.fireSnackBar("Successfully registered", context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
      }
    } else {
      emailC.clear();
      passwordC.clear();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Xato"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 30),
          child: Column(
            children: [
              const Text(
                "Login User",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder(), enabled: true, enabledBorder: OutlineInputBorder(), labelText: "Email"),
                  controller: emailC,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder(), enabled: true, enabledBorder: OutlineInputBorder(), labelText: "Password"),
                  controller: passwordC,
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                shape: const StadiumBorder(),
                color: Colors.orange,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                onPressed: () async => await register(),
                child: const Text("Login"),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                },
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
