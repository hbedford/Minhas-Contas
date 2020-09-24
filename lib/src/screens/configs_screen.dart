import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/category_controller.dart';
import 'package:minhasconta/src/controllers/user_controller.dart';

class ConfigsScreen extends StatelessWidget {
  final c = GetIt.instance<UserController>();
  final cc = GetIt.instance<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              child: ListTile(
                onTap: () {
                  cc.getCategories();
                  Navigator.pushNamed(context, '/categories');
                },
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
              color: Colors.red,
              child: ListTile(
                onTap: () => c.logOut(context),
                title: Text('Deslogar da conta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
