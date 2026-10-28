import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. Definisi Model Data
class Pencapaian {
  final String judul;
  final String tanggal;
  final String keterangan;

  Pencapaian({required this.judul, required this.tanggal, required this.keterangan});
}

class Mahasiswa {
  final String id;
  final String nama;
  final String nim;
  final String jurusan;
  final String fotoUrl;
  final List<Pencapaian> daftarPencapaian;

  Mahasiswa({
    required this.id,
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.fotoUrl,
    required this.daftarPencapaian,
  });
}

// Data Dummy Statis (Sesuai ketentuan teknis poin 2)
List<Mahasiswa> dataMahasiswa = [
  Mahasiswa(
    id: '1',
    nama: 'Budi Santoso',
    nim: 'M0521001',
    jurusan: 'Ilmu Komputer / Informatika',
    fotoUrl: 'https://picsum.photos/seed/budi/200',
    daftarPencapaian: [
      Pencapaian(judul: 'Juara 1 Hackathon Nasional', tanggal: '12 Maret 2025', keterangan: 'Membuat aplikasi pelacak sampah berbasis AI.'),
      Pencapaian(judul: 'Finalis UI/UX Competition', tanggal: '20 Juli 2025', keterangan: 'Desain ulang aplikasi transportasi publik.'),
      Pencapaian(judul: 'Publikasi Jurnal Nasional', tanggal: '5 Oktober 2025', keterangan: 'Penulis pendamping terkait IoT pertanian.'),
      Pencapaian(judul: 'Asisten Praktikum Pemrograman Mobile', tanggal: 'Semester Ganjil 2025/2026', keterangan: 'Membimbing 30 mahasiswa.'),
      Pencapaian(judul: 'Sertifikasi Flutter Developer', tanggal: '15 Januari 2026', keterangan: 'Sertifikasi keahlian profesional Google/Associate.'),
    ],
  ),
  Mahasiswa(
    id: '2',
    nama: 'Siti Rahma',
    nim: 'M0521002',
    jurusan: 'Teknik Informatika',
    fotoUrl: 'https://picsum.photos/seed/siti/200',
    daftarPencapaian: [
      Pencapaian(judul: 'Google Developer Student Clubs Lead', tanggal: '2024 - 2025', keterangan: 'Memimpin komunitas kampus.'),
      Pencapaian(judul: 'Grant Program Startup Kampus', tanggal: '10 Mei 2025', keterangan: 'Pendanaan awal untuk aplikasi edukasi.'),
      Pencapaian(judul: 'Speaker Seminar Teknologi', tanggal: '18 Agustus 2025', keterangan: 'Pembicara materi dasar Cloud Computing.'),
      Pencapaian(judul: 'Juara 2 Lomba Pemrograman Kompetitif', tanggal: '12 November 2025', keterangan: 'Penyelesaian algoritma tingkat lanjut.'),
      Pencapaian(judul: 'Magang Software Engineer', tanggal: 'Februari - Juni 2026', keterangan: 'Backend developer intern di perusahaan startup.'),
    ],
  ),
    Mahasiswa(
    id: '3',
    nama: 'Agit Maulana',
    nim: 'M0521003',
    jurusan: 'Teknik Informatika',
    fotoUrl: 'https://picsum.photos/seed/siti/200',
    daftarPencapaian: [
      Pencapaian(judul: 'Google Developer Student Clubs Lead', tanggal: '2024 - 2025', keterangan: 'Memimpin komunitas kampus.'),
      Pencapaian(judul: 'Grant Program Startup Kampus', tanggal: '10 Mei 2025', keterangan: 'Pendanaan awal untuk aplikasi edukasi.'),
      Pencapaian(judul: 'Speaker Seminar Teknologi', tanggal: '18 Agustus 2025', keterangan: 'Pembicara materi dasar Cloud Computing.'),
      Pencapaian(judul: 'Juara 2 Lomba Pemrograman Kompetitif', tanggal: '12 November 2025', keterangan: 'Penyelesaian algoritma tingkat lanjut.'),
      Pencapaian(judul: 'Magang Software Engineer', tanggal: 'Februari - Juni 2026', keterangan: 'Backend developer intern di perusahaan startup.'),
    ],
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Informasi Mahasiswa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DaftarMahasiswaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 2. Halaman Utama: Daftar Entitas (List)
class DaftarMahasiswaPage extends StatelessWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Informasi Mahasiswa')),
      body: ListView.builder(
        itemCount: dataMahasiswa.length,
        itemBuilder: (context, index) {
          final mhs = dataMahasiswa[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(mhs.fotoUrl),
              ),
              title: Text(mhs.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${mhs.nim} - ${mhs.jurusan}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // 3. Navigasi ke halaman detail ketika entitas dipilih
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMahasiswaPage(mahasiswa: mhs),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 3. Halaman Detail & Relasi Satu-ke-Banyak (Minimal 5 Item Pencapaian)
class DetailMahasiswaPage extends StatelessWidget {
  final Mahasiswa mahasiswa;

  const DetailMahasiswaPage({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail ${mahasiswa.nama}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informasi Pribadi & Visual
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(mahasiswa.fotoUrl),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    mahasiswa.nama,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    mahasiswa.nim,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    mahasiswa.jurusan,
                    style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const Divider(height: 32, thickness: 1),
            
            // Bagian Relasi Data (Pencapaian Akademik / Aktivitas)
            const Text(
              'Daftar Pencapaian Akademik',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Menampilkan minimal 5 item relasi data terstruktur
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mahasiswa.daftarPencapaian.length,
              itemBuilder: (context, index) {
                final pencapaian = mahasiswa.daftarPencapaian[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(pencapaian.judul, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${pencapaian.keterangan}\nTanggal: ${pencapaian.tanggal}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}