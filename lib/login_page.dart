import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_mobile/services/login_services.dart';
import 'package:jurnalku_mobile/models/login_model.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  final TextEditingController _nisController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices _authServices = AuthServices();

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authServices.login(
        nis: _nisController.text,
        password: _passwordController.text,
      );

      if (response.success) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _nisController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(color: Color(0xFF0D47A1)),
                    child: Stack(
                      children: [
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
                        Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 420,
                              margin: EdgeInsets.only(left: 80),
                              padding: EdgeInsets.all(35),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 30,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Masuk untuk memulai ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    "Jurnalku",
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF0D47A1),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "Username atau NIS",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  TextField(
                                    controller: _nisController, // controller NIS
                                    decoration: InputDecoration(
                                      hintText: "Masukkan username atau NIS",
                                      hintStyle: GoogleFonts.poppins(
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
                                          color: Color(0xFF0D47A1), 
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    "Password",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  TextField(
                                    controller: _passwordController, // controller password
                                    obscureText: !_isPasswordVisible,
                                    decoration: InputDecoration(
                                      hintText: "Masukkan password",
                                      hintStyle: GoogleFonts.poppins(
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
                                          color: Color(0xFF0D47A1),
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
                                  SizedBox(height: 30),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: _isLoading ? null : _handleLogin, 
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF0D47A1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      child: _isLoading 
                                        ? SizedBox(
                                            height: 20, 
                                            width: 20, 
                                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                                          )
                                        : Text(
                                            'Masuk',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Center(
                                    child: Text(
                                      "Lupa password? Hubungi guru laboran.",
                                      style: GoogleFonts.poppins(
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
                  BottomSection(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 25,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFF003C8F),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/jelajahi');
                },
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Text(
                      "Jelajahi siswa",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Menyatukan Upaya untuk Kemajuan Siswa",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0C2E4E),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam "
            "memantau dan mengelola kompetensi keahlian siswa secara efektif.",
            style: GoogleFonts.poppins(
              fontSize: 17,
              height: 1.5,
              color: Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _item(
                icon: Icons.school,
                color: Color(0xFFFCE7A5),
                title: "Dirancang untuk Sekolah Kami",
                desc: "Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami.",
              ),
              _item(
                icon: Icons.account_tree,
                color: Color(0xFFE3D4FF),
                title: "Pemantauan yang Terstruktur",
                desc: "Memudahkan guru menyusun dan memantau daftar kompetensi.",
              ),
              _item(
                icon: Icons.sports_gymnastics,
                color: Color(0xFFCDEBFF),
                title: "Fitur Praktis dan Bermanfaat",
                desc: "Termasuk reminder otomatis, grafik, dan analisis mendalam.",
              ),
              _item(
                icon: Icons.how_to_reg,
                color: Color(0xFFFFD7A5),
                title: "Pengajuan Kompetensi oleh Siswa",
                desc: "Siswa dapat mengajukan kompetensi untuk diverifikasi guru.",
              ),
              _item(
                icon: Icons.edit_document,
                color: Color(0xFFD0FFD6),
                title: "Validasi dan Tanda Tangan Guru",
                desc: "Kompetensi disetujui akan diberi tanda terima dan ttd guru.",
              ),
              _item(
                icon: Icons.desktop_mac,
                color: Color(0xFFFFD0DD),
                title: "Pantauan Real-Time",
                desc: "Monitoring langsung menciptakan lingkungan belajar efisien.",
              ),
            ],
          ),
          SizedBox(height: 60),
          Container(
            width: double.infinity,
            height: 64,
            color: Color(0xFF003C8F),
            alignment: Alignment.center,
            child: Text(
              "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.9),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
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
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0C2E4E),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  desc,
                  style: GoogleFonts.poppins(
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