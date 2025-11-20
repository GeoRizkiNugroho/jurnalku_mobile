import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/permintaansaksi_page.dart';
import 'package:jurnalku_mobile/setting_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalku Mobile',
      debugShowCheckedModeBanner: false,
      home: SettingPage(),
    );
  }
}