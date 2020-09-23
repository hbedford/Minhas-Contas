import 'package:flutter/material.dart';

class ConfigsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, '/categories'),
                title: Text('Editar Categorias'),
              ),
            ),
            Container(
              color: Colors.green,
              child: ListTile(
                title: Text('Modo noturno'),
              ),
            ),
            Container(
              color: Colors.green,
              child: ListTile(
                title: Text('Dados da conta'),
              ),
            ),
            Container(
              color: Colors.green,
              child: ListTile(
                title: Text('Deslogar da conta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
