import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://10.0.2.2/Rihla_backend/api";

  static Future updateprofile(
    int id,
    String name,
    String email,
    String password,
  ) async {
    var response = await http.post(
      Uri.parse("http://10.0.2.2/Rihla_backend/api/updateProfile.php"),

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

  // SAVE STATION
  static Future<bool> saveStation(int userId, int stationId) async {
    try {
      print("Saving station id: $stationId");
      print("User id: $userId");
      final response = await http.post(
        Uri.parse("$baseUrl/savestations.php"),

        body: {
          "user_id": userId.toString(),

          "station_id": stationId.toString(),
        },
      );

      final data = jsonDecode(response.body);

      return data["success"];
    } catch (e) {
      print(e);

      return false;
    }
  }

  // GET SAVED STATIONS
  static Future<List<dynamic>> getSavedStations(int userId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/getsavedstations.php?user_id=$userId"),
      );

      return jsonDecode(response.body);
    } catch (e) {
      print(e);

      return [];
    }
  }

  // REMOVE SAVED STATION
  static Future<bool> removeSavedStation(int userId, int stationId) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/removestations.php"),

        body: {
          "user_id": userId.toString(),

          "station_id": stationId.toString(),
        },
      );

      final data = jsonDecode(response.body);

      return data["success"];
    } catch (e) {
      print(e);

      return false;
    }
  }

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
      print(response.body);
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

  static Future<dynamic> topUp(int userId, String amount) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/topup.php"),
        body: {"user_id": userId.toString(), "amount": amount},
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Unable to connect to server"};
    }
  }

  static Future<dynamic> purchaseTicket(int userId, String ticketName) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/purchase_ticket.php"),
        body: {"user_id": userId.toString(), "ticket_name": ticketName},
      );
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }

  static Future<dynamic> getMyTickets(int userId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/get_my_tickets.php?user_id=$userId"),
      );
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }

  static Future<dynamic> getRideHistory(int userId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/get_ride_history.php?user_id=$userId"),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }

  static Future<dynamic> getBalance(int userId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/get_balance.php?user_id=$userId"),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }

  static Future<dynamic> getTransactions(int userId) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/get_transactions.php?user_id=$userId"),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "unable to connect to server "};
    }
  }
}
