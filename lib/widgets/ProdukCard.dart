// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_mobile/models/Produk.dart';
import 'package:uas_mobile/providers/FavoriteProvider.dart';
//import 'package:provider/provider.dart';

class ProdukCard extends StatefulWidget {
  final Produk produks;

  const ProdukCard({super.key, required this.produks});

  @override
  State<ProdukCard> createState() => _ProdukCardState();
}

class _ProdukCardState extends State<ProdukCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => provider.toggleFavorite(widget.produks),
                child: Icon(
                  provider.isExist(widget.produks)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              )
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(widget.produks.gambar, fit: BoxFit.cover),
          ),
          Text(
            widget.produks.nama,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            NumberFormat.currency(
              locale: 'id', // Indonesian locale
              symbol: 'Rp', // Rupiah symbol
              decimalDigits: 0, // No decimal digits
            ).format(widget.produks.harga),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
