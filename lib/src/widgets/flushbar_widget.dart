import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar flushBar({String title, String message = '', Color color}) => Flushbar(
      title: title,
      messageText: Text(message),
      backgroundColor: color,
      flushbarStyle: FlushbarStyle.FLOATING,
      padding: EdgeInsets.all(8),
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
