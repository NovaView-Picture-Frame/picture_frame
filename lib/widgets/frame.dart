import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Center(
        child: ElevatedButton(
          onPressed: () => setState(() => count++),
          child: Text('$count'),
        ),
      )
    );
  }
}
