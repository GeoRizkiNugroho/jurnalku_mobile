import 'package:flutter/material.dart';

class JurnalpembiasaanPage extends StatelessWidget {
  const JurnalpembiasaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text(
              "Jurnal Pembiasaan",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          const SizedBox(height: 20),
          _sectionTitle("A. Pembiasaan harian"),
          const SizedBox(height: 8),
          _dummyCalendar(),
          const SizedBox(height: 26),
          _sectionTitle("B. Pekerjaan yang dilakukan"),
          const SizedBox(height: 8),
          _dummyTable("Belum ada pekerjaan yang diinput.", "+ Tambah Pekerjaan"),
          const SizedBox(height: 26),
          _buildMateriSection(),
          const SizedBox(height: 26),
          _buildPoinSection(),
        ],
      ),
    );
  }

  Widget _buildMateriSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("C. Materi yang dipelajari"),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                  child: Row(
                    children: const [
                      Expanded(child: Center(child: Text("Materi"))),
                      SizedBox(width: 80, child: Center(child: Text("Sts"))),
                      SizedBox(width: 80, child: Center(child: Text("Tgl"))),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: const Center(
                    child: Text(
                      "Belum ada materi yang diinput.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "+ Tambah Materi",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.circle, size: 12, color: Colors.green),
              SizedBox(width: 4),
              Text("A : Approved    "),
              Icon(Icons.circle, size: 12, color: Colors.orange),
              SizedBox(width: 4),
              Text("P : Pending    "),
              Icon(Icons.circle, size: 12, color: Colors.red),
              SizedBox(width: 4),
              Text("R : Revisi"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPoinSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("D. Poin"),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Kategori Poin",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Center(
                          child: Text(
                            "Jumlah Poin",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                _rowPoin("(5) mengerjakan project/update progres", ["0", "0", "0", "0"]),
                _rowPoin("(1-5) Poin dari pertanyaan materi", ["0", "0", "0", "0"]),
                _rowPoin("Jumlah poin minggu ini", ["0", "0", "0", "0"]),
                _rowPoin("Jumlah poin ceklist pembiasaan", ["0"]),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Row(
                    children: const [
                      Expanded(child: Center(child: Text("Jumlah keseluruhan poin"))),
                      SizedBox(
                        width: 80,
                        child: Center(
                          child: Text(
                            "0",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowPoin(String title, List<String> values) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(title),
            ),
          ),
          Row(
            children: values
                .map(
                  (e) => SizedBox(
                    width: 50,
                    child: Center(child: Text(e)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
    );
  }

  Widget _dummyCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: const Text("Kalender disini"),
      ),
    );
  }

  Widget _dummyTable(String emptyText, String addText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(emptyText, style: const TextStyle(color: Colors.grey)),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Text(addText, style: const TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
