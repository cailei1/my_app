// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_app/app_lifecycle.dart';
import 'package:my_app/dart_type.dart';
import 'package:my_app/flutter_layout.dart';
import 'package:my_app/gesture_page.dart';
import 'package:my_app/opp.dart';
import 'package:my_app/plugin_use.dart';
import 'package:my_app/stateful_widget.dart';

void main() => runApp(DynamicTheme());

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness=Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dart 基础',
      theme: ThemeData(
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("xixihaha"),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_brightness == Brightness.light) {
                        _brightness = Brightness.dark;
                      } else {
                        _brightness = Brightness.light;
                      }
                    });
                  },
                  child: Text("点我更换主题",
                      style: TextStyle(color: Colors.red, fontSize: 20))),
              RouteNavigator(title: 'Flutter Dart 基础哈哈哈'),
            ],
          )),
      routes: <String, WidgetBuilder>{
        "ful": (BuildContext context) => StatefulGroupTest(),
        "layout": (BuildContext context) => FlutterLayout(),
        "plugin": (BuildContext context) => PluginTest(),
        "gesture": (BuildContext context) => GesturePage()
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
    return Center(
        child: ListView(children: <Widget>[
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
      _item("StatelessWidget与基础布局", FlutterLayout(), "layout"),
      _item("StatelessWidget与基础插件和包的使用", PluginTest(), "plugin"),
      _item("手势操作", GesturePage(), "gesture"),
      _item("app 生命周期监测", AppLifeCycle(), "appLife"),
    ], shrinkWrap: true));
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
