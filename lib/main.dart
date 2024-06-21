import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coding_exam/features/exam/data/datasources/fetch_data_repository_impl.dart';
import 'package:coding_exam/features/exam/presentation/pages/first_screen/provider/fetch_data_provider.dart';
import 'package:coding_exam/features/exam/presentation/pages/homescreen/homescreen.dart';
import 'package:coding_exam/features/exam/presentation/pages/first_screen/fetch_data_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FetchDataProvider(repository: FetchDataRepositoryImpl()),
      child: const MyApp(),
    ),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homescreen(),
      routes: {
        '/second': (context) => const DisplayDataScreen(),
      },
    );
  }
}