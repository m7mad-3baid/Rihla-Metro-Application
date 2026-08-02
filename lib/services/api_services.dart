import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://10.0.2.2/Rihla_backend/api";

  // REGISTER - Creates a new user account
  static Future<dynamic> register(
    String name,
    String email,
    String password,
    bool isStudent,
    String studentId,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register.php"),
        body: {
          "name": name,
          "email": email,
          "password": password,
          "is_student": isStudent.toString(),
          "student_id": studentId,
        },
      );

      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }

  // LOGIN - Authenticates user credentials
  static Future<dynamic> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login.php"),
        body: {"email": email, "password": password},
      );

      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }
}
