import 'package:flutter/material.dart';
import 'package:my_app/dart_type.dart';
import 'package:my_app/flutter_layout.dart';
import 'package:my_app/opp.dart';
import 'package:my_app/plugin_use.dart';
import 'package:my_app/stateful_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dart 基础',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouteNavigator(title: 'Flutter Dart 基础哈哈哈'),
      routes: <String, WidgetBuilder>{
        "ful": (BuildContext context) => StatefulGroupTest(),
        "layout": (BuildContext context) => FlutterLayout(),
        "plugin": (BuildContext context) => PluginTest(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  RouteNavigator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _oopLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text("${byName ? "" : "不"}通过路由名跳转"),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            },
          ),
          _item("StatelessWidget与基础组件", StatefulGroupTest(), "ful"),
          _item("StatelessWidget与基础布局", StatefulGroupTest(), "layout"),
          _item("StatelessWidget与基础插件和包的使用", StatefulGroupTest(), "plugin"),
        ],
      )),
    );
  }

  void _oopLearn() {
    Logger logger1 = Logger();
    Logger logger2 = Logger();
    print(logger1 == logger2);
  }

  _item(String title, Widget page, String routeName) {
    return Container(
      child: RaisedButton(
        child: Text(title),
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
      ),
    );
  }
}
