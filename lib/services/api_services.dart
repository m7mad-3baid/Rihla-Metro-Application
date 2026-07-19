import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://10.5.50.225/Rihla_backend/api";

  static Future<dynamic> register(
    String name,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register.php"),
      body: {"name": name, "email": email, "password": password},
    );

    print(response.body);

    final data = jsonDecode(response.body);

    return data;
  }

  static Future<dynamic> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login.php"),
      body: {"email": email, "password": password},
    );

    print(response.body);

    final data = jsonDecode(response.body);

    return data;
  }
}
