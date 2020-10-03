import 'package:flutter/material.dart';

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: Image.asset('assets/drawer.png'),
      ),
    );
  }
}
