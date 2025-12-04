import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Icon(Icons.home_outlined, color: Colors.grey[700]),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, color: Colors.grey[700], size: 10),
                SizedBox(width: 8),
                Text(
                  "Progress",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Text('PPLG XII-3', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                SizedBox(width: 12),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress Belajar',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thursday, 20 November',
                          style: TextStyle(fontSize: 12, color: Colors.blue[700], fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '2025',
                          style: TextStyle(fontSize: 12, color: Colors.blue[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                    title: "Status ",
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
                    indicatorColor: Color.fromARGB(255, 197, 33, 197),
                    icon: Icons.task,
                    bgIcon: Colors.red.withOpacity(0.15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String value,
    required String indicatorLabel,
    required Color indicatorColor,
    required IconData icon,
    required Color bgIcon,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
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
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgIcon,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 26, color: indicatorColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              SizedBox(height: 8),
              Text(value, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: indicatorColor),
                  SizedBox(width: 6),
                  Text(
                    indicatorLabel,
                    style: TextStyle(fontSize: 12, color: indicatorColor),
                  ),
                ],
              ),
            ],

          ),
        ],
      ),
    );
  }
}
