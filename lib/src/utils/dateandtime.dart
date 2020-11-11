import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOrTimePicker {
  Future<DateTime> datePicker(
      {BuildContext context,
      DateTime initial,
      DateTime first,
      DateTime last}) async {
    if (Platform.isIOS)
      CupertinoDatePicker(
          initialDateTime: initial,
          maximumDate: last,
          minimumDate: first,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (d) {
            return d;
          });
    else
      return await showDatePicker(
          context: context,
          initialDate: initial,
          firstDate: first,
          builder: (context, child) {
            return Theme(data: Theme.of(context), child: child);
          },
          lastDate: last);
  }
}
