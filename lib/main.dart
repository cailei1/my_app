import 'package:flutter/material.dart';
import 'package:my_app/dart_type.dart';
import 'package:my_app/opp.dart';
import 'package:my_app/plugin_use.dart';
import 'package:my_app/stateful_widget.dart';

void main() => runApp(StatefulGroupTest());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dart 基础',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Dart 基础哈h哈哈'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            DartType()
          ],
        )
      ),
    );
  }

  void _oopLearn(){
    Logger logger1=Logger();
    Logger logger2=Logger();
    print(logger1==logger2);
  }
}
