import 'package:flutter/material.dart';
import 'package:reservemyslot/styles/styles.dart';
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
      appBar: AppBar(
        title: const Text('Service List'),
        titleTextStyle: headingStyle,
      ),

      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            color: Colors.lightGreen,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: Text(
                service['name'] ?? 'Unknown Service',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                service['type'] ?? 'Unknown Type',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                // style:IconColor,
              ),
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
