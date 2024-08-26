// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uas_mobile/pages/DetailKeranjang.dart';
import 'package:uas_mobile/pages/HomeScreen.dart';
import 'package:uas_mobile/pages/favorite.dart';
import 'package:uas_mobile/pages/profile.dart';
import 'package:uas_mobile/providers/CartProvider.dart';
import 'package:uas_mobile/providers/FavoriteProvider.dart';
import 'package:provider/provider.dart';

class AplikasiSaya extends StatelessWidget {
  const AplikasiSaya({super.key});
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          title: 'Ibnu Design',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.grey.shade100,
          ),
        ),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const Favorite(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IBNU DESIGN"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailKeranjang(),
              ),
            ),
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: screens[currentIndex],
      backgroundColor: const Color.fromARGB(255, 232, 229, 229),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);
        },
        selectedItemColor: const Color.fromARGB(255, 252, 134, 37),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
