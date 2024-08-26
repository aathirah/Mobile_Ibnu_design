// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uas_mobile/models/Produk.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Produk> _cart = [];
  List<Produk> get cart => _cart;

  void toggleProduct(Produk produks) {
    if (_cart.contains(produks)) {
      for (Produk element in _cart) {
        element.qty++;
      }
    } else {
      _cart.add(produks);
    }
    notifyListeners();
  }

  incrementQuantity(int index) => _cart[index].qty++;
  decrementQuantity(int index) => _cart[index].qty--;

  getTotalHarga() {
    double total = 0.0;
    for (Produk element in _cart) {
      total += element.harga * element.qty;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
