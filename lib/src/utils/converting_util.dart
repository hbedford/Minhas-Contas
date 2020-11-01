import 'package:flutter/material.dart';

class Converting {
  Converting();
  dateToString(DateTime date) {
    return date != null
        ? date.year.toString() +
            '-' +
            date.month.toString().padLeft(2, '0') +
            '-' +
            date.day.toString().padLeft(2, '0')
        : '';
  }

  dateDMtoS(DateTime date) => date != null
      ? date.day.toString().padLeft(2, '0') +
          '/' +
          date.month.toString().padLeft(2, '0')
      : '';
  dateMDtoS(DateTime date) =>
      date.month.toString().padLeft(2, '0') +
      date.day.toString().padLeft(2, '0');
  dateIsToday(DateTime date) {
    if (dateToString(date) == dateToString(DateTime.now()))
      return true;
    else
      return false;
  }

  timeToString(TimeOfDay t) =>
      t.hour.toString().padLeft(2, '0') +
      ':' +
      t.minute.toString().padLeft(2, '0');
}
