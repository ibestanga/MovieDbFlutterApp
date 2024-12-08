import 'package:flutter/material.dart';
import 'package:movie_db_flutter_app/core/di/di.dart';

void main() async {
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello ibra!'),
        ),
      ),
    );
  }
}
