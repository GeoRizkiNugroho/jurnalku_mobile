import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/dashboard_page.dart';
import 'package:jurnalku_mobile/jelajahi_page.dart';
import 'package:jurnalku_mobile/tabeloptimasi_page.dart';
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
      home: DashboardPage(),
    );
  }
}