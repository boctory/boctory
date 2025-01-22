// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:jellypop/main.dart';

void main() {
  testWidgets('Jellyfish app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const JellyfishIdentifierApp());

    // 실제 앱의 기능을 테스트하는 코드로 변경
    expect(find.text('Under the sea!'), findsOneWidget);
    expect(find.text('사진 찾아보기'), findsOneWidget);
  });
}
