import 'package:flutter/material.dart';
import 'package:flutter_api_call/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:const Color.fromARGB(255, 109, 106, 116),
        colorScheme: ColorScheme.fromSeed(seedColor : const Color.fromARGB(255, 105, 70, 165)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

