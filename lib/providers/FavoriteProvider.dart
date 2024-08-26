// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uas_mobile/models/Produk.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Produk> _favorites = [];
  List<Produk> get favorites => _favorites;

  void toggleFavorite(Produk produks) {
    if (_favorites.contains(produks)) {
      _favorites.remove(produks);
    } else {
      _favorites.add(produks);
    }
    notifyListeners();
  }

  bool isExist(Produk produks) {
    final isExist = _favorites.contains(produks);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
