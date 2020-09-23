import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/user_controller.dart';

class LoadingScreen extends StatelessWidget {
  final c = GetIt.instance<UserController>();
  getInfos(BuildContext context) async {
    await c.getInfosShared();
    print('a');
    c.startLogIn(context);
  }

  @override
  Widget build(BuildContext context) {
    getInfos(context);
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
