import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';
import 'package:minhasconta/src/widgets/project_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<ProjectModel> projects = [];
  final List<CreditCardModel> creditCards = [
    CreditCardModel(id: 1, name: 'Teste', color: null)
  ];
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
                  itemBuilder: (context, int index) => CreditCardWidget(
                        creditCard: creditCards[index],
                      ),
                  itemCount: creditCards.length)),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) =>
                  ProjectWidget(project: projects[index]),
              itemCount: projects.length,
            ),
          ),
        ],
      ),
    );
  }
}
