// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uas_mobile/pages/DetailScreen.dart';
import 'package:uas_mobile/widgets/ProdukCard.dart';
import 'package:uas_mobile/models/ProdukSaya.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Produk Kami",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "Semua Produk"),
              _buildProductCategory(index: 1, name: "X Banner"),
              _buildProductCategory(index: 2, name: "Undangan"),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isSelected == 0
                ? _buildAllProducts()
                : isSelected == 1
                    ? _buildBanner()
                    : _buildUndangan(),
          ),
        ],
      ),
    );
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index
                  ? const Color.fromARGB(255, 252, 134, 37)
                  : const Color.fromARGB(255, 243, 222, 168),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: ProdukSaya.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = ProdukSaya.allProducts[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(produks: allProducts),
              ),
            ),
            child: ProdukCard(produks: allProducts),
          );
        },
      );
  _buildBanner() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: ProdukSaya.banner.length,
        itemBuilder: (context, index) {
          final banner = ProdukSaya.banner[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(produks: banner),
              ),
            ),
            child: ProdukCard(produks: banner),
          );
        },
      );
  _buildUndangan() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: ProdukSaya.undangan.length,
        itemBuilder: (context, index) {
          final undangan = ProdukSaya.undangan[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(produks: undangan),
              ),
            ),
            child: ProdukCard(produks: undangan),
          );
        },
      );
}
