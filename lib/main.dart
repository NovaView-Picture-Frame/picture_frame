import 'dart:io';
import 'package:flutter/material.dart';

import 'models/photo.dart';
import 'services/config.dart';
import 'widgets/frame.dart';

void main() {
  runApp(const MainApp());
}

Future<Photo> loadPhoto() async {
  final file = File('${Config.dataDir}/cropped/1');
  final bytes = await file.readAsBytes();

  return (
    image: MemoryImage(bytes),
    make: 'Apple',
    model: 'iPhone 15 Pro',
    place: 'Ottawa',
    datetime: DateTime(2024, 12, 20),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'RobotoFlex',
      ),
      home: FutureBuilder<Photo>(
        future: loadPhoto(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final photo = snapshot.data!;

          return Material(
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Frame(photo: photo),
          );
        },
      ),
    );
  }
}
