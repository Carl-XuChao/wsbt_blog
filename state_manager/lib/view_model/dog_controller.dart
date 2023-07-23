import 'package:flutter/cupertino.dart';

class DogController extends ChangeNotifier {
  double _value = 0;

  double get value => _value;

  set value(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}
