import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/widgets/main_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTab = 0; // 0 = Overview, 1 = Portfolio, 2 = Sertifikat

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        nama: "Nama Siswa",
        rombel: "PPLG XII-3",
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1100,
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 70),

                // ================= NAMA =================
                const Text(
                  "Nama User",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "NIS | ROMBEL | RAYON",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
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
    );
  }

  // ============================================================
  // OVERVIEW (RESPONSIVE MOBILE / DESKTOP)
  // ============================================================
  Widget _buildOverview() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        final left = _buildBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Portfolio Terbaru",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.work_rounded,
                      size: 55,
                      color: Colors.brown,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Portfolio akan ditampilkan di sini",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

        final right = Column(
          children: [
            _buildBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Sertifikat Terbaru",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        Text("🏆", style: TextStyle(fontSize: 55)),
                        SizedBox(height: 10),
                        Text(
                          "Sertifikat akan ditampilkan di sini",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            _buildBox(
              child: const Center(
                child: Text(
                  "Media sosial akan ditampilkan di sini",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        );

        if (isMobile) {
          return Column(
            children: [
              left,
              const SizedBox(height: 25),
              right,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: left),
            const SizedBox(width: 25),
            Expanded(child: right),
          ],
        );
      },
    );
  }

  // ============================================================
  // PORTFOLIO
  // ============================================================
  Widget _buildPortfolio() {
    return _buildBox(
      child: Column(
        children: const [
          Icon(Icons.work_rounded, size: 70, color: Colors.brown),
          SizedBox(height: 12),
          Text(
            "Belum Ada Portfolio",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5),
          Text(
            "Portfolio akan ditampilkan di sini",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERTIFIKAT
  // ============================================================
  Widget _buildSertifikat() {
    return _buildBox(
      child: Column(
        children: const [
          Text("🏆", style: TextStyle(fontSize: 70)),
          SizedBox(height: 15),
          Text(
            "Belum Ada Sertifikat",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          Text(
            "Tambahkan sertifikat Anda di sini",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COMPONENTS
  // ============================================================
  Widget _buildBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: child,
    );
  }

  Widget _buildTab(String label, int index) {
    final bool active = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
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
                color: active
                    ? const Color(0xFF0A6BFF)
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
