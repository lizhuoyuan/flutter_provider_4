import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterprovider/bean/user.dart';
import 'package:flutterprovider/providers/user_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserModel>().getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('${context.watch<UserModel>()?.user?.age}'),
          Selector<UserModel, int>(
            ///value 是下面 selector的返回值
            builder: (BuildContext context, value, Widget child) {
              print('- builder 1----$value');
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  child,
                  Text('$value'),
                ],
              );
            },
            selector: (BuildContext context, UserModel userModel) {
              print('selector 1');
              return userModel.score;
            },
            child: Text('child:成绩:'),
          ),
          Selector(
            builder: (context, value, child) {
              print('builder2: $value');
              return Container(
                child: Row(
                  children: [
                    Text('s 2 : $value')
                  ],
                ),
              );
            },
            selector: (_,UserModel userModel) {
              print('selector 2 ');
              return userModel.user.toString();
            },
          ),
          ElevatedButton(
              child: Text('refresh User'),
              onPressed: () =>
                  Provider.of<UserModel>(context, listen: false).refreshUser(User(2, 'newName', Random().nextInt(12)))
              ),
          ElevatedButton(
            onPressed: () {
              context.read<UserModel>().increment();
            },
            child: Text('change score'),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<UserModel>().increment();
        },
      ),
    );
  }
}
