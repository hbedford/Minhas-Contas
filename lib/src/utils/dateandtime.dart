import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOrTimePicker {
  datePickerIOS(
          {DateTime initial,
          DateTime first,
          DateTime last,
          BuildContext context,
          Function f,
          BoxConstraints constraint,
          Color color = Colors.white}) =>
      showModalBottomSheet(
          context: context,
          builder: (context) => Container(
                height: constraint.maxHeight * 0.2,
                child: CupertinoDatePicker(
                    backgroundColor: color,
                    initialDateTime: initial,
                    maximumDate: last,
                    minimumDate: first,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: f),
              ));
  Future<DateTime> datePicker(
      {BuildContext context,
      DateTime initial,
      DateTime first,
      DateTime last,
      ThemeData theme}) async {
    return await showDatePicker(
        context: context,
        initialDate: initial,
        firstDate: first,
        builder: (context, child) {
          return Theme(
            data: theme ?? Theme.of(context),
            child: child,
            isMaterialAppTheme: false,
          );
        },
        lastDate: last);
  }

  timePickerIOS(
      {Duration initial,
      BuildContext context,
      Function f,
      BoxConstraints constraint,
      Color color = Colors.white}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            color: color,
            height: constraint.maxHeight * 0.2,
            child: CupertinoTimerPicker(
                backgroundColor: color,
                mode: CupertinoTimerPickerMode.hm,
                initialTimerDuration: initial,
                minuteInterval: 5,
                onTimerDurationChanged: f)));
  }

  Future<TimeOfDay> timePicker(
      {BuildContext context, Duration initial, ThemeData theme}) async {
    return await showTimePicker(
        builder: (context, child) => Theme(
              data: theme ?? Theme.of(context),
              child: child,
            ),
        context: context,
        initialTime: TimeOfDay(
            hour: initial.inHours, minute: initial.inMinutes.remainder(60)));
  }
}
