import 'package:flutter/material.dart';

///这里使用了 mixin 混入了 ChangeNotifier，这个类能够帮驻我们自动管理所有听众。
///当调用 notifyListeners() 时，它会通知所有监听者进行刷新。
class CountModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
