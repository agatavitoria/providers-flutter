import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  String _name, _lastName;
  int _age;

  String get name => _name;
  String get lastName => _lastName;
  int get age => _age;

  void setAge(int age) {
    this._age = age;
    notifyListeners();
  }

  void setName(String name) {
    this._name = name;
    notifyListeners();
  }

  void setLastName(String lastName) {
    this._lastName = lastName;
    notifyListeners();
  }

  void logOut() {
    this._name = null;
    this._lastName = null;
    this._age = null;
    notifyListeners();
  }
}