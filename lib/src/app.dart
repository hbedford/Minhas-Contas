import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/screens/categories_screen.dart';
import 'package:minhasconta/src/screens/creditcards_screen.dart';
import 'package:minhasconta/src/screens/home_screen1.dart';
import 'package:minhasconta/src/screens/loading_screen.dart';
import 'package:minhasconta/src/screens/login_screen1.dart';

import 'controllers/home_controller.dart';
import 'controllers/user_controller.dart';
import 'screens/card_screen.dart';

class App extends StatelessWidget {
  final h = GetIt.instance<HomeController>();
  final c = GetIt.instance<UserController>();
  final Color deepPurple = Color(0xFF222059);
  final Color menuPurple = Color(0xFF33328B);
  final Color lightPurple = Color(0xFFCFCEF2);
  final Color accentPurple = Color(0xFFA2A0F2);
  final Color buttonPrimary = Color(0xFF22f2dd);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      locale: Locale('pt', 'BR'),
      initialRoute: '/',
      routes: {
        /* 
        '/test': (context) => Testing(), */
        '/': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen1(),
        '/home': (context) => HomeScreen1(),
        '/categories': (context) => CategoriesScreen(),
        '/card': (context) => CardScreen(),
        '/cards': (context) => CreditCardsScreen(),
      },
      /* home: LoginScreen(), */
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: 'Helvetica',
        primaryColor: deepPurple,
        secondaryHeaderColor: lightPurple,
        accentColor: Colors.white,
        bottomAppBarColor: menuPurple,
        backgroundColor: Color(0xffA2A0F2),
        textTheme: TextTheme(
            subtitle1: TextStyle(
              color: Colors.grey[500],
            ),
            subtitle2:
                TextStyle(color: accentPurple, fontWeight: FontWeight.w600),
            headline1: TextStyle(
                color: menuPurple, fontSize: 26, fontWeight: FontWeight.w700),
            headline6: TextStyle(
                color: menuPurple, fontWeight: FontWeight.w700, fontSize: 18),
            button: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
            headline2: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 15,
            )),
        primaryTextTheme: TextTheme(
            headline6: TextStyle(color: menuPurple),
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
