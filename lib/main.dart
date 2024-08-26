import 'package:flutter/material.dart';
import 'package:uas_mobile/pages/HomePage.dart';
import 'package:uas_mobile/pages/LoginPage.dart';
import 'package:uas_mobile/pages/SignUp.dart';
import 'package:uas_mobile/providers/CartProvider.dart';
import 'package:uas_mobile/providers/FavoriteProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => FavoriteProvider())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 254, 136, 40),
            ),
            routes: {
              "/": (context) => const LoginPage(),
              "homePage": (context) => const HomePage(),
              "signup": (context) => const SignUp(),
            }));
  }
}
