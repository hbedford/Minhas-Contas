class Compare {
  Map<String, dynamic> values(List values, double result, double size) {
    double scroll;
    int index;
    for (dynamic element in values) {
      int v = values.indexOf(element);
      if ((v + 1.toDouble()) <= values.length - 1) {
        if (v * size <= result && result <= (v + 1) * size) {
          double first = result - (v * size);
          double second = ((v + 1) * size) - result;
          print(first);
          print(second);
          scroll = (first < second ? v * size : (v + 1) * size);
          index = (first < second) ? v : v + 1;
          break;
        }
      } else {
        scroll = v * size;
        index = v;
      }
    }
    return {'scroll': scroll, 'index': index};
  }
}
