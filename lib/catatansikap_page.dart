import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_mobile/widgets/main_app_bar.dart';

class CatatanSikapPage extends StatefulWidget {
 CatatanSikapPage({super.key});

  @override
  State<CatatanSikapPage> createState() => _CatatanSikapPageState();
}
class _CatatanSikapPageState extends State<CatatanSikapPage> {
  String? nilaiTerpilih;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          nama: "Nama Siswa",
          rombel: "PPLG XII-3",
        ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Catatan Sikap Saya",
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
           SizedBox(height: 5),
            Text(
              "Lihat catatan sikap dan perilaku yang telah dilaporkan",
              style: GoogleFonts.inter(fontSize: 15, color: Colors.black87),
              textAlign: TextAlign.left,
            ),
           SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFFFF7ED),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFCD34D)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFB45309),
                    size: 28,
                  ),
                 SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Jika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan.",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Color(0xFFB45309),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
           SizedBox(height: 25),
            kotakData(
              "Total Catatan",
              "0",
              Icons.insert_drive_file_outlined,
              Colors.blue,
            ),
           SizedBox(height: 20),
            kotakData("Dalam Perbaikan", "0", Icons.bolt, Colors.amber),
           SizedBox(height: 20),
            kotakData(
              "Sudah Berubah",
              "0",
              Icons.insert_drive_file_outlined,
              Colors.green,
            ),

           SizedBox(height: 30),
            buildItemList("No", ["1"]),
            buildItemList("Dilaporkan", ["Lumayan Baik", "Baik", "Baik Banget"]),
            buildItemList("Catatan", ["Tolong"]),
            buildItemList("Status", ["Siswa/i"]),
            buildItemList("Kategori", ["Baik"]),
            buildItemList("Update Terakhir", ["29 November"]),
            buildItemList("Aksi", ["Hapus"]),
          ],
        ),
      ),
    );
  }

  Widget kotakData(String judul, String angka, IconData icon, Color warna) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
               SizedBox(height: 6),
                Text(
                  angka,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: warna.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: warna),
          ),
        ],
      ),
    );
  }

  Widget buildItemList(String title, List<String> items) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        title: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          textAlign: TextAlign.left,
        ),

        childrenPadding: EdgeInsets.all(16),

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(items.length, (i) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${i + 1}. ${items[i]}",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}