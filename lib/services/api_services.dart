import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://10.5.50.2/Rihla_backend/api";


  static Future updateprofile(
    int id,
    String name,
    String email,
    String password,
) async {


  var response = await http.post(

    Uri.parse(
      "http://10.5.50.2/Rihla_backend/api/updateProfile.php"
    ),

    body: {

      "id": id.toString(),

      "name": name,

      "email": email,

      "password": password,

    },

  );


  print(response.body);


  return jsonDecode(response.body);

}


  

  // ============================================================
  // REGISTER - Creates a new user account
  // ============================================================
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
print(response.body);
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }

  // ============================================================
  // LOGIN - Authenticates user credentials
  // ============================================================
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
