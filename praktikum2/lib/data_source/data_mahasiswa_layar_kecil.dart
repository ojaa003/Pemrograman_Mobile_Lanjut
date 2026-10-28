import 'package:flutter/material.dart';
import 'package:praktikum2/data_source/data_source.dart';
import 'package:praktikum2/data_source/nilai_mahasiswa.dart';
import 'package:praktikum2/data_source/total_mahasiswa.dart';

class DataMahasiswaLayarKecil extends StatefulWidget {
  const DataMahasiswaLayarKecil({super.key});

  @override
  State<DataMahasiswaLayarKecil> createState() =>
      _DataMahasiswaLayarKecilState();
}

class _DataMahasiswaLayarKecilState extends State<DataMahasiswaLayarKecil> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TotalMahasiswa(),
        Expanded(
          child: ListView.builder(
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              var mahasiswa = mahasiswaList[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NilaiMahasiswa(
                          mahasiswa: mahasiswa,
                          judul: "Nilai Mahasiswa",
                          lebar: false,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(mahasiswa.foto),
                  ),
                  title: Text(mahasiswa.nim),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mahasiswa.nama),
                      Text(mahasiswa.email),
                      Text(mahasiswa.prodi),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}