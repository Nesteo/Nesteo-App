import 'package:flutter_test/flutter_test.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:playground/main.dart';

void main() {
  testWidgets('Button is existing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final buttonFinder = find.text('Add new Box!');
    
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('Map is existing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final mapFinder = find.byType(GoogleMap);

    expect(mapFinder, findsOneWidget);
  });
}