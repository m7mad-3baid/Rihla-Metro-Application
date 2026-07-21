import 'package:shared_preferences/shared_preferences.dart';

//static means we can call it directly EX :  SessionService.logout();
//void means its not returning anything
class SessionService {
  static Future<void> saveUser(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("user_id", user["id"].toString());

    await prefs.setString("name", user["name"]);

    await prefs.setString("email", user["email"].toString());

    await prefs.setBool("is_student", user["is_student"] == "1");

    await prefs.setBool("logged_in", true);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool("logged_in") ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    // to access phone storage
    await prefs.clear();
  }

  //test if it saves
  static Future<void> checkUser() async {
    final prefs = await SharedPreferences.getInstance();

    print("USER ID: ${prefs.getString("user_id")}");
    print("NAME: ${prefs.getString("name")}");
    print("EMAIL: ${prefs.getString("email")}");
    print("STUDENT: ${prefs.getBool("is_student")}");
    print("LOGGED IN: ${prefs.getBool("logged_in")}");
  }
}
