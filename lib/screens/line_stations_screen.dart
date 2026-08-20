import 'package:flutter/material.dart';
import '../models/station.dart';

class LineStationsScreen extends StatefulWidget {
  final String lineName;
  final Color lineColor;
  final List<Station> stations;

  const LineStationsScreen({
    super.key,
    required this.lineName,
    required this.lineColor,
    required this.stations,
  });

  @override
  State<LineStationsScreen> createState() => _LineStationsScreenState();
}
class _LineStationsScreenState extends State<LineStationsScreen> {
  late List<bool> expanded;

  @override
  void initState() {
    super.initState();
    expanded = List.filled(widget.stations.length, false);
  }

  Widget _buildSttnCard(Station station, int index) {
    final isExpanded = expanded[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          expanded[index] = !expanded[index];
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: isExpanded ? 230 : 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: widget.lineColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      station.id.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    station.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.train, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text("Next train: ${station.nextTrain}"),
                const SizedBox(width: 12),
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.green,
                ),
                const SizedBox(width: 6),
                const Text("Open"),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: isExpanded
                      ? Padding(
                          key: const ValueKey(true),
                          padding: const EdgeInsets.only(top: 12),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Divider(color: Color(0xFFE2E2E2)),
                              Text(
                                "Station on ${station.line}.",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(key: ValueKey(false)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: widget.lineColor,
        foregroundColor: Colors.white,
        title: Text(
          widget.lineName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: widget.stations.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final station = widget.stations[index];
            return _buildSttnCard(station, index);
          },
        ),
      ),
    );
  }
}
