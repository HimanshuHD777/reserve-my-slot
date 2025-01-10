import 'package:flutter/material.dart';
import 'booking_screen.dart';

class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> services = [
      {'id': '1', 'name': 'Salon Bliss', 'type': 'Salon'},
      {'id': '2', 'name': 'Spa Haven', 'type': 'Spa'},
      {'id': '3', 'name': 'Health Clinic', 'type': 'Clinic'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Service List')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(service['name'] ?? 'Unknown Service'),
              subtitle: Text(service['type'] ?? 'Unknown Type'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(service: service),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
