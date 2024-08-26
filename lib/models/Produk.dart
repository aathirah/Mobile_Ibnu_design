// ignore_for_file: file_names

class Produk {
  final int id;
  final String nama;
  final String kategori;
  final String gambar;
  final String deskripsi;
  final double harga;
  int qty;
  Produk({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
    required this.qty,
  });
}
