import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/sign_in_form.dart';
import 'mocks/auth_mock.mocks.dart';

void main() {
  // สร้างกลุ่มการทดสอบ (คล้าย describe ของ jest)
  group('SignInForm Tests', () {
    late MockAuth mockAuth; // สร้างตัวแปร mockAuth

    setUp(() { // ตั้งค่าก่อนทำการทดสอบ
      mockAuth = MockAuth(); // สร้าง instance ของ MockAuth
    });

    // Test Case 1 : กรณียังไม่กรอกข้อมูลใดๆ
    testWidgets('Empty email and password shows error messages', (WidgetTester tester) async {
      // สร้าง Widget และเรียกใช้งานในระบบการทดสอบ
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: SignInForm(auth: mockAuth))));

      // จำลองการกดปุ่ม Sign In โดยไม่กรอกข้อมูลใดๆ
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pump();

      // ตรวจสอบข้อความ error สำหรับ email และ password
      expect(find.text('Please enter a valid email'), findsOneWidget);
      expect(find.text('Password must be at least 7 characters long'), findsOneWidget);
    });

    // Test Case 2 : กรณีกรอกข้อมูล email ที่ไม่ถูกต้อง
    testWidgets('Invalid email shows error message', (WidgetTester tester) async {
      // สร้าง Widget และเรียกใช้งานในระบบการทดสอบ
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: SignInForm(auth: mockAuth))));

      // กรอกข้อมูล email ที่ไม่ถูกต้องและ password ที่ถูกต้อง
      await tester.enterText(find.byKey(Key('emailField')), 'test');
      await tester.enterText(find.byKey(Key('passwordField')), '1234567');
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pump();

      // ตรวจสอบข้อความ error สำหรับ email
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    // Test Case 3 : กรณีกรอกข้อมูล password ที่ไม่ถูกต้อง
    testWidgets('Invalid password shows error message', (WidgetTester tester) async {
      // สร้าง Widget และเรียกใช้งานในระบบการทดสอบ
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: SignInForm(auth: mockAuth))));

      // กรอกข้อมูล email ที่ถูกต้องและ password ที่ไม่ถูกต้อง
      await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
      await tester.enterText(find.byKey(Key('passwordField')), '12345'); // น้อยกว่า 7 ตัวอักษร

      // จำลองการกดปุ่ม Sign In
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pump(); // รีเฟรช UI

      // ตรวจสอบข้อความ error สำหรับ password
      expect(find.text('Password must be at least 7 characters long'), findsOneWidget);
    });

    // Test Case 4 : กรณีกรอกข้อมูล email และ password ที่ถูกต้อง
    testWidgets('Valid email and password submits form', (WidgetTester tester) async {
      final String email = 'test@example.com';
      final String password = '1234567';

      // สร้าง Widget และเรียกใช้งานในระบบการทดสอบ
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: SignInForm(auth: mockAuth))));

      // กรอกข้อมูล email และ password ที่ถูกต้อง
      await tester.enterText(find.byKey(Key('emailField')), email);
      await tester.enterText(find.byKey(Key('passwordField')), password);

      // จำลองการกดปุ่ม Sign In
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pump();

      // ตรวจสอบว่ามีการเรียกใช้ signIn หรือไม่
      verify(mockAuth.signIn(email, password)).called(1);
    });
  });
}