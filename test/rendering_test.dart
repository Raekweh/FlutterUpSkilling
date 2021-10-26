import 'package:ParkingApp/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Given that the user loads the application when the user launches the application then the user should be able to see the application render',
      (WidgetTester tester) async {
    await tester.pumpWidget(myApp());
  });
}
