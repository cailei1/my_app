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
                child: ListView(children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          "http://www.devio.org/img/avatar.png",
                          width: 100,
                          height: 100,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            hintText: "请输入",
                            hintStyle: TextStyle(fontSize: 15)
                          )
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(color: Colors.lightBlueAccent),
                          child: PageView(
                            children: <Widget>[
                              _item("page1",Colors.deepPurple),
                              _item("page2",Colors.deepPurple),
                              _item("page3",Colors.deepPurple),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
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

  _item(String s, Color color) {
    return Container(
      child: Text(s,style: TextStyle(fontSize: 20,color: Colors.white),),
      decoration: BoxDecoration(color:color ),
      alignment: Alignment.center,
    );

  }
}
