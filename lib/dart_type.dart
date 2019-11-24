import 'package:flutter/material.dart';

class DartType extends StatefulWidget {
  @override
  _DartTypeState createState() => _DartTypeState();
}

class _DartTypeState extends State<DartType> {
  @override
  Widget build(BuildContext context) {
    _numType(); //数字类型
    _stringType(); //字符串类型
    _listType();
    _mapType();
    _tips();
    return Container(child: Text("常用数字类型，请查看控制台输出"),);
  }

  void _numType() {
     num num1=-1.0; //数字类型的父类
     num num2=2;    //数字类型的父类
     int int1 =3;   //只能是整数
     double d1=3.14;  //双精度
     print("num1:$num1 num2:$num2 int1:$int1 double:$d1");
     print("num1的绝对值 $num1.abs()");
     print(num1.toInt());
     print(num1.toDouble());
  }
  _stringType(){
    String str1='字符串' , str2="双引号";//字符串的定义
    String str3="str1:$str1 str2:$str2";//字符串的拼接
    String str4="str1:"+str1+"str2:"+str2;//字符串的拼接
    print(str3);
    print(str4);
    print(str2.substring(1,2));//字符串的截取
    print(str2.indexOf("引"));
  }

  void _listType() {
    //这里声明的集合和java不太一样，java需要new出来一个集合对象，Dart只需要一个大括号
    List list1=[1,2,3,"我是海贼王"];
    print(list1);
    List<int> list2;
    //这么写是会报错的，因为list2里面已经加上了泛型限制，所以list2里面只能放int类型的数字
    //list2=list1;
    List list3=[];
    //声明一个定长的list
    List list4=new List(5);
    list3.add("list3");
    list3.addAll(list1);
    print("list3:$list3");
    //generate 函数 生成一个list 第一个参数是list元素个数 第二个是一个迭代器 （index)=>index *index
    //
    List list5=List.generate(3, (a)=>a *a);
    print(list5);

    //集合的遍历
    //1.for 循环遍历
    for(int i=0;i<list5.length;i++){
      print(list5[i]);
    }
    for(var o in list5){
      print(o);
    }
    list5.forEach((va){
      print(va);
    });
  }

  void _mapType(){
    //初始化集合用中括号[] 初始化键值对的map集合用大括号{}
    Map names={"xiaoming":"小明","xiaohong":"小红"};
    print(names);
    //第二种集合初始化方式
    Map ages={};
    ages["xiaocai"]=16;
    ages["xiaolei"]=18;
    print(ages);

    //map的遍历方式 foreach
    ages.forEach((key,value){
      print("$key,$value");
    });
    //第二种遍历方式
    Map ages2=ages.map((key,value){
      return MapEntry(value,key);
    });
    print(ages2);

    for(var key in ages.keys){
      //调用ages[key] 只能加大括号才能进行字符串拼接
      print("$key,${(ages[key])}");
    }


  }

  ///科普小知识 dynamic var object 三者的区别
  _tips(){
    //dynamic 动态数据类型 使用它编译器不能提醒你错误 因为它是运行时赋值的
    dynamic x="xiaocai";
    print(x.runtimeType);
    print(x);
    //可以被重新赋值为不同的数字类型
    x=123;
    print(x.runtimeType);
    print(x);

    //var 关键字 不关心它的数据类型是啥 不能被赋值为不同的数字类型
    var a="xiaocai";
    print(a.runtimeType);
    print(a);

    //object
    Object o="123";
    print(o.runtimeType);
    print(o);
    // o.foo(); //调用这个会被编译器报错，它只能调动object 中的方法


  }
}
