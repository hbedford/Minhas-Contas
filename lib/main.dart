import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/category_controller.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/home_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/controllers/projects_controller.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/card_model.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:minhasconta/src/models/user_model.dart';
import 'package:mobx/mobx.dart';

import 'src/app.dart';
/* 
import 'src/controllers/card_controller.dart'; */
import 'src/controllers/user_controller.dart';
import 'src/models/payment_model.dart';

void main() async {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController());
  /*  getIt.registerSingleton<CardController>(CardController()); */
  getIt.registerSingleton<UserController>(UserController(user: UserModel()));
  getIt.registerSingleton<CategoryController>(
      CategoryController(categories: [].asObservable()));
  getIt.registerSingleton<PaymentController>(PaymentController());
  getIt.registerSingleton<ProjectsController>(
      ProjectsController(projects: [].asObservable()));
  getIt.registerSingleton<CardsController>(
    CardsController(
      card: CardModel(),
      cards: ObservableList.of(
        [
          CardModel(
            id: 1,
            name: 'Itau Card',
            color: Colors.green,
            payments: ObservableList.of(
              [
                PaymentModel(
                    category:
                        CategoryModel(color: Colors.green, name: 'Mercado'),
                    name: 'Compras do churrasco de final de semana',
                    date: DateTime.utc(2020, 09, 11),
                    value: 200.0),
                PaymentModel(
                    category:
                        CategoryModel(color: Colors.green, name: 'Mercado'),
                    name: 'Compras da semana',
                    date: DateTime.utc(2020, 09, 06),
                    value: 250.0),
                PaymentModel(
                    category:
                        CategoryModel(color: Colors.green, name: 'Mercado'),
                    name: 'Compras do mes',
                    date: DateTime.utc(2020, 09, 09),
                    value: 200.0),
                PaymentModel(
                    category:
                        CategoryModel(color: Colors.green, name: 'Alimentação'),
                    name: 'McDonald',
                    date: DateTime.utc(2020, 09, 05),
                    value: 200.0),
                PaymentModel(
                    category:
                        CategoryModel(color: Colors.green, name: 'Alimentação'),
                    name: 'BurguerKing',
                    date: DateTime.utc(2020, 09, 05),
                    value: 10.0),
                PaymentModel(
                    category:
                        CategoryModel(color: Colors.green, name: 'Alimentação'),
                    name: 'Bobs',
                    date: DateTime.utc(2020, 09, 07),
                    value: 203.0),
                PaymentModel(
                    category:
                        CategoryModel(color: Colors.green, name: 'Eletronicos'),
                    name: 'iphone',
                    date: DateTime.utc(2020, 09, 07),
                    value: 203.0),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  runApp(App());

  final dbHelper = DatabaseHelper.instance;
  dbHelper.database;
}
