import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minhasconta/src/screens/home_page_cards.dart';
import 'package:minhasconta/src/screens/home_page_projects.dart';
import 'package:minhasconta/src/screens/schedules_screen.dart';
import 'package:minhasconta/src/utils/bottomnavigation.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double size = 0;

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(
        builder: (context, constraint) => Stack(children: [
          _page == 0
              ? HomePageCards()
              : _page == 1
                  ? HomePageProjects()
                  : SchedulesScreen(),
          WidgetsBinding.instance.window.viewInsets.bottom > 0.0
              ? Container()
              : Positioned(
                  bottom: 0,
                  child: Container(
                    child: CurvedNavigationBar(
                      key: _bottomNavigationKey,
                      width: constraint.maxWidth,
                      backgroundColor: Theme.of(context).bottomAppBarColor,
                      animationDuration: Duration(milliseconds: 300),
                      index: _page,
                      onTap: (index) => setState(() => _page = index),
                      items: [
                        Icon(
                            Platform.isAndroid
                                ? Icons.credit_card
                                : CupertinoIcons.creditcard,
                            color: Theme.of(context).accentColor),
                        Icon(
                          Icons.home,
                          color: Theme.of(context).accentColor,
                        ),
                        Text('A', style: TextStyle(color: Colors.white)),
                        IconButton(
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => route.isFirst),
                            icon: Icon(Icons.logout,
                                color: Theme.of(context).accentColor))
                      ],
                      height: Platform.isIOS
                          ? constraint.maxHeight * 0.12
                          : constraint.maxHeight * 0.1,
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
