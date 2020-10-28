import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/models/card_model.dart';
import 'package:minhasconta/src/screens/home_page_cards.dart';
import 'package:minhasconta/src/screens/projects_screen1.dart';
import 'package:minhasconta/src/utils/bottomnavigation.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  List<CardModel> list = [
    CardModel(color: Colors.green),
    CardModel(color: Colors.blue),
    CardModel(color: Colors.red),
    CardModel(color: Colors.orange),
    null
  ];
  List cardsPositions;
  bool drag = false;
  ScrollController controller;
  final cc = GetIt.I.get<CardsController>();
  double v = 0;
  double size = 0;
  double pointer = 0;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()
      ..addListener(() {
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          controller.animateTo(v - size,
              duration: Duration(milliseconds: 800), curve: Curves.easeOut);
        } else if (controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          controller.animateTo(v + size,
              duration: Duration(milliseconds: 800), curve: Curves.easeOut);
        }
        if (controller.offset != v) setState(() => v = controller.offset);
      });
  }

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      /* appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Dashboard', style: TextStyle(color: Colors.grey[400])),
      ), */
      body: LayoutBuilder(
        builder: (context, constraint) => Stack(children: [
          _page == 0 ? HomePageCards() : ProjectsScreen1(),
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
                          color: Theme.of(context).accentColor,
                        ),
                        Icon(
                          Icons.home,
                          color: Theme.of(context).accentColor,
                        ),
                        Text('A'),
                        IconButton(
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => route.isFirst),
                            icon: Icon(Icons.logout))
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
