/**
 * 面向对象的学习
 */

class Person {
  String _name;
  String _age;

  Person(this._age, this._name);
}

class Student extends Person {
  String _school; //通过下划线代表私有变量
  String city;
  String country;
  String name;

  /// city为可选参数 country为默认参数
  Student(this._school, String age, String name,
      {this.city, this.country = "china"})
      :
        //初始化列表：除了调用父类构造器，在子类方法体之前你也可以实例化变量， 不同的变量用逗号分开
        name="$country.$city",
        //如果父类没有默认的构造方法，则需要在初始化列表中调用父类的构造方法
        super(age, name);

  //命名构造方法
  Student.cover(Student stu):super(stu.name,stu._age);

  ///命名工厂构造方法
  factory Student.stu(Student stu){
    return Student(stu._age,stu.name,stu._school);
  }

    String getSchool(){
    return _school;
  }
  String get s=>_school;

}

class Logger{
  static Logger _cache;


  //工厂构造方法 类似与单例模式
  factory Logger(){
    if(_cache==null){
      _cache=Logger._internal();
    }
    return _cache;
  }
  //类的私有构造方法
  Logger._internal();

  void log(String msg){
    print(msg);
  }
}
