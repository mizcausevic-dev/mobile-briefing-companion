import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_briefing_companion/main.dart';

void main() {
  testWidgets('renders briefing companion shell', (tester) async {
    await tester.pumpWidget(const BriefingCompanionApp());

    expect(find.text('Mobile Briefing\nCompanion'), findsOneWidget);
    expect(find.text('Briefing packs'), findsOneWidget);
    expect(find.text('Board'), findsOneWidget);
    expect(find.text('Signals'), findsOneWidget);
    expect(find.text('Actions'), findsOneWidget);
  });
}
