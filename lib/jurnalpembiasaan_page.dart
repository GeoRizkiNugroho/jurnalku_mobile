import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/widgets/main_app_bar.dart';

class JurnalPembiasaanPage extends StatelessWidget {
  const JurnalPembiasaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
          nama: "Nama Siswa",
          rombel: "PPLG XII-3",
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jurnal Pembiasaan",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text("DESEMBER - 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Bulan Sebelumnya", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 30),
              Text("A. Pembiasaan harian",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 18),

              Row(
                children: [
                  CircleAvatar(radius: 6, backgroundColor: Colors.green),
                  SizedBox(width: 5),
                  Text("Sudah diisi"),
                  SizedBox(width: 15),
                  CircleAvatar(radius: 6, backgroundColor: Colors.grey),
                  SizedBox(width: 5),
                  Text("Belum diisi"),
                  SizedBox(width: 15),
                  CircleAvatar(radius: 6, backgroundColor: Colors.red),
                  SizedBox(width: 5),
                  Text("Tidak diisi"),
                ],
              ),

              SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 31,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.75,
                ),
                itemBuilder: (context, index) {
                  int day = index + 1;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        day.toString().padLeft(2, '0'),
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 40),
              Text("B. Pekerjaan yang dilakukan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),

              buildTableSection(
                header: ["Pekerjaan", "Tgl", "Saksi"],
                emptyText: "Belum ada pekerjaan yang diinput.",
                buttonText: "+ Tambah Pekerjaan",
              ),

              SizedBox(height: 40),
              Text("C. Materi yang dipelajari",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),

              buildTableSection(
                header: ["Materi", "Sts", "Tgl"],
                emptyText: "Belum ada materi yang diinput.",
                buttonText: "+ Tambah Materi",
              ),

              SizedBox(height: 18),
              Row(
                children: [
                  Icon(Icons.circle, size: 10, color: Colors.green),
                  SizedBox(width: 6),
                  Text("A : Approved"),
                  SizedBox(width: 16),
                  Icon(Icons.circle, size: 10, color: Colors.orange),
                  SizedBox(width: 6),
                  Text("P : Pending"),
                  SizedBox(width: 16),
                  Icon(Icons.circle, size: 10, color: Colors.red),
                  SizedBox(width: 6),
                  Text("R : Revisi"),
                ],
              ),

              SizedBox(height: 40),
              Text("D. Poin",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),

              buildPoinTable(),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTableSection({
    required List<String> header,
    required String emptyText,
    required String buttonText,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: List.generate(
                header.length,
                (i) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(header[i],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(emptyText, style: TextStyle(color: Colors.grey[700])),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(buttonText,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPoinTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Kategori Poin",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Poin",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),

          poinRow("(5) Mengerjakan project / update progres belajar"),
          poinRow("(1 - 5) Poin dari pertanyaan atau laporan materi"),
          poinRow("Jumlah poin minggu ini"),
          poinRow("Jumlah poin ceklist pembiasaan"),
          poinRow("Jumlah keseluruhan poin", isLast: true),
        ],
      ),
    );
  }

  Widget poinRow(String text, {bool isLast = false}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(text),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("0"),
              ),
            ),
          ],
        ),
        if (!isLast) Divider(height: 1, color: Colors.grey.shade300),
      ],
    );
  }
}
