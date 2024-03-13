import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/welcome.dart';

void main() {
  testWidgets('WelcomeWidget shows welcome message after submitting name', (WidgetTester tester) async {
    // ครอบคลุม WelcomeWidget ด้วย MaterialApp และ Scaffold เพื่อให้เข้ากับ Material Design requirements
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: WelcomeWidget(),
      ),
    ));

    // จำลองการกรอกข้อมูล "John Doe" ลงใน TextField
    await tester.enterText(find.byKey(Key('nameField')), 'John Doe');

    // จำลองการกดปุ่ม "Submit"
    await tester.tap(find.byKey(Key('submitButton')));
    await tester.pump(); // ปรับปรุง UI หลังจากการกดปุ่ม

    // ตรวจสอบว่าข้อความยินดีแสดงถูกต้องหลังจากการส่งข้อมูล
    expect(find.text('Welcome, John Doe!'), findsOneWidget);
  });
}