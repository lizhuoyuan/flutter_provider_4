import 'package:flutter/material.dart';
import 'package:flutterprovider/bean/user.dart';
import 'package:flutterprovider/providers/count_model.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Container(
          child: Column(
        children: [
          Text('count:${context.watch<CountModel>().count}'),
          Text('name:${context.watch<UserModel>().user?.name}'),
          Text('以下为Selector 和 Consumer'),
          Selector(
            ///value 是下面 selector的返回值
            builder: (BuildContext context, value, Widget child) {
              print('-----$value');
              return Column(
                children: [value, child],
              );
            },
            selector: (BuildContext context, UserModel userModel) {
              return Text('${userModel.user?.age}');
            },
            child: Text('child:上下都是user的年龄'),
          ),
          Consumer<UserModel>(
            builder: (BuildContext context, value, Widget child) {
              return Text('${value.user?.age}');
            },
          ),
          RaisedButton(
              child: Text('refresh User'),
              onPressed: () => Provider.of<UserModel>(context, listen: false)
                  .refreshUser(
                      User(2, 'newName', context.read<CountModel>().count))
              // context.read<UserModel>().refreshUser(User(2, 'newName', 22)),
              )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CountModel>().increment();
        },
      ),
    );
  }
}
