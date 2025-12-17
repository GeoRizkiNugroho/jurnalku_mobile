import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String nama;
  final String rombel;

  const MainAppBar({
    super.key,
    required this.nama,
    required this.rombel,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.home_outlined, color: Colors.black),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/jelajahi');
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                nama,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                rombel,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),

        /// AVATAR + DROPDOWN MENU
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: PopupMenuButton<String>(
            offset: const Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (route) {
              Navigator.pushNamed(context, route);
            },
            itemBuilder: (context) => [
              _item(Icons.dashboard_outlined, "Dashboard", "/dashboard"),
              _item(Icons.person_outline, "Profil", "/profile"),
              _item(Icons.explore_outlined, "Jelajahi", "/jelajahi"),
              const PopupMenuDivider(),

              _item(Icons.menu_book_outlined, "Jurnal Pembiasaan", "/jurnalpembiasaan"),
              _item(Icons.assignment_ind_outlined, "Permintaan Saksi", "/permintaansaksi"),
              _item(Icons.bar_chart_outlined, "Progress", "/progress"),
              _item(Icons.warning_amber_outlined, "Catatan Sikap", "/catatansikap"),
              const PopupMenuDivider(),

              _item(Icons.help_outline, "Panduan Penggunaan", "/panduan"),
              _item(Icons.settings_outlined, "Pengaturan Akun", "/settings"),
              _item(Icons.logout, "Log Out", "/"),
            ],
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _item(
      IconData icon, String text, String route) {
    return PopupMenuItem<String>(
      value: route,
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.inter(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
