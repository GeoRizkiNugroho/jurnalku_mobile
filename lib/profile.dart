import 'package:flutter/material.dart';

class NavbarDummy extends StatelessWidget {
  const NavbarDummy({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
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
            children: const [
              Icon(Icons.home_outlined, size: 20, color: Colors.black54),
              SizedBox(width: 10),
              Text("Explore",
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
              SizedBox(width: 6),
              Text(">",
                  style: TextStyle(fontSize: 14, color: Colors.black45)),
              SizedBox(width: 6),
              Text(
                "NIS",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("Nama",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 2),
                  Text("Rombel",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFFE0E0E0),
                child: Icon(Icons.person,
                    size: 18, color: Colors.black54),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down,
                  size: 20, color: Colors.black54),
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 1024;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const NavbarDummy(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: isMobile ? double.infinity : 1100,
                  padding:
                      EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCover(isMobile),
                      const SizedBox(height: 70),
                      const Text(
                        "Nama User",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "NIS | ROMBEL | RAYON",
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(height: 25),
                      _buildTabs(),
                      const SizedBox(height: 25),
                      if (selectedTab == 0)
                        _buildOverview(isMobile)
                      else if (selectedTab == 1)
                        _buildPortfolioPage()
                      else
                        _buildSertifikatPage(),
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

  Widget _buildCover(bool isMobile) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: isMobile ? 180 : 230,
          width: double.infinity,
          child: Image.asset(
            'assets/images/school.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -55,
          left: isMobile ? 0 : 20,
          right: isMobile ? 0 : null,
          child: Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300),
                  child: const Icon(Icons.person,
                      size: 70, color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF0A6BFF)),
                  child: const Icon(Icons.camera_alt,
                      color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          _buildTab("Overview", 0),
          _buildTab("Portfolio", 1),
          _buildTab("Sertifikat", 2),
        ],
      ),
    );
  }

  Widget _buildOverview(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _portfolioBox(),
          const SizedBox(height: 25),
          _sertifikatBox(),
          const SizedBox(height: 25),
          _dokumenBox(),
          const SizedBox(height: 25),
          _mediaSosialBox(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _portfolioBox()),
        const SizedBox(width: 25),
        Expanded(
          child: Column(
            children: [
              _sertifikatBox(),
              const SizedBox(height: 25),
              _dokumenBox(),
              const SizedBox(height: 25),
              _mediaSosialBox(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _portfolioBox() {
  return _box(
    Column(
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
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add, size: 16),
                      SizedBox(width: 6),
                      Text("Tambah", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Lihat Semua",
                  style: TextStyle(
                    color: Color(0xFF0A6BFF),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),
        Divider(color: Colors.grey.shade300),
        const SizedBox(height: 30),

        Center(
          child: Column(
            children: const [
              Icon(Icons.work_rounded,
                  size: 55, color: Colors.brown),
              SizedBox(height: 12),
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
}

  Widget _sertifikatBox() {
  return _box(
    Column(
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
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add, size: 16),
                      SizedBox(width: 6),
                      Text("Tambah", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Lihat Semua",
                  style: TextStyle(
                    color: Color(0xFF0A6BFF),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),
        Divider(color: Colors.grey.shade300),
        const SizedBox(height: 30),

        Center(
          child: Column(
            children: const [
              Text("🏆", style: TextStyle(fontSize: 55)),
              SizedBox(height: 12),
              Text(
                "Sertifikat akan ditampilkan di sini",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  Widget _dokumenBox() {
    return _box(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Dokumen",
              style:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          _docItem("Curriculum Vitae", "Dokumen CV siswa",
              "📄  Lihat CV"),
          const SizedBox(height: 20),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 20),
          _docItem("Kartu Pelajar", "Kartu identitas siswa",
              "📄  Lihat Kartu"),
        ],
      ),
    );
  }

  Widget _mediaSosialBox() {
  return _box(
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Media Sosial",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
        Divider(color: Colors.grey.shade300),
        const SizedBox(height: 20),

        Center(
          child: Text(
            "Media sosial akan ditampilkan di sini",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildPortfolioPage() => _portfolioBox();
  Widget _buildSertifikatPage() => _sertifikatBox();

  Widget _box(Widget child) {
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

  Widget _docItem(String title, String desc, String btn) {
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
                  color: const Color(0xFF0A6BFF),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(btn,
                      style:
                          const TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(7),
              ),
              child:
                  const Icon(Icons.file_download_outlined),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildTab(String label, int index) {
    final active = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: active
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color(0xFF0A6BFF), width: 3),
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
                    : Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
