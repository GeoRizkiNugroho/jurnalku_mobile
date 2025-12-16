import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ===============================================================
          //                        SCROLL CONTENT
          // ===============================================================
          Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ===================== LOGIN SECTION =====================
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(color: Color(0xFF0D47A1)),
                    child: Stack(
                      children: [
                        // =============== BACKGROUND IMAGE RIGHT ===============
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/images/students.png',
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // ================= LOGIN CARD =================
                        Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 420,
                              margin: const EdgeInsets.only(left: 80),
                              padding: const EdgeInsets.all(35),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 30,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Masuk untuk memulai ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const Text(
                                    "Jurnalku",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF0D47A1),
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  const Text(
                                    "Username atau NIS",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Masukkan username atau NIS",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9E9E9E),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF5F5F5),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                  const Text(
                                    "Password",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  TextField(
                                    obscureText: !_isPasswordVisible,
                                    decoration: InputDecoration(
                                      hintText: "Masukkan password",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9E9E9E),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF5F5F5),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF9E9E9E),
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/dashboard');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF0D47A1),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      child: const Text(
                                        'Masuk',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),


                                  const SizedBox(height: 25),

                                  const Center(
                                    child: Text(
                                      "Lupa password? Hubungi guru laboran.",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // =================== BOTTOM SECTION ===================
                  const BottomSection(),
                ],
              ),
            ),
          ),

          // ===============================================================
          //                        FIXED BUTTON (JELAJAHI SISWA)
          // ===============================================================
          Positioned(
            bottom: 25,
            right: 25,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF003C8F),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Text(
                    "Jelajahi siswa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
//                          BOTTOM SECTION (FITUR)
// ============================================================================
class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Menyatukan Upaya untuk Kemajuan Siswa",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0C2E4E),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 15),

          const Text(
            "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam "
            "memantau dan mengelola kompetensi keahlian siswa secara efektif.",
            style: TextStyle(
              fontSize: 17,
              height: 1.5,
              color: Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 50),

          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _item(
                icon: Icons.school,
                color: const Color(0xFFFCE7A5),
                title: "Dirancang untuk Sekolah Kami",
                desc:
                    "Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami.",
              ),
              _item(
                icon: Icons.account_tree,
                color: const Color(0xFFE3D4FF),
                title: "Pemantauan yang Terstruktur",
                desc:
                    "Memudahkan guru menyusun dan memantau daftar kompetensi.",
              ),
              _item(
                icon: Icons.sports_gymnastics,
                color: const Color(0xFFCDEBFF),
                title: "Fitur Praktis dan Bermanfaat",
                desc:
                    "Termasuk reminder otomatis, grafik, dan analisis mendalam.",
              ),
              _item(
                icon: Icons.how_to_reg,
                color: const Color(0xFFFFD7A5),
                title: "Pengajuan Kompetensi oleh Siswa",
                desc:
                    "Siswa dapat mengajukan kompetensi untuk diverifikasi guru.",
              ),
              _item(
                icon: Icons.edit_document,
                color: const Color(0xFFD0FFD6),
                title: "Validasi dan Tanda Tangan Guru",
                desc:
                    "Kompetensi disetujui akan diberi tanda terima dan ttd guru.",
              ),
              _item(
                icon: Icons.desktop_mac,
                color: const Color(0xFFFFD0DD),
                title: "Pantauan Real-Time",
                desc:
                    "Monitoring langsung menciptakan lingkungan belajar efisien.",
              ),
            ],
          ),

          const SizedBox(height: 60),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 22),
            color: const Color(0xFF003C8F),
            child: const Center(
              child: Text(
                "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _item({
    required IconData icon,
    required Color color,
    required String title,
    required String desc,
  }) {
    return SizedBox(
      width: 320,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: Colors.black87),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0C2E4E),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF4B5563),
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
