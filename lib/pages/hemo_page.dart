import 'package:asadbek_firebase_auth/pages/login_page.dart';
import 'package:asadbek_firebase_auth/pages/register_page.dart';
import 'package:asadbek_firebase_auth/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                            child: CircleAvatar(
                              maxRadius: 50,
                              foregroundImage: AssetImage("assets/images/photo_2023-07-05_07-52-14.jpg"),
                            ),
                          )
                        ],
                      ),
                      Text(
                        AuthService.auth.currentUser?.displayName.toString() ?? "salom",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        AuthService.auth.currentUser?.email.toString() ?? "salom",
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MaterialButton(
                        onPressed: () async {
                          await AuthService.deleteUser();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                        },
                        child: const Row(
                          children: [Icon(Icons.delete), Text("  Delet Accaunt")],
                        )),
                    MaterialButton(
                        onPressed: () async {
                          await AuthService.logOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                        },
                        child: const Row(
                          children: [Icon(Icons.logout), Text("  Log Out Accaunt")],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: IconButton(
        //   // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: const Text("Home Page"),
        actions: [
          IconButton(
            tooltip: "like",
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'saerch',
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  child: Text("bir"),
                ),
                PopupMenuItem(
                  child: Text("ikki"),
                ),
                PopupMenuItem(
                  child: Text(
                    "uch",
                  ),
                ),
              ];
            },
          )
        ],
      ),
    );
  }
}
