// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:uas_mobile/providers/CartProvider.dart';

class DetailKeranjang extends StatefulWidget {
  const DetailKeranjang({super.key});

  @override
  State<DetailKeranjang> createState() => _DetailKeranjangState();
}

class _DetailKeranjangState extends State<DetailKeranjang> {
  Widget _buildProductQuantity(IconData icon, int index) {
    final provider = CartProvider.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          icon == Icons.add
              ? provider.incrementQuantity(index)
              : provider.decrementQuantity(index);
        });
      },
      child: Icon(icon, size: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 232, 229, 229), // Mengubah latar belakang di sini
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              finalList[index].qty = 1;
                              finalList.removeAt(index);
                              setState(() {});
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          finalList[index].nama,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          NumberFormat.currency(
                            locale: 'id', // Indonesian locale
                            symbol: 'Rp', // Rupiah symbol
                            decimalDigits: 0, // No decimal digits
                          ).format(finalList[index].harga),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(finalList[index].gambar),
                          backgroundColor: Colors.red.shade100,
                        ),
                        trailing: Column(
                          children: [
                            _buildProductQuantity(Icons.add, index),
                            Text(
                              finalList[index].qty.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _buildProductQuantity(Icons.remove, index),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
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
                    ).format(provider.getTotalHarga()),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    label: const Text("Check Out"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
