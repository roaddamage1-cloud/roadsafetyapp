import 'package:flutter/material.dart';

class ViewReports extends StatefulWidget {
  const ViewReports({super.key});

  @override
  State<ViewReports> createState() => _ViewReportsState();
}

class _ViewReportsState extends State<ViewReports> {
  // Example static list of reports (you can replace this with fetched data)
  final List<Map<String, dynamic>> _reports = [
    {
      'incident': 'Road Accident',
      'time': '10:30 AM',
      'place': 'Main Street',
      'phone': '9876543210',
      'description': 'Two cars collided at the signal.',
      'status': 'Pending',
      'image': null,
    },
    {
      'incident': 'Fire in Market',
      'time': '3:15 PM',
      'place': 'Downtown Market',
      'phone': '9123456789',
      'description': 'A small fire broke out in a food stall.',
      'status': 'In Progress',
      'image': null,
    },
    {
      'incident': 'Theft Report',
      'time': '7:45 PM',
      'place': 'City Mall',
      'phone': '9988776655',
      'description': 'Bag stolen near the food court area.',
      'status': 'Resolved',
      'image': null,
    },
  ];

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'resolved':
        return Colors.green;
      case 'in progress':
        return Colors.orange;
      default:
        return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIEW REPORTS'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _reports.length,
        itemBuilder: (context, index) {
          final report = _reports[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.all(16),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      report['incident'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: _statusColor(report['status']).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      report['status'],
                      style: TextStyle(
                        color: _statusColor(report['status']),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              children: [
                _infoTile('Time', report['time']),
                _infoTile('Place', report['place']),
                _infoTile('Phone', report['phone']),
                _infoTile('Description', report['description']),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14)),
          const Divider(height: 16),
        ],
      ),
    );
  }
}
