import 'package:flutter/material.dart';

import 'widgets/frame.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Material(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))
        ),
        clipBehavior: Clip.antiAlias,
        child: CounterWidget(),
      )
    );
  }
}
