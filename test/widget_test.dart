import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_briefing_companion/main.dart';

void main() {
  testWidgets('renders briefing companion shell', (tester) async {
    await tester.pumpWidget(const BriefingCompanionApp());

    expect(find.text('Strategy now has\nan on-device control room.'), findsOneWidget);
    expect(find.text('Executive Briefing'), findsOneWidget);
    expect(find.text('Signals'), findsOneWidget);
    expect(find.text('Actions'), findsOneWidget);
    expect(find.text('Anatomy'), findsOneWidget);

    await tester.tap(find.text('Anatomy'));
    await tester.pumpAndSettle();

    expect(find.text('Built as a real Flutter surface, not a screenshot shell.'), findsOneWidget);
  });
}
