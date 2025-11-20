import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String value;
  const SettingItem({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
              "Pengaturan Akun",
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
                    Text(
                      'PPLG XII-3',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
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
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
                'Pengaturan Akun',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
             SizedBox(height: 5),
              Text(
                'Dashboard / Pengaturan Akun',
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
             SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                      'Informasi Profil',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                   SizedBox(height: 25),
                    Center(
                      child: Stack(
                        children: [
                         CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage('assets/images/profile.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.camera_alt, size: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                   SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Klik untuk mengubah foto',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                   SizedBox(height: 30),
                   Text('Nama'),
                   SizedBox(height: 8),
                   SettingItem(value: "Nama Siswa"),
                   SizedBox(height: 20),
                   Text('NIS'),
                   SizedBox(height: 8),
                   SettingItem(value: "12345678"),
                   SizedBox(height: 20),
                   Text('Rombel'),
                   SizedBox(height: 8),
                   SettingItem(value: "PPLG XII-3"),
                   SizedBox(height: 20),
                   Text('Rayon'),
                   SizedBox(height: 8),
                   SettingItem(value: "Cis 7"),
                  ],
                ),
              ),
             SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                      'Ubah Kata Sandi',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                   SizedBox(height: 25),
                   Text('Kata Sandi Lama'),
                   SizedBox(height: 8),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        hintText: "Masukkan password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.visibility_outlined),
                      ),
                    ),
                   SizedBox(height: 5),
                    Text(
                      'Masukkan kata sandi lama anda',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                   SizedBox(height: 20),
                   Text('Kata Sandi Baru'),
                   SizedBox(height: 8),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        hintText: "Masukkan password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.visibility_outlined),
                      ),
                    ),
                   SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'Simpan Perubahan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
