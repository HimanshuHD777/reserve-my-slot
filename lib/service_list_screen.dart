/*
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
*/
/*
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
      appBar: AppBar(
        title: const Text('Service List'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            color: Colors.grey[900],
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
                color: Colors.red,
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
*/




/*import 'package:flutter/material.dart';
import 'booking_screen.dart';

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

  List<Map<String, String>> upcomingBookings = [];
  List<Map<String, String>> pastBookings = [];

  void addBooking(Map<String, String> booking) {
    setState(() {
      upcomingBookings.add(booking);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service List')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.bookmark, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'My Bookings',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.upcoming),
              title: const Text('Upcoming Bookings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                showBookings(context, 'Upcoming Bookings', upcomingBookings);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Past Bookings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                showBookings(context, 'Past Bookings', pastBookings);
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

  void showBookings(BuildContext context, String title, List<Map<String, String>> bookings) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              bookings.isEmpty
                  ? const Center(child: Text('No bookings available'))
                  : ListView.builder(
                shrinkWrap: true,
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return ListTile(
                    leading: const Icon(Icons.event),
                    title: Text(booking['service'] ?? 'Unknown Service'),
                    subtitle: Text('${booking['date']}, ${booking['time']}'),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}*/





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

