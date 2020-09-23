import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/category_controller.dart';
import 'package:minhasconta/src/models/category_model.dart';

class CategoriesScreen extends StatelessWidget {
  final c = GetIt.instance<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categorias')),
      body: ListView.builder(
          itemCount: c.categories.length,
          itemBuilder: (context, int index) => item(c.categories[index])),
      floatingActionButton: FloatingActionButton(
        onPressed: () => initiateNewCategory(context),
        child: Icon(Icons.add),
      ),
    );
  }

  initiateNewCategory(BuildContext context) {
    c.changeCategory(CategoryModel(step: 0));
    showDialog(context);
  }

  showDialog(BuildContext context) => showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => StepsCategory());
  item(CategoryModel category) => Container(child: Text(category.name));
}

class StepsCategory extends StatelessWidget {
  final c = GetIt.instance<CategoryController>();
  List<Color> list = [
    Colors.orange,
    Colors.deepOrange,
    Colors.purple,
    Colors.pink,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => c.category.step == 0
            ? step0()
            : c.category.step == 1 ? step1(context) : Container());
  }

  step0() => Container(
        height: 120,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(25)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('Pretende criar uma'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: () => c.category.selectType(false),
                child: Text('Categoria'),
              ),
              RaisedButton(
                  onPressed: () => c.category.selectType(true),
                  child: Text('SubCategoria'))
            ],
          ),
          Container()
        ]),
      );
  step1(BuildContext context) => Container(
        height: 200,
        color: Colors.blue,
        child: Column(
          children: [
            Text(c.category.type == true ? 'SubCategoria' : 'Categoria'),
            Text('De um nome'),
            TextField(),
            ListTile(
              title: Text(
                'Escolha uma cor',
              ),
              onTap: () => showDialogColor(context),
            )
          ],
        ),
      );
  showDialogColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => LayoutBuilder(
              builder: (context, constraint) => Center(
                child: Container(
                  height: constraint.maxHeight * 0.4,
                  child: Card(
                      child: Column(
                    children: [
                      Text('Escolha uma cor'),
                      Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: list.length,
                              itemBuilder: (context, int index) => CircleAvatar(
                                    backgroundColor: list[index],
                                  )))
                    ],
                  )),
                ),
              ),
            ));
  }
}
