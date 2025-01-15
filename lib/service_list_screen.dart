import 'package:flutter/material.dart';
import 'booking_screen.dart';
import 'user_selection_screen.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({Key? key}) : super(key: key);

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  final List<Map<String, String>> services = [
    {'id': '1', 'name': 'Salon Bliss', 'type': 'Salon'},
    {'id': '2', 'name': 'Spa Haven', 'type': 'Spa'},
    {'id': '3', 'name': 'Health Clinic', 'type': 'Clinic'},
  ];

  final Map<String, List<Map<String, String>>> userBookings = {};

  void addBooking(Map<String, String> booking) {
    setState(() {
      if (!userBookings.containsKey(booking['name'])) {
        userBookings[booking['name']!] = [];
      }
      userBookings[booking['name']]!.add(booking);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service List')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book_online),
              title: const Text('Bookings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserSelectionScreen(userBookings: userBookings),
                  ),
                );
              },
            ),
          ],
        ),
      ),
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
              onTap: () async {
                final booking = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(service: service),
                  ),
                );

                if (booking != null) {
                  addBooking(booking);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

