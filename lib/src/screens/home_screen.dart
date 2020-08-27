import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Minhas Contas'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) => Container(),
              itemCount: 2,
            ),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) => Container(),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
