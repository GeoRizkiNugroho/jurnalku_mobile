import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/login_page.dart';

class JelajahiPage extends StatefulWidget {
  JelajahiPage({super.key});

  @override
  State<JelajahiPage> createState() => _JelajahiPageState();
}
class _JelajahiPageState extends State<JelajahiPage> {
  final List<Map<String, dynamic>> dummyStudents = [
    {
      "name": "Geo Rizki Nugroho",
      "nis": "12309660",
      "rombel": "PPLG XII-3",
      "rayon": "Cis 7",
      "portfolio": 10,
      "sertifikat": 15,
    },
    {
      "name": "Malika Maharani Khoerulisa",
      "nis": "12309728",
      "rombel": "PPLG XII-3",
      "rayon": "Cis 7",
      "portfolio": 200,
      "sertifikat": 500,
    },
    {
      "name": "Negari Gendisayu Yudhani",
      "nis": "12309940",
      "rombel": "PPLG XII-3",
      "rayon": "Cia 4",
      "portfolio": 150,
      "sertifikat": 250,
    },
  ];
  final List<String> rombelList = [
    "PPLG X-1",
    "PPLG XI-1",
    "PPLG XII-1",
  ];
  final List<String> rayonList = ["Cisarua", "Cicurug", "Ciawi", "Tajur", "Sukasari", "Wikrama", "Cibedug"];
  final List<String> jurusanList = ["RPL", "DKV", "Perhotelan", "Kuliner"];
  bool showFilter = false;
  String? selectedRombel;
  String? selectedRayon;
  String? selectedJurusan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(width: 12),
            Icon(Icons.menu_book_outlined, color: Color(0xFF02398c), size: 28),
            SizedBox(width: 8),
            Text(
              "Jurnalku",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF02398c),
                  padding: EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Banner
          SizedBox(
            height: showFilter
                ? 700
                : 300, // Tinggi dinamis berdasarkan showFilter
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background image
                Container(
                  height: showFilter ? 700 : 300, // Tinggi dinamis
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Banner-Web.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Blur effect
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(color: Colors.black.withOpacity(0)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Direktori Siswa",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Temukan dan jelajahi profil siswa SMK Wikrama Bogor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              )
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Colors.grey[600]),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText:
                                          "Cari nama siswa, NIS, atau rombel...",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF0A4D9E),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: Text(
                                    "Cari",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showFilter = !showFilter;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                                color: Colors.grey.shade100,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.filter_list,
                                    size: 18,
                                    color: Colors.grey[700],
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Filter Lanjutan",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    showFilter
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.grey[700],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          if (showFilter)
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ROMBEL
                                  Text(
                                    "Rombel",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    value: selectedRombel,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    items: rombelList
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        setState(() => selectedRombel = value),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Rayon",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    value: selectedRayon,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    items: rayonList
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        setState(() => selectedRayon = value),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Jurusan",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    value: selectedJurusan,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    items: jurusanList
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        setState(() => selectedJurusan = value),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // LAKUKAN FILTER
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF0A4D9E),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Terapkan",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedRombel = null;
                                              selectedRayon = null;
                                              selectedJurusan = null;
                                            });
                                          },
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                            side: BorderSide(color: Colors.grey),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Reset",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ],
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
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Menampilkan 1 - 3 dari 35 siswa",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: dummyStudents.map((s) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: buildStudentCard(
                    name: s["name"],
                    nis: s["nis"],
                    rombel: s["rombel"],
                    rayon: s["rayon"],
                    portfolio: s["portfolio"],
                    sertifikat: s["sertifikat"],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildStudentCard({
    required String name,
    required String nis,
    required String rombel,
    required String rayon,
    required int portfolio,
    required int sertifikat,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, color: Colors.white, size: 38),
            ),

            SizedBox(height: 14),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 4),
            Text(
              "$nis | $rombel | $rayon",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),

            SizedBox(height: 12),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.folder_copy, size: 18, color: Colors.grey),
                    SizedBox(width: 6),
                    Text(
                      "$portfolio Portfolio",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.verified_outlined, size: 18, color: Colors.grey),
                    SizedBox(width: 6),
                    Text(
                      "$sertifikat Sertifikat",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF02398c),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lihat Detail",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}