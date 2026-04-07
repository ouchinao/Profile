import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/main.dart';

void main() {
  testWidgets('PortfolioApp Animation and UI Smoke Test', (WidgetTester tester) async {
    // 1. Check the initial state immediately after build
    await tester.pumpWidget(const PortfolioApp());

    // Verify that HeroSection exists
    expect(find.byType(HeroSection), findsOneWidget);
    
    // 2. Verify that animations progress and content becomes visible
    // pumpAndSettle() waits for all animations (FadeIn, etc.) to complete
    await tester.pumpAndSettle();

    // Verify text after animations are finished
    expect(find.text('Ouchi Nao'), findsOneWidget);
    expect(find.textContaining('whoami'), findsOneWidget);
    expect(find.textContaining('ls skills/'), findsOneWidget);
    expect(find.textContaining('cat hobby.txt'), findsOneWidget);
    expect(find.textContaining('grep -i "study"'), findsOneWidget);
    expect(find.textContaining('sudo systemctl status qualification'), findsOneWidget);
    expect(find.textContaining('mail -s "Contact"'), findsOneWidget);

    // 3. Verify existence of each section (GlassSection)
    expect(find.byType(GlassSection), findsAtLeastNWidgets(3));
    
    // 4. Verify GitHubButton structure
    expect(find.byType(GitHubButton), findsOneWidget);
    
    // Verify that the button is a square (width=80, height=80)
    final containerFinder = find.descendant(
      of: find.byType(GitHubButton),
      matching: find.byType(Container),
    );
    final Container container = tester.widget(containerFinder);
    expect(container.constraints?.maxWidth, 80);
    expect(container.constraints?.maxHeight, 80);
    
    // Verify that the GitHub logo Image exists
    expect(find.descendant(
      of: find.byType(GitHubButton),
      matching: find.byType(Image),
    ), findsOneWidget);
  });
}
