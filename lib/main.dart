import 'package:flutter/material.dart';
import 'package:expense_tracking_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        
      ),
      title: 'Expense Tracker',
      home: const WelcomeScreen(),
    );
  }
}
