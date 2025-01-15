import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:reservemyslot/user_selection_screen.dart';

void main() {
  testWidgets('Displays dropdown and navigates to user bookings', (WidgetTester tester) async {
    final userBookings = {
      'Alice': [
        {'service': 'Salon Bliss', 'date': '2025-01-13', 'time': '10:00 AM'},
      ],
      'Bob': [
        {'service': 'Spa Haven', 'date': '2025-01-14', 'time': '11:00 AM'},
      ],
    };

    await tester.pumpWidget(MaterialApp(home: UserSelectionScreen(userBookings: userBookings)));

    // Verify dropdown is displayed
    expect(find.text('Select User'), findsOneWidget);

    // Select a user
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Alice').last);
    await tester.pump();

    // Tap "Get Booking"
    await tester.tap(find.text('Get Booking'));
    await tester.pumpAndSettle();

    // Verify navigation to UserBookingsScreen
    expect(find.text('Alice\'s Bookings'), findsOneWidget);
  });
}
