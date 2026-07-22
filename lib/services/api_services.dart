import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // ============================================================
  // BASE URL FOR API ENDPOINTS
  // ============================================================
  static const String baseUrl = "http://10.5.50.17/Rihla_backend/api";
  // ============================================================
  // REGISTER - Creates a new user account
  // ============================================================
  static Future<dynamic> register(
    String name,
    String email,
    String password,
    bool isStudent,
  ) async {
    try {
      // Send POST request to register endpoint
      final response = await http.post(
        Uri.parse("$baseUrl/register.php"),
        body: {
          "name": name,
          "email": email,
          "password": password,
          "is_student": isStudent.toString(),
        },
      );

      // Parse JSON response
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      // Return error response if unable to connect to server
      return {"success": false, "message": "unable to connect to server "};
    }
  }

  // ============================================================
  // LOGIN - Authenticates user credentials
  // ============================================================
  static Future<dynamic> login(String email, String password) async {
    try {
      // Send POST request to login endpoint
      final response = await http.post(
        Uri.parse("$baseUrl/login.php"),
        body: {"email": email, "password": password},
      );

      // Parse JSON response
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      // Return error response if unable to connect to server
      return {"success": false, "message": "unable to connect to server "};
    }
  }
}
