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
      body: Observer(
        builder: (_) => ListView.builder(
            itemCount: c.categories.length,
            itemBuilder: (context, int index) => item(c.categories[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => initiateNewCategory(context),
        child: Icon(Icons.add),
      ),
    );
  }

  initiateNewCategory(BuildContext context) {
    c.changeCategory(CategoryModel());
    c.changeStep(0);
    showDialog(context);
  }

  showDialog(BuildContext context) => showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => StepsCategory());
  item(CategoryModel category) => Container(child: Text(category.name));
}

class StepsCategory extends StatefulWidget {
  @override
  _StepsCategoryState createState() => _StepsCategoryState();
}

class _StepsCategoryState extends State<StepsCategory> {
  final c = GetIt.instance<CategoryController>();
  TextEditingController name = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        padding: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * 0.03,
            horizontal: constraints.maxWidth * 0.04),
        child: Observer(
            builder: (_) => c.step == 0
                ? step0(context, constraints)
                : c.step == 1
                    ? step1(context, constraints)
                    : Container()),
      ),
    );
  }

  step0(BuildContext context, BoxConstraints constraints) => Container(
        height: 120,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Pretende criar uma'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => c.selectTypeStep(true),
                  child: Text('Categoria'),
                ),
                ElevatedButton(
                    onPressed: c.categories.length > 0
                        ? () => c.selectTypeStep(false)
                        : null,
                    child: Text('SubCategoria'))
              ],
            ),
            Container()
          ],
        ),
      );

  step1(BuildContext context, BoxConstraints constraints) => Container(
        height: constraints.maxHeight * 0.6,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(c.type ? 'Categoria' : 'SubCategoria'),
              ],
            ),
            Visibility(
                visible: !c.type,
                child: DropdownButton(
                    items: c.categories
                        .map((item) => DropdownMenuItem(child: Text('A')))
                        .toList(),
                    onChanged: null)),
            Text('De um nome'),
            TextField(
              controller: name,
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0,
              child: Column(children: [
                ListTile(
                  title: Text(
                    'Escolha uma cor',
                  ),
                  onTap: () => showDialogColor(context),
                  trailing: CircleAvatar(
                    backgroundColor: c.category.color,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () => c.saveCategory(name.text, context),
                        child: Text('Salvar')),
                    ElevatedButton(
                        onPressed: () => c.cancelCategory(context),
                        child: Text('Cancelar'))
                  ],
                ),
              ]),
            )
          ],
        ),
      );

  showDialogColor(BuildContext context) {
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
                                      c.category.changeColor(list[index]);
                                      Navigator.pop(context);
                                    })),
                          ),
                        ],
                      )),
                ),
              ),
            ));
  }
}
