import 'package:flutter/material.dart';

void main() {
  runApp(FadeWidgetApp());
}

class FadeWidgetApp extends StatelessWidget {
  const FadeWidgetApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FadeWidget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FadeWidget(child: Text('Fade In Text')),
    );
  }
}

class FadeWidget extends StatefulWidget {
  final Widget child;

  FadeWidget({Key? key, required this.child}) : super(key: key);

  @override
  _FadeWidgetState createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!);

    _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation!,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
