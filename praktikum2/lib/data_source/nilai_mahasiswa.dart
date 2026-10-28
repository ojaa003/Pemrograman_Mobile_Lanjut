import 'package:flutter/material.dart';
import 'package:praktikum2/data_source/data_source.dart';
class NilaiMahasiswa extends StatefulWidget {
final bool lebar;
final String judul;
final Mahasiswa mahasiswa;
const NilaiMahasiswa({
super.key,
required this.mahasiswa,
required this.judul,
required this.lebar,
});
@override
State<NilaiMahasiswa> createState() => _NilaiMahasiswaState();
}
class _NilaiMahasiswaState extends State<NilaiMahasiswa> {
@override
Widget build(BuildContext context) {
var mhs = widget.mahasiswa;
return Scaffold(
appBar: AppBar(title: Text(widget.judul)),
body: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Card(
child: ListTile(
leading: CircleAvatar(backgroundImage: NetworkImage(mhs.foto)),
title: Text(mhs.nim),
subtitle: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [Text(mhs.nama), Text(mhs.email), Text(mhs.prodi)],
),
),
),
(MediaQuery.of(context).size.width < 1024 || widget.lebar)
? Expanded(
child: SingleChildScrollView(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: mhs.nilai
.map(
(e) => Padding(
padding: const EdgeInsets.all(8.0),
child: Card(
  child: SizedBox(
width: double.infinity,
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Text(e.kodeMatakuliah),
Text(e.namaMatakuliah),
Text(e.sks.toString()),
Text(e.nilaiUts.toString()),
Text(e.nilaiUas.toString()),
Text(e.nilaiPresensi.toString()),
Text(e.nilaiTugas.toString()),

],
),
),
),
),
)
.toList(),
),
),
)
: Column(
children: [
Card(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Row(
children: [
Expanded(flex: 1, child: Text("Kode Matakuliah")),
Expanded(flex: 3, child: Text("Nama Matakuliah")),
Expanded(flex: 1, child: Text("SKS")),
Expanded(flex: 1, child: Text("Nilai UTS")),
Expanded(flex: 1, child: Text("Nilai Uas")),
Expanded(flex: 1, child: Text("Nilai Presensi")),
Expanded(flex: 1, child: Text("Nilai Tugas")),
],
),
),
),
Card(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Column(
children: mhs.nilai
.map(
(e) => Row(
children: [
Expanded(
flex: 1,

child: Text(e.kodeMatakuliah),

),
Expanded(
flex: 3,

child: Text(e.namaMatakuliah),
),
Expanded(
flex: 1,

child: Text(e.sks.toString()),

),
Expanded(
flex: 1,

child: Text(e.nilaiUts.toString()),

),
Expanded(
flex: 1,

child: Text(e.nilaiUas.toString()),

),
Expanded(
flex: 1,

child: Text(e.nilaiPresensi.toString()),

),
Expanded(
flex: 1,

child: Text(e.nilaiTugas.toString()),

),
],
),
)
.toList(),
),
),
),
],
),
],
),
);
}
}