import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/user_controller.dart';
import 'package:minhasconta/src/widgets/background.dart';

class LoadingScreen extends StatelessWidget {
  final c = GetIt.instance<UserController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => c.getInfosShared(context));
    return BackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Text('iDeck',
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
      ),
    );
  }
}
