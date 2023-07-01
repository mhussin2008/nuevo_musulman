import 'package:flutter/material.dart';
import 'package:nuevo_musulman/screens/Splash_Screen.dart';

void main() {
  runApp(const dawaApp());
}

class dawaApp extends StatelessWidget {
  const dawaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(title: 'Nuevo Musulmán'),
    );
  }
}
