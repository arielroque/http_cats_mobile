import 'package:flutter_clean_architecture/app/core/widgets/spinner/spinner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  setUp(() async {});

  testWidgets('Insert default spinner', (WidgetTester tester) async {
    await tester.pumpWidget(const Spinner());
    final spinner = find.byType(Spinner);
    expect(spinner, findsOneWidget);
  });

  testWidgets('Add message text', (WidgetTester tester) async {
    await tester.pumpWidget(const Spinner(
      size: 20,
      message: "Loading...",
    ));
    final messageFinder = find.text('Loading...');
    expect(messageFinder, findsOneWidget);
  });
}
