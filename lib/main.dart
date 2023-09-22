import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_2/configs/constants.dart';
import 'package:task_list_2/handler/task_handler.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskHandler(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      // home: const ListTaskItem(),
    );
  }
}
