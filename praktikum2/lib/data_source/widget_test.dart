import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Aplikasi Responsive Design dapat ditampilkan',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp() as Widget);

      expect(find.text('Latihan Responsif'), findsOneWidget);
    },
  );
}

class MyApp {
  const MyApp();
}