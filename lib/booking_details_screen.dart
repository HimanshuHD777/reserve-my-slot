import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  final Map<String, String> booking;

  const BookingDetailsScreen({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${booking['name']}', style: const TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(height: 10),
            Text('Service: ${booking['service']}', style: const TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(height: 10),
            Text('Date: ${booking['date']}', style: const TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(height: 10),
            Text('Time: ${booking['time']}', style: const TextStyle(fontSize: 18, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
