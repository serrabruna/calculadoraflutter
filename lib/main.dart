import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Calculadora(title: 'Flutter Demo Home Page'),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});

  final String title;

  @override
  State<Calculadora> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.blue[100],
            ),
          ),
        ],
      ),
    );
  }
}
