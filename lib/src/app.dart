import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              textTheme: TextTheme(
                  headline6: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)))),
    );
  }
}
