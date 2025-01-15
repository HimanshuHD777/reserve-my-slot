import 'package:flutter/material.dart';
import 'user_bookings_screen.dart';

class UserSelectionScreen extends StatefulWidget {
  final Map<String, List<Map<String, String>>> userBookings;

  const UserSelectionScreen({Key? key, required this.userBookings}) : super(key: key);

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  String? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: selectedUser,
                hint: const Text('Select User', style: TextStyle(color: Colors.black)),
                isExpanded: true,
                dropdownColor: Colors.white,
                items: widget.userBookings.keys
                    .map((user) => DropdownMenuItem(
                  value: user,
                  child: Text(
                    user,
                    style: const TextStyle(color: Colors.black),
                  ),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedUser = value;
                  });
                },
                underline: const SizedBox(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedUser == null
                  ? null
                  : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserBookingsScreen(
                      userName: selectedUser!,
                      bookings: widget.userBookings[selectedUser!]!,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'Get Booking',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
