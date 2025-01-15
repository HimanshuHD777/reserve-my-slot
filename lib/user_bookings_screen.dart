import 'package:flutter/material.dart';
import 'booking_details_screen.dart';

class UserBookingsScreen extends StatelessWidget {
  final String userName;
  final List<Map<String, String>> bookings;

  const UserBookingsScreen({Key? key, required this.userName, required this.bookings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$userName\'s Bookings')),
      body: bookings.isEmpty
          ? const Center(child: Text('No bookings available'))
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(booking['service'] ?? 'Unknown Service'),
              subtitle: Text('Date: ${booking['date']}, Time: ${booking['time']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDetailsScreen(booking: booking),
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