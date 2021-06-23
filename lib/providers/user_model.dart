import 'package:flutter/cupertino.dart';
import 'package:flutterprovider/bean/user.dart';

class UserModel with ChangeNotifier {
  User _user;

  User get user => _user;

  int _score = 0;

  int get score => _score;

  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 1));
    User user = User(1, 'zhuo', 18);
    _user = user;
    notifyListeners();
  }

  void refreshUser(User user) {
    _user = user;
    notifyListeners();
  }

  void increment() {
    _score++;
    notifyListeners();
  }
}
