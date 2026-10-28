import 'package:flutter/material.dart';
import 'package:praktikum2/data_source/constanta.dart';
import 'package:praktikum2/data_source/data_mahasiswa_layar_kecil.dart';
import 'package:praktikum2/data_source/data_mahasiswa_layar_lebar.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    double lebarLayar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Latihan Responsif")),
      body: lebarLayar <= layarKecil
          ? const DataMahasiswaLayarKecil()
          : const DataMahasiswaLayarLebar(),
      bottomNavigationBar: lebarLayar <= layarKecil
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.people), label: "Informatika"),
                BottomNavigationBarItem(icon: Icon(Icons.people), label: "Sistem Informasi"),
                BottomNavigationBarItem(icon: Icon(Icons.people), label: "Teknologi Informasi"),
                BottomNavigationBarItem(icon: Icon(Icons.high_quality), label: "Terbaik"),
              ],
            )
          : null,
      drawer: lebarLayar <= layarKecil
          ? null
          : Drawer(
              child: Column(
                children: [
                  const DrawerHeader(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(),
                          SizedBox(height: 8),
                          Text("Menu Utama"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                        ),
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text("Informatika"),
                        ),
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text("Sistem Informasi"),
                        ),
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text("Teknologi Informasi"),
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