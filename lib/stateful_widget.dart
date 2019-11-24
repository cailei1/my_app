import 'package:flutter/material.dart';

class StatefulGroupTest extends StatefulWidget {
  @override
  _StatefulGroupTestState createState() => _StatefulGroupTestState();
}

class _StatefulGroupTestState extends State<StatefulGroupTest> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "statefulWidget与基础组件",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("statefulWidget与基础组件"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("点我"),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  title: Text("首页")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  title: Text("列表"))
            ]),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child:
                ListView(children:[Text("路飞"),Text("乔巴"),Text("娜美")]),
                onRefresh: _refreshCallBack,
              )
            : Text("列表界面"),
      ),
    );
  }

  Future<Null> _refreshCallBack() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }
}
