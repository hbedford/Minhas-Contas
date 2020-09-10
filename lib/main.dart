import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/home_controller.dart';

import 'src/app.dart';
import 'src/controllers/creditcard_controller.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<CreditCardController>(CreditCardController());
  runApp(App());
}
