import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, String> service;

  const BookingScreen({Key? key, required this.service}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Service')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: ${widget.service['name']}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              style: TextStyle(
                color: Colors.black, // Change text color
                fontSize: 18, // Change font size
              ),
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                labelStyle: TextStyle(
                  color: Colors.black, // Change label text color
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              style: TextStyle(
                color: Colors.black, // Change text color
                fontSize: 18, // Change font size
              ),
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Select Date',
                labelStyle: TextStyle(
                  color: Colors.black, // Change label text color
                  fontSize: 16,
                ),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _dateController.text =
                      pickedDate.toIso8601String().split('T')[0];
                }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              style: TextStyle(
                color: Colors.black, // Change text color
                fontSize: 18, // Change font size
              ),
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Select Time',
                labelStyle: TextStyle(
                  color: Colors.black, // Change label text color
                  fontSize: 16,
                ),
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  _timeController.text = pickedTime.format(context);
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _dateController.text.isNotEmpty &&
                    _timeController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    'name': _nameController.text,
                    'service': widget.service['name']!,
                    'date': _dateController.text,
                    'time': _timeController.text,
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,      // Background color
              foregroundColor: Colors.white,    // Text color
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              elevation: 5, // Shadow elevation
            ),
              child: const Text('Submit Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
