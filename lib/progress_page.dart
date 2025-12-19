import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Icon(Icons.home_outlined, color: Colors.grey.shade700),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios,
                    color: Colors.grey.shade700, size: 10),
                const SizedBox(width: 8),
                Text(
                  "Progress",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'PPLG XII-3',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                const CircleAvatar(
                  radius: 18,
                  child: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Progress Belajar',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 10),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thursday, 20 November',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                    Text(
                      '2025',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  _buildCard(
                    title: "Total Pengajuan",
                    value: "7",
                    indicatorLabel: "Semua status",
                    indicatorColor: Colors.blue,
                    icon: Icons.check_circle_outline,
                    bgIcon: Colors.blue.withOpacity(0.15),
                  ),
                  _buildCard(
                    title: "Halaman Ini",
                    value: "0",
                    indicatorLabel: "Ditampilkan",
                    indicatorColor: Colors.green,
                    icon: Icons.calendar_today_outlined,
                    bgIcon: Colors.green.withOpacity(0.15),
                  ),
                  _buildCard(
                    title: "Status",
                    value: "4",
                    indicatorLabel: "Perlu Validasi",
                    indicatorColor: Colors.orange,
                    icon: Icons.access_time,
                    bgIcon: Colors.orange.withOpacity(0.15),
                  ),
                  _buildCard(
                    title: "Total Halaman",
                    value: "1",
                    indicatorLabel: "Navigasi Tersedia",
                    indicatorColor: Colors.purple,
                    icon: Icons.task,
                    bgIcon: Colors.purple.withOpacity(0.15),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              _buildProgressSection("Project Work"),
              _buildProgressSection("Mobile Apps"),
              _buildProgressSection("UKK (Uji Kompetensi Keahlian)"),
              _buildProgressSection("GIM"),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildCard({
    required String title,
    required String value,
    required String indicatorLabel,
    required Color indicatorColor,
    required IconData icon,
    required Color bgIcon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 35,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration:
                  BoxDecoration(color: bgIcon, shape: BoxShape.circle),
              child: Icon(icon, size: 26, color: indicatorColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style:
                      TextStyle(fontSize: 14, color: Colors.grey.shade700)),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.info_outline,
                      size: 16, color: indicatorColor),
                  const SizedBox(width: 6),
                  Text(
                    indicatorLabel,
                    style: TextStyle(
                        fontSize: 12, color: indicatorColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= TABLE SECTION =================
  Widget _buildProgressSection(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            "Kompetensi dan materi pembelajaran",
            style:
                TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          /// 🔥 OPTIMASI TABEL (TETAP MUNCUL)
          SizedBox(
            height: 20,
            child: ListView.builder(
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const Row(
                  children: [
                    _TableHeader("KOMPETENSI", flex: 2),
                    _TableHeader("GURU"),
                    _TableHeader("TANGGAL"),
                    _TableHeader("STATUS"),
                    _TableHeader("CATATAN GURU", flex: 2),
                    _TableHeader("CATATAN SISWA", flex: 2),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= TABLE HEADER =================
class _TableHeader extends StatelessWidget {
  final String text;
  final int flex;

  const _TableHeader(this.text, {this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
