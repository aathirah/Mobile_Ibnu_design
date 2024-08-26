// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_mobile/models/Produk.dart';
import 'package:uas_mobile/pages/DetailKeranjang.dart';
import 'package:uas_mobile/providers/CartProvider.dart';

class DetailScreen extends StatelessWidget {
  final Produk produks;
  const DetailScreen({super.key, required this.produks});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 166,
                  height: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 243, 239, 237),
                  ),
                  child: Image.asset(produks.gambar, fit: BoxFit.cover),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        produks.nama.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id', // Indonesian locale
                          symbol: 'Rp', // Rupiah symbol
                          decimalDigits: 0, // No decimal digits
                        ).format(produks.harga),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    produks.deskripsi,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Warna",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(width: 5.0),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 8.0),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Color.fromARGB(255, 245, 143, 177),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                NumberFormat.currency(
                  locale: 'id', // Indonesian locale
                  symbol: 'Rp', // Rupiah symbol
                  decimalDigits: 0, // No decimal digits
                ).format(produks.harga),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  provider.toggleProduct(produks);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailKeranjang(),
                    ),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text("Masukan keranjang"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
