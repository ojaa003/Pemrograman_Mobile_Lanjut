import 'package:flutter/material.dart';
List<Map<String, dynamic>> totalMahasiswa = [
{"kategori": "Total Mahasiswa", "jumlah": 1000, "warna": Colors.red.shade100},
{"kategori": "Informatika", "jumlah": 500, "warna": Colors.green.shade100},
{
"kategori": "Sistem Informasi",
"jumlah": 300,
"warna": Colors.blue.shade100,
},
{
"kategori": "Teknologi Informasi",
"jumlah": 200,
"warna": Colors.amber.shade100,
},
];
class TotalMahasiswa extends StatefulWidget {
const TotalMahasiswa({super.key});
@override
State<TotalMahasiswa> createState() => _TotalMahasiswaState();
}
class _TotalMahasiswaState extends State<TotalMahasiswa> {
@override
Widget build(BuildContext context) {
return SingleChildScrollView(
scrollDirection: Axis.horizontal,
child: Row(
children: totalMahasiswa
.map(
(e) => KotakTotalMahasiswa(
judul: e['kategori'],
jumlah: e['jumlah'].toString(),
warna: e['warna'],
),
)
.toList(),
),
);
}
}
class KotakTotalMahasiswa extends StatelessWidget {
final String judul;
final String jumlah;
final Color warna;
const KotakTotalMahasiswa({
super.key,
required this.judul,
required this.jumlah,
required this.warna,
});
@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.all(8.0),
child: Container(
height: 100,
width: 150,
decoration: BoxDecoration(
color: warna,
borderRadius: BorderRadius.circular(20),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
children: [
Center(child: Text(judul)),
Center(child: Text("$jumlah Orang")),
],
),
),
);
}
}