import 'package:flutter/material.dart';

class SelectColor {
  List<Color> list = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.brown,
    Colors.grey
  ];
  showDialogColor(BuildContext context, Function f) {
    showDialog(
        context: context,
        builder: (context) => LayoutBuilder(
              builder: (context, constraint) => Center(
                child: Card(
                  child: Container(
                      height: constraint.maxHeight * 0.4,
                      width: constraint.maxWidth * 0.7,
                      padding: EdgeInsets.symmetric(
                          horizontal: constraint.maxWidth * 0.1),
                      child: Column(
                        children: [
                          Flexible(
                            child: Text('Escolha uma cor'),
                          ),
                          Expanded(
                            flex: 4,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 4,
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 2),
                                itemCount: list.length,
                                itemBuilder: (context, int index) => InkWell(
                                    child: CircleAvatar(
                                      radius: constraint.maxHeight * 0.01,
                                      backgroundColor: list[index],
                                    ),
                                    onTap: () {
                                      f(list[index]);
                                    })),
                          ),
                        ],
                      )),
                ),
              ),
            ));
  }
}
