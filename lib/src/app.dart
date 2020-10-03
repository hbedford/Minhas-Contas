import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minhasconta/src/screens/categories_screen.dart';
import 'package:minhasconta/src/screens/creditcard_screen.dart';
import 'package:minhasconta/src/screens/creditcards_screen.dart';
import 'package:minhasconta/src/screens/home_screen.dart';
import 'package:minhasconta/src/screens/home_screen1.dart';
import 'package:minhasconta/src/screens/loading_screen.dart';
import 'package:minhasconta/src/screens/login_screen.dart';
import 'package:minhasconta/src/screens/login_screen1.dart';

import 'controllers/home_controller.dart';
import 'controllers/user_controller.dart';

class App extends StatelessWidget {
  final h = GetIt.instance<HomeController>();
  final c = GetIt.instance<UserController>();
  Color deepPurple = Color(0xFF222059);
  Color buttonPrimary = Color(0xFF22f2dd);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen1(),
        '/login': (context) => LoginScreen1(),
        '/home': (context) => HomeScreen1(),
        '/categories': (context) => CategoriesScreen(),
        '/card': (context) => CreditCardScreen(),
        '/cards': (context) => CreditCardsScreen(),
      },
      /* home: LoginScreen(), */
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: 'Helvetica',
        primaryColor: deepPurple,
        accentColor: Colors.white,
        backgroundColor: Color(0xffA2A0F2),
        primaryTextTheme: TextTheme(
            button: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900)),
        buttonTheme: ButtonThemeData(
          minWidth: 150,
          height: 40,
          textTheme: ButtonTextTheme.primary,
          buttonColor: buttonPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        scaffoldBackgroundColor: Color(0xffefefef),
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
