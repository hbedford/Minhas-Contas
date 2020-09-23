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

class StepsCategory extends StatefulWidget {
  @override
  _StepsCategoryState createState() => _StepsCategoryState();
}

class _StepsCategoryState extends State<StepsCategory> {
  final c = GetIt.instance<CategoryController>();
  TextEditingController name = TextEditingController();

  List<Color> list = [
    Colors.orange,
    Colors.deepOrange,
    Colors.purple,
    Colors.pink,
    Colors.red
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
            builder: (_) => c.category.step == 0
                ? step0(context, constraints)
                : c.category.step == 1
                    ? step1(context, constraints)
                    : Container()),
      ),
    );
  }

  step0(BuildContext context, BoxConstraints constraints) => Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Pretende criar uma'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () => c.category.selectType(false),
                  child: Text('Categoria'),
                ),
                RaisedButton(
                    onPressed: c.categories.length > 0
                        ? () => c.category.selectType(true)
                        : null,
                    child: Text('SubCategoria'))
              ],
            ),
            Container()
          ],
        ),
      );

  step1(BuildContext context, BoxConstraints constraints) => Container(
        height: constraints.maxHeight * 0.4,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(c.category.type == true ? 'SubCategoria' : 'Categoria'),
              ],
            ),
            Visibility(
                visible: c.category.type,
                child: DropdownButton(
                    items: c.categories
                        .map((item) => DropdownMenuItem(child: Text('A')))
                        .toList(),
                    onChanged: null)),
            Text('De um nome'),
            TextField(
              controller: name,
            ),
            ListTile(
              title: Text(
                'Escolha uma cor',
              ),
              onTap: () => showDialogColor(context),
              trailing: CircleAvatar(
                backgroundColor: c.category.color,
              ),
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
                      Spacer(),
                      Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 2, crossAxisCount: 10),
                              itemCount: list.length,
                              itemBuilder: (context, int index) => CircleAvatar(
                                    backgroundColor: list[index],
                                  ))),
                      Spacer(),
                    ],
                  )),
                ),
              ),
            ));
  }
}
