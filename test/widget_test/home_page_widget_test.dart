import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/pages/home_page.dart';

void main() {
  testWidgets('Navigating from HomePage to SecondPage', (WidgetTester tester) async {
    // 1. สร้าง WidgetTester เพื่อทำการทดสอบ
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // 2. หาปุ่มที่จะกดเพื่อนำไปยังหน้าที่สอง
    final buttonFinder = find.text('Go to Second Page');

    // 3. กดปุ่ม
    await tester.tap(buttonFinder);

    // 4. Rebuild the widget after the state has changed.
    await tester.pumpAndSettle(); // รอจนกว่าการเปลี่ยนหน้าจะเสร็จสิ้น

    // 5. ตรวจสอบว่าได้เปลี่ยนไปยัง SecondPage โดยการหาข้อความที่แสดงบน SecondPage
    expect(find.text('Welcome to the Second Page!'), findsOneWidget);
  });
}
