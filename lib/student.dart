import 'package:flutter/material.dart';

class Student with ChangeNotifier {
  String _name;
  int _rollNo;

  Student({required String name, required int rollNo})
      : _name = name,
        _rollNo = rollNo;

  int get rollNo => _rollNo;

  set rollNo(int value) {
    if (value > 0) {
      _rollNo = value;
      notifyListeners();
    }
  }

  String get name => _name;

  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
      notifyListeners();
    }
  }

  @override
  String toString() {
    return 'RollNo : $_rollNo , Name: $_name';
  }
}
