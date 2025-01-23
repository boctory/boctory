import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const JellyfishIdentifierApp());
}

class JellyfishIdentifierApp extends StatelessWidget {
  const JellyfishIdentifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jellyfish Identifier',
      debugShowCheckedModeBanner: false, // 디버깅 모드 배너 끄기
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
