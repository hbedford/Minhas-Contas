import 'package:flutter/material.dart';

class SchedulesScreen extends StatefulWidget {
  @override
  _SchedulesScreenState createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraint) => SizedBox(
              height: constraint.maxHeight,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 50,
                        width: 10,
                        color: Colors.blue,
                      ))
                    ],
                  )
                ],
              )),
            ));
  }
}
