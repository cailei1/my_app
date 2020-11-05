import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLifeCycle extends StatefulWidget {
  @override
  _AppLifeCycleState createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 应用生命周期"),
        leading: BackButton(),
      ),
      body: Container(
        child: Text("Flutter 应用生命周期"),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print("state=$state");
    if(state==AppLifecycleState.paused){
      print("app 进入后台");
    }else if(state==AppLifecycleState.resumed){
      print("app 进入前台");
    }

  }
}
