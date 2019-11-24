

import 'package:flutter/material.dart';

class PluginTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=TextStyle(fontSize: 19
    ,color: Colors.red);
    return MaterialApp(
      title: "我是路飞哈哈哈",
      //标题主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("statelessWidget与基础组件")),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text("I am Test",style: textStyle,),
              Icon(Icons.android,size: 50,color: Colors.red,),
              //关闭按钮
              CloseButton(),
              //返回按钮
              BackButton(),
              Chip(
                //头像
                avatar: Icon(Icons.people),
                label: Text("StatelessWidget 小部件"),

              ),
              Divider(
                color: Colors.red,
                height: 20, //容器的高度，不是线的高度，设置不了线的高度
                indent: 10, //左侧间距

              ),
              Card(
                //带有圆角，阴影，边框等效果的卡片 类似于android 中的CardView
                color: Colors.blue,
                elevation: 5, //卡片的阴影
                margin: EdgeInsets.all(10), //上下左右是10的边距
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("I am A card",style: textStyle,),

                ),
              ),
              AlertDialog(
                title: Text("盘他"),
                content: Text("你个糟老头子坏得很"),
              )
            ],
          ),
        ),
      ),
    );
  }
}



