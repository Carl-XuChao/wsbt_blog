import 'package:flutter/material.dart';
import 'package:state_manager/component/pig.dart';
import 'package:state_manager/page/home.dart';
import 'package:state_manager/page/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyColor(
      color: Colors.red,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: TestPage(),
      ),
    );
  }
}
