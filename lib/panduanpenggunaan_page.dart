import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PanduanpenggunaanPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PanduanpenggunaanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: NavbarDummy(),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(maxWidth: 1200),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F9FC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book,  // "menu book" icon added here
                            size: 40,  // Icon size
                            color: Colors.blue[900],  // Icon color
                          ),
                          SizedBox(width: 8),  // Space between icon and text
                          Text(
                            "Panduan Penggunaan",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Selamat datang di panduan penggunaan aplikasi Jurnalku. "
                        "Panduan ini akan membantu Anda memahami cara menggunakan "
                        "fitur–fitur yang tersedia dengan optimal.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 32),
                      _buildSectionTitle("Umum"),
                      SizedBox(height: 16),
                      _buildCard(
                        title: "Unggah Profile",
                        subtitle: "Panduan untuk mengunggah profile pengguna",
                        icon: Icons.person_add,
                      ),
                      SizedBox(height: 16),
                      _buildCard(
                        title: "Ganti Password",
                        subtitle: "Panduan untuk mengganti password pengguna",
                        icon: Icons.lock,
                      ),
                      SizedBox(height: 32),
                      _buildSectionTitle("Untuk Siswa"),
                      SizedBox(height: 16),
                      _buildCard(
                        title: "Mengisi Jurnal",
                        subtitle: "Panduan untuk mengisi kegiatan sehari - hari",
                        icon: Icons.book,
                      ),
                      SizedBox(height: 16),
                      _buildCard(
                        title: "Kelengkapan Profile",
                        subtitle: "Panduan untuk melengkapi profile",
                        icon: Icons.info_outline,
                      ),
                      SizedBox(height: 16),
                      _buildCard(
                        title: "Mengelola Portfolio",
                        subtitle: "Panduan untuk menambah, edit, dan hapus portfolio",
                        icon: Icons.work_outline,
                      ),
                      SizedBox(height: 16),
                      _buildCard(
                        title: "Mengelola Sertifikat",
                        subtitle: "Panduan untuk menambah, edit, dan hapus sertifikat",
                        icon: Icons.workspace_premium,
                      ),
                      SizedBox(height: 16),
                      _buildCard(
                        title: "Catatan Sikap Saya",
                        subtitle: "Panduan untuk melihat dan memahami catatan sikap",
                        icon: Icons.fact_check,
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[900], size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// NavbarDummy dipakai di atas
class NavbarDummy extends StatelessWidget {
  const NavbarDummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.home_outlined, color: Colors.black87),
              SizedBox(width: 10),
              Text(
                "> Panduan Penggunaan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Nama User",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "PPLG ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
