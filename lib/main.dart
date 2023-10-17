import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.purple,
          colorScheme: const ColorScheme.dark()),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calculator'),
          ),
          body: const HomePage()),
    );
  }
}
