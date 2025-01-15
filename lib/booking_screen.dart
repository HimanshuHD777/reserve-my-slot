/*
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final Map<String, String>? service;

  const BookingScreen({Key? key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service: ${service?['name'] ?? 'Unknown'}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Time'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking submitted!')),
                  );
                },
                child: const Text('Submit Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, String>? service;

  const BookingScreen({Key? key, this.service}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String get formattedDate {
    return selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : 'Select Date';
  }

  String get formattedTime {
    return selectedTime != null
        ? selectedTime!.format(context)
        : 'Select Time';
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _submitBooking() {
    if (selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a valid date and time.')),
      );
      return;
    }

    // Show a success popup
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              const Text(
                'Booking Complete!',
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Close the popup after a delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service: ${widget.service?['name'] ?? 'Unknown'}',
                style: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: formattedDate,
                  labelStyle: const TextStyle(
                    fontFamily: 'RobotoSlab',
                    color: Colors.white70,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                onTap: _pickDate,
              ),
              const SizedBox(height: 16),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: formattedTime,
                  labelStyle: const TextStyle(
                    fontFamily: 'RobotoSlab',
                    color: Colors.white70,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                onTap: _pickTime,
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _submitBooking,
                  child: const Text('Submit Booking'),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
*/
/*import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, String> service;

  const BookingScreen({Key? key, required this.service}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
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
            Text('Service: ${widget.service['name']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Select Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _dateController.text = pickedDate.toIso8601String().split('T')[0];
                }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Select Time'),
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
                if (_dateController.text.isNotEmpty && _timeController.text.isNotEmpty) {
                  Navigator.pop(context, {
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
              child: const Text('Submit Booking'),
            ),
          ],
        ),
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, String>? service;

  const BookingScreen({Key? key, this.service}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  String? userName;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service: ${widget.service?['name'] ?? 'Unknown'}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  userName = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date'),
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  setState(() {
                    selectedDate = date;
                  });
                },
                validator: (value) {
                  if (selectedDate == null) {
                    return 'Please select a date';
                  }
                  return null;
                },
                controller: TextEditingController(
                  text: selectedDate != null
                      ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                      : '',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Time'),
                readOnly: true,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  setState(() {
                    selectedTime = time;
                  });
                },
                validator: (value) {
                  if (selectedTime == null) {
                    return 'Please select a time';
                  }
                  return null;
                },
                controller: TextEditingController(
                  text: selectedTime != null
                      ? '${selectedTime!.hour}:${selectedTime!.minute}'
                      : '',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, {
                      'userName': userName,
                      'date': selectedDate,
                      'time': selectedTime,
                      'service': widget.service,
                    });
                  }
                },
                child: const Text('Submit Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/





/*import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final Map<String, String> service;

  const BookingScreen({Key? key, required this.service}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
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
            Text('Service: ${widget.service['name']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Select Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _dateController.text = pickedDate.toIso8601String().split('T')[0];
                }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Select Time'),
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
                if (_dateController.text.isNotEmpty && _timeController.text.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => Theme(
                      data: Theme.of(context).copyWith(
                        dialogBackgroundColor: Colors.yellow[100], // Yellow background
                      ),
                      child: AlertDialog(
                        title: Row(
                          children: const [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 10),
                            Text('Booking Confirmed'),
                          ],
                        ),
                        content: Text(
                          'Your booking for ${widget.service['name']} on ${_dateController.text} at ${_timeController.text} has been confirmed.',
                          style: const TextStyle(color: Colors.black), // Black text
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                              Navigator.pop(context, {
                                'service': widget.service['name']!,
                                'date': _dateController.text,
                                'time': _timeController.text,
                              }); // Return booking details
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: const Text('Submit Booking'),
            ),
          ],
        ),
      ),
    );
  }
}*/







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
            Text('Service: ${widget.service['name']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Your Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Select Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _dateController.text = pickedDate.toIso8601String().split('T')[0];
                }
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Select Time'),
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
              child: const Text('Submit Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
