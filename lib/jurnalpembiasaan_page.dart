import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/widgets/main_app_bar.dart';

class JurnalPembiasaanPage extends StatelessWidget {
  const JurnalPembiasaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(
        nama: "Nama Siswa",
        rombel: "PPLG XII-3",
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Tambah", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== HEADER =====
            const Text(
              "Jurnal Pembiasaan",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Desember 2025",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),

            const SizedBox(height: 28),

            // ===== A. PEMBIASAAN HARIAN =====
            const Text(
              "A. Pembiasaan Harian",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 31,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) {
                final day = index + 1;
                return GestureDetector(
                  onTap: () => _showDayDetail(context, day),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      day.toString().padLeft(2, '0'),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // ===== B. PEKERJAAN =====
            const Text(
              "B. Pekerjaan yang Dilakukan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            _pekerjaanCard(
              pekerjaan: "Membuat UI Login",
              tanggal: "12 Des 2025",
              saksi: "Pak Budi",
            ),
            _pekerjaanCard(
              pekerjaan: "Fix Bug API",
              tanggal: "14 Des 2025",
              saksi: "Bu Sari",
            ),

            const SizedBox(height: 32),

            // ===== C. MATERI =====
            const Text(
              "C. Materi yang Dipelajari",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            _materiCard(
              materi: "Laravel Authentication",
              status: "A",
              tanggal: "10 Des 2025",
            ),
            _materiCard(
              materi: "REST API",
              status: "P",
              tanggal: "13 Des 2025",
            ),

            const SizedBox(height: 32),

            // ===== D. POIN =====
            const Text(
              "D. Poin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            _poinTile("Project / Progres Belajar", 5),
            _poinTile("Pertanyaan / Materi", 3),
            _poinTile("Ceklist Pembiasaan", 7),
            _poinTile("Total Poin", 15, isTotal: true),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // ===== PEKERJAAN =====
  static Widget _pekerjaanCard({
    required String pekerjaan,
    required String tanggal,
    required String saksi,
  }) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12),
      ),
      child: ListTile(
        title: Text(pekerjaan, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text("Tanggal: $tanggal"),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  // ===== MATERI =====
  static Widget _materiCard({
    required String materi,
    required String status,
    required String tanggal,
  }) {
    final Color statusColor =
        status == "A" ? Colors.green : status == "P" ? Colors.orange : Colors.red;

    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white, 
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Text(materi, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Row(
            children: [
              Icon(Icons.circle, size: 10, color: statusColor),
              const SizedBox(width: 6),
              Text("Status: $status"),
            ],
          ),
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 8),
                Text("Tanggal: $tanggal"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ===== POIN =====
  static Widget _poinTile(String label, int poin, {bool isTotal = false}) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isTotal ? Colors.blue : Colors.black12,
        ),
      ),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
        ),
        trailing: Text(
          poin.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isTotal ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }

  // ===== DETAIL HARI =====
  static void _showDayDetail(BuildContext context, int day) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Hari $day",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text("Status: Sudah diisi"),
            const SizedBox(height: 6),
            const Text("Catatan: Pembiasaan berjalan baik."),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
                          