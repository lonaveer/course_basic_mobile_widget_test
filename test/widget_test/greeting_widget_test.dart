import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/greeting.dart';

void main() {
  testWidgets('GreetingWidget changes text when button is pressed', (WidgetTester tester) async {
    // สร้างและแสดง Widget
    await tester.pumpWidget(MaterialApp(home: GreetingWidget()));

    // ตรวจสอบข้อความเริ่มต้น
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('Goodbye'), findsNothing);

    // จำลองการกดปุ่ม
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // สำคัญ: ปรับปรุง UI หลังจากการกดปุ่ม

    // ตรวจสอบข้อความหลังจากการกดปุ่ม
    expect(find.text('Hello'), findsNothing);
    expect(find.text('Goodbye'), findsOneWidget);
  });
}