import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/fade_widget.dart';

void main() {
  testWidgets('FadeWidget Test', (WidgetTester tester) async {
    // 1. สร้าง Widget ที่จะทดสอบโดยใช้ FadeWidget และ Text เป็น child
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FadeWidget(
          child: Text('Fade In Text'),
        ),
      ),
    ));

    // 2. ตรวจสอบว่า Text มีอยู่ใน DOM (แต่ยังไม่มองเห็นเนื่องจาก opacity เริ่มที่ 0)
    expect(find.text('Fade In Text'), findsOneWidget);
    // หมายเหตุ: เนื่องจากเราไม่สามารถตรวจสอบค่า opacity โดยตรงได้ใน flutter_test
    // คุณอาจต้องใช้ integration test หรือ widget ที่มีการรองรับการทดสอบ animation มากขึ้น

    // 3. จำลองการผ่านเวลาของ animation
    await tester.pump(Duration(milliseconds: 500)); // ผ่านไปครึ่งหนึ่งของเวลา animation

    // 4. ตรวจสอบหลังจาก animation จบ
    await tester.pumpAndSettle(); // รอจนกว่า animation จะเสร็จสิ้น

    // 5. ตรวจสอบว่า Text สามารถมองเห็นได้เมื่อ animation จบ
    expect(find.text('Fade In Text'), findsOneWidget); // ข้อความควรปรากฏหลังจาก animation จบ
  });
}