import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/editInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_services.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  _RideHistoryScreenState createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  List<dynamic> rides = [];

  @override
  void initState() {
    super.initState();
    loadRideHistory();
  }

  Future<void> loadRideHistory() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("user_id");
    if (userId == null) return;

    final result = await ApiService.getRideHistory(userId);
    if (result['success'] == true) {
      setState(() {
        rides = result['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride History')),
      body: rides.isEmpty
          ? const Center(child: Text('No rides found yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: rides.length,
              itemBuilder: (context, index) {
                final ride = rides[index];
                final DateTime expiresAt = DateTime.parse(ride['expires_at']);
                final bool isActive = DateTime.now().isBefore(expiresAt);

                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.confirmation_num_outlined,
                        color: isActive ? Colors.green : Colors.grey,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ride['ticket_name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "Expires: ${ride['expires_at']}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        isActive ? 'Active' : 'Expired',
                        style: TextStyle(
                          color: isActive ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
