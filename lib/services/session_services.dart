import 'package:shared_preferences/shared_preferences.dart';

class SessionService {


  static Future<void> saveUser(Map<String, dynamic> user) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(
      "user_id",
      int.parse(user["id"].toString()),
    );


    await prefs.setString(
      "name",
      user["name"],
    );


    await prefs.setString(
      "email",
      user["email"].toString(),
    );


    await prefs.setBool(
      "is_student",
      user["is_student"] == "1",
    );


    await prefs.setBool(
      "logged_in",
      true,
    );

  }



  static Future<int?> getUserId() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt("user_id");

  }



  static Future<bool> isLoggedIn() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool("logged_in") ?? false;

  }



  static Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

  }



  static Future<void> checkUser() async {

    final prefs = await SharedPreferences.getInstance();


    print("USER ID: ${prefs.getInt("user_id")}");
    print("NAME: ${prefs.getString("name")}");
    print("EMAIL: ${prefs.getString("email")}");
    print("STUDENT: ${prefs.getBool("is_student")}");
    print("LOGGED IN: ${prefs.getBool("logged_in")}");

  }

}