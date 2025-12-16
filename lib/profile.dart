import 'package:flutter/material.dart';

class NavbarDummy extends StatelessWidget {
  const NavbarDummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ===== LEFT (Breadcrumb) =====
          Row(
            children: const [
              Icon(
                Icons.home_outlined,
                size: 20,
                color: Colors.black54,
              ),
              SizedBox(width: 10),
              Text(
                "Explore",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 6),
              Text(
                ">",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
              SizedBox(width: 6),
              Text(
                "NIS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          // ===== RIGHT (User Info) =====
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Nama",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Rombel",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFFE0E0E0),
                child: Icon(
                  Icons.person,
                  size: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.black54,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTab = 0; 
  // 0 = Overview, 1 = Portfolio, 2 = Sertifikat

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const NavbarDummy(),

          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 1100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================= COVER =================
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 230,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/school.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),

                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: -55,
                            left: 20,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    size: 70,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF0A6BFF),
                                  ),
                                  child: const Icon(Icons.camera_alt,
                                      color: Colors.white, size: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 70),

                      // ================= NAMA =================
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Nama User",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "NIS | ROMBEL | RAYON",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ================= TABS =================
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Row(
                          children: [
                            _buildTab("Overview", 0),
                            _buildTab("Portfolio", 1),
                            _buildTab("Sertifikat", 2),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ================= CONTENT =================
                      if (selectedTab == 0) _buildOverview(),
                      if (selectedTab == 1) _buildPortfolio(),
                      if (selectedTab == 2) _buildSertifikat(),

                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // OVERVIEW CONTENT
  // ============================================================
  Widget _buildOverview() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==================== KOLOM KIRI ====================
          Expanded(
            child: Column(
              children: [
                _buildBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Portfolio Terbaru",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              _buildSmallButton("+ Tambah"),
                              const SizedBox(width: 12),
                              const Text(
                                "Lihat Semua",
                                style: TextStyle(
                                  color: Color(0xFF0A6BFF),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      const SizedBox(height: 35),

                      Column(
                        children: const [
                          Icon(Icons.work_rounded,
                              size: 55, color: Colors.brown),
                          SizedBox(height: 10),
                          Text(
                            "Portfolio akan ditampilkan di sini",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 25),

          // ==================== KOLOM KANAN ====================
          Expanded(
            child: Column(
              children: [
                // ----- Sertifikat Terbaru -----
                _buildBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sertifikat Terbaru",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              _buildSmallButton("+ Tambah"),
                              const SizedBox(width: 10),
                              const Text(
                                "Lihat Semua",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF0A6BFF)),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 35),

                      Column(
                        children: const [
                          Text("🏆", style: TextStyle(fontSize: 55)),
                          SizedBox(height: 10),
                          Text(
                            "Sertifikat akan ditampilkan di sini",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // ----- DOKUMEN -----
                _buildBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dokumen",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 20),

                      _buildDocSection(
                        title: "Curriculum Vitae",
                        desc: "Dokumen CV siswa",
                        buttonText: "📄  Lihat CV",
                      ),

                      const SizedBox(height: 20),
                      Container(height: 1, color: Colors.grey.shade300),
                      const SizedBox(height: 20),

                      _buildDocSection(
                        title: "Kartu Pelajar",
                        desc: "Kartu identitas siswa",
                        buttonText: "📄  Lihat Kartu",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // ========== MEDIA SOSIAL DIPINDAH KE SINI ==========
                _buildBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Media Sosial",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0A6BFF),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Media sosial akan ditampilkan di sini",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}


  Widget _buildPortfolio() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Portfolio",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A6BFF),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Text(
                      "+ Tambah Portfolio",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 45),

              Column(
                children: const [
                  Icon(Icons.work_rounded,
                      size: 70, color: Colors.brown),
                  SizedBox(height: 12),
                  Text(
                    "Belum Ada Portfolio",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Portfolio akan ditampilkan di sini ketika sudah ditambahkan",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A6BFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "+ Tambah Portfolio Pertama",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSertifikat() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 40),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "🏆",
          style: TextStyle(fontSize: 70),
        ),

        const SizedBox(height: 18),

        const Text(
          "Belum Ada Sertifikat",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          "Tambahkan sertifikat dan pencapaian Anda di sini",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 28),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          decoration: BoxDecoration(
            color: const Color(0xFF0A6BFF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "+ Tambah Sertifikat",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: child,
    );
  }

  Widget _buildSmallButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _buildDocSection({
    required String title,
    required String desc,
    required String buttonText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600)),
        Text(desc, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: Color(0xFF0A6BFF),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(Icons.file_download_outlined),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildTab(String label, int index) {
    bool active = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: active
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF0A6BFF),
                      width: 3,
                    ),
                  ),
                )
              : null,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    active ? const Color(0xFF0A6BFF) : Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
