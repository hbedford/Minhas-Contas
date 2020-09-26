import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minhasconta/src/screens/categories_screen.dart';
import 'package:minhasconta/src/screens/home_screen.dart';
import 'package:minhasconta/src/screens/loading_screen.dart';
import 'package:minhasconta/src/screens/login_screen.dart';

import 'controllers/home_controller.dart';
import 'controllers/user_controller.dart';

class App extends StatelessWidget {
  final h = GetIt.instance<HomeController>();
  final c = GetIt.instance<UserController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/categories': (context) => CategoriesScreen(),
      },
      /* home: LoginScreen(), */
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
