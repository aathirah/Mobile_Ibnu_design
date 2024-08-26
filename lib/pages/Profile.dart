// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 232, 229, 229), // Ganti warna background di sini
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian Foto Profil dan Nama
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'images/profile.jpeg'), // Ganti dengan path gambar profil yang benar
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () {
                        // Tambahkan aksi untuk Edit Profil di sini
                      },
                      child: const Text(
                        'Edit profil',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Bagian Menu Profil
            ListTile(
              title: const Text('Notifikasi'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan aksi untuk Notifikasi di sini
              },
            ),
            ListTile(
              title: const Text('Metode Pembayaran'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan aksi untuk Metode Pembayaran di sini
              },
            ),
            ListTile(
              title: const Text('Keluar'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan aksi untuk Keluar di sini
              },
            ),
          ],
        ),
      ),
    );
  }
}
