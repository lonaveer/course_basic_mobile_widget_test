import 'package:flutter/material.dart';             // เนื่องจากมีการใช้ Icons จึงต้อง Import material.dart ด้วย
import 'package:flutter_test/flutter_test.dart';    // Import flutter_test เพื่อใช้ความสามารถ 'testWidgets'
import 'package:my_flutter_app/main.dart';          // Import ไฟล์ main.dart ที่ต้องการจะทดสอบ

void main() {
  testWidgets('My First Widget Test', (WidgetTester tester) async {
    // โหลด Widget ที่ต้องการทดสอบลงในตัวจำลองการทดสอบ
    await tester.pumpWidget(const MyApp());

    // ค่า Counter เริ่มต้น : ควรเป็น 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // จำลองการแตะบนปุ่ม
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // รีเฟรช UI

    // ตรวจสอบผลลัพธ์หลังจากการโต้ตอบ
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}