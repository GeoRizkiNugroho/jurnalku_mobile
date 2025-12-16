import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/login_page.dart';
import 'package:jurnalku_mobile/profile.dart';
import 'package:jurnalku_mobile/setting_page.dart';
import 'catatansikap_page.dart';
import 'dashboard_page.dart';
import 'permintaansaksi_page.dart';
import 'jelajahi_page.dart';
import 'panduanpenggunaan_page.dart';
import 'progress_page.dart';
import 'jurnalpembiasaan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalku Mobile',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // AUTH
        '/': (context) => LoginPage(),

        // DASHBOARD
        '/dashboard': (context) => DashboardPage(),

        // MENU UTAMA
        '/settings': (context) => SettingPage(),
        '/catatansikap': (context) => CatatanSikapPage(),
        '/permintaansaksi': (context) => PermintaanSaksi(),
        '/progress': (context) => ProgressPage(),
        '/jurnalpembiasaan': (context) => JurnalPembiasaanPage(),
        '/profile': (context) => ProfilePage(),

        // TAMBAHAN
        '/jelajahi': (context) => JelajahiPage(),
        '/panduan': (context) => PanduanpenggunaanPage(),
      },
    );
  }
}
