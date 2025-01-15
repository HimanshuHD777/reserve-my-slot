import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lib/service_list_screen.dart';

void main() {
  testWidgets('Displays services and allows navigation to booking screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ServiceListScreen()));

    // Verify services are displayed
    expect(find.text('Salon Bliss'), findsOneWidget);
    expect(find.text('Spa Haven'), findsOneWidget);

    // Tap on a service
    await tester.tap(find.text('Salon Bliss'));
    await tester.pumpAndSettle();

    // Verify navigation to BookingScreen
    expect(find.text('Book Service'), findsOneWidget);
  });
}
