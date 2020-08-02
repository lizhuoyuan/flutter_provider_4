import 'package:flutter/cupertino.dart';
import 'package:flutterprovider/bean/user.dart';

class UserModel with ChangeNotifier {
  User _user;

  User get user => _user;

  void getData() async {
    await Future.delayed(Duration(seconds: 3));
    User user = User(1, 'zhuo', 18);
    _user = user;
    print('net ok');
    notifyListeners();
  }

  void refreshUser(User user) {
    _user = user;
    notifyListeners();
  }
}
