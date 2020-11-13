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

  Future<TimeOfDay> timePicker({BuildContext context, Duration initial}) async {
    if (Platform.isIOS) {
      CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          initialTimerDuration: initial,
          minuteInterval: 5,
          onTimerDurationChanged: (d) {
            return d;
          });
    } else
      return await showTimePicker(
          builder: (context, child) => Theme(
                data: Theme.of(context),
                child: child,
              ),
          context: context,
          initialTime: TimeOfDay(
              hour: initial.inHours, minute: initial.inMinutes.remainder(60)));
  }
}
