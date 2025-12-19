import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jurnalku_mobile/models/login_model.dart';

class AuthServices {
  final String baseURL = "http://10.0.2.2:8000/api";

  Future<LoginResponse> login({
    required String nis,
    required String password,
  }) async {
    try {
      final url = Uri.parse("$baseURL/login");
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "nis": nis,
          "password": password,
        }),
      );

      final jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonData);
      } else {
        throw jsonData['message'] ?? "Terjadi kesalahan";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}