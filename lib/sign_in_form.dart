import 'package:flutter/material.dart';
import 'package:my_flutter_app/class/auth_class.dart';

void main() => runApp(SignInFormApp());

class SignInFormApp extends StatelessWidget {
  const SignInFormApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SignInForm(auth: Auth()),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  final Auth auth;
  const SignInForm({Key? key, required this.auth}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate(); // ตรวจสอบความถูกต้องของข้อมูลในฟอร์ม
    if (isValid!) {
      _formKey.currentState!.save(); // บันทึกข้อมูลที่กรอกในฟอร์ม
      print('Email: $_email, Password: $_password'); // แสดงข้อมูลที่กรอก
      widget.auth.signIn(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  key: Key('emailField'),
                  validator: (value) => !value!.contains('@') ? 'Please enter a valid email' : null,
                  onSaved: (value) => _email = value!,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  key: Key('passwordField'),
                  validator: (value) => value!.length < 7 ? 'Password must be at least 7 characters long' : null,
                  onSaved: (value) => _password = value!,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  key: Key('signInButton'),
                  onPressed: _trySubmit,
                  child: Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
