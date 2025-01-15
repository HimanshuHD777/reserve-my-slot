import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:reservemyslot/lib/booking_screen.dart';

void main() {
  testWidgets('Displays booking fields and submits booking', (WidgetTester tester) async {
    final service = {'id': '1', 'name': 'Salon Bliss', 'type': 'Salon'};

    await tester.pumpWidget(MaterialApp(home: BookingScreen(service: service)));

    // Verify fields are displayed
    expect(find.text('Service: Salon Bliss'), findsOneWidget);
    expect(find.text('Select Date'), findsOneWidget);
    expect(find.text('Select Time'), findsOneWidget);
    expect(find.text('Submit Booking'), findsOneWidget);

    // Interact with fields
    await tester.enterText(find.byType(TextField).at(0), '2025-01-13');
    await tester.enterText(find.byType(TextField).at(1), '10:00 AM');

    // Submit booking
    await tester.tap(find.text('Submit Booking'));
    await tester.pumpAndSettle();

    // Verify confirmation dialog
    expect(find.text('Booking Confirmed'), findsOneWidget);
  });
}
