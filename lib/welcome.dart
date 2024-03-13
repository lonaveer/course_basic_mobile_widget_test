import 'package:flutter/material.dart';

void main() => runApp(WelcomeApp());

class WelcomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: WelcomeWidget(),
        ),
      ),
    );
  }
}

class WelcomeWidget extends StatefulWidget {
  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  final TextEditingController _controller = TextEditingController();
  String _welcomeMessage = '';

  void _sayHello() {
    setState(() {
      _welcomeMessage = 'Welcome, ${_controller.text}!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          key: Key('nameField'),
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Enter your name',
          ),
        ),
        ElevatedButton(
          key: Key('submitButton'),
          onPressed: _sayHello,
          child: Text('Submit'),
        ),
        Text(
          _welcomeMessage,
          key: Key('welcomeMessage'),
        ),
      ],
    );
  }
}
