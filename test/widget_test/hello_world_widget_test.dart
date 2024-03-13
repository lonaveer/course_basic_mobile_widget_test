import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/hello_world.dart'; // ชื่อ Project คือ my_flutter_app

void main() {
  testWidgets('HelloWorldWidget has a Text "Hello, World!"', (WidgetTester tester) async {
    // วิธีการสร้าง Widget และเรียกใช้งานในระบบการทดสอบ
    await tester.pumpWidget(MaterialApp(home: HelloWorldWidget()));

    // ตรวจสอบว่ามี Text Widget ที่มีข้อความ "Hello, World!" อยู่หรือไม่
    expect(find.text('Hello, World!'), findsOneWidget);
  });
}