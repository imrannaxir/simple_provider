import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';
import 'home_page.dart';
import 'student.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Student>(
            create: (context) => Student(
              name: 'Imran',
              rollNo: 137,
            ),
          ),
          ChangeNotifierProvider<Counter>(
            create: (context) => Counter(),
          ),
        ],
        child: const MyHomePage(title: 'Flutter Developer'),
      ),
    );
  }
}
