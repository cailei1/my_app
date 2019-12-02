import 'package:flutter/material.dart';

class FlutterLayout extends StatefulWidget {
  @override
  _FlutterLayoutState createState() => _FlutterLayoutState();
}

class _FlutterLayoutState extends State<FlutterLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "布局开发",
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
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(
                          "http://www.devio.org/img/avatar.png",
                          width: 100,
                          height: 100,
                        ),
                      ), //ClipOval 裁剪成圆形
                      Container(
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          child: Opacity(
                            //透明度 百分之60
                            opacity: 0.6,
                            child: Image.network(
                              "http://www.devio.org/img/avatar.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ), //裁一个圆角边框的矩形 圆角属性必选
                      )
                    ],
                  ),
                  Image.network(
                    "http://www.devio.org/img/avatar.png",
                    width: 100,
                    height: 100,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          hintText: "请输入",
                          hintStyle: TextStyle(fontSize: 15))),
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration:
                    BoxDecoration(color: Colors.lightBlueAccent),
                    child: PhysicalModel(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      clipBehavior: Clip.antiAlias, //裁切的边抗锯齿
                      child: PageView(
                        children: <Widget>[
                          _item("page1", Colors.deepPurple),
                          _item("page2", Colors.deepPurple),
                          _item("page3", Colors.deepPurple),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        child: Align(alignment: Alignment.center,
                          child: Text("宽度充满屏幕"),),
                        width: double.infinity,
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Image.network(
                  "http://www.devio.org/img/avatar.png",
                  width: 100,
                  height: 100,
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child:  Image.network(
                    "http://www.devio.org/img/avatar.png",
                    width: 36,
                    height: 36,
                  ),
                )

              ],
            ),
            Wrap(  //从左到右依次排列，并换行
              spacing: 8, //水平间距
              runSpacing: 6, //垂直间距
              children: <Widget>[
                _chip("Flutter"),
                _chip("进阶"),
                _chip("实战"),
                _chip("携程"),
                _chip("App "),
              ],
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
      child: Text(
        s,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
    );
  }

  _chip(String lable) {
    return Chip(label: Text(lable),
       avatar: CircleAvatar(
         backgroundColor: Colors.blue.shade900,
          child: Text(
            lable.substring( 0,1),
            style: TextStyle(fontSize: 10),

          ),
       ),
    );
  }
}
