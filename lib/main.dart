import 'package:chicly/screens/auth/login_screen.dart';
import 'package:chicly/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chicly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Light theme
      darkTheme: AppTheme.darkTheme, // Dark theme
      themeMode: ThemeMode.system, // Use system theme mode
      home: const LoginScreen(),
    );
  }
}
