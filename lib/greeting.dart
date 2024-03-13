import 'package:flutter/material.dart';

void main() {
  runApp(GreetingApp());
}

class GreetingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GreetingWidget(),
    );
  }
}

class GreetingWidget extends StatefulWidget {
  @override
  _GreetingWidgetState createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> {
  String _greeting = 'Hello';

  void _changeGreeting() {
    setState(() {
      _greeting = 'Goodbye';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_greeting),
            ElevatedButton(
              onPressed: _changeGreeting,
              child: Text('Change Greeting'),
            ),
          ],
        ),
      ),
    );
  }
}