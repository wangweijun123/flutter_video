import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'video',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // appbar 背景颜色
          backgroundColor: Colors.red,
          title: Text('video'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: clickme(),
            )
          ]),
          drawer: new Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                      accountName: Text("wangweijun"),
                      accountEmail: new Text("abc@qq.com"),
                      // 当前头像
                      currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555938062419&di=f892df6b6ee7a03581496f641977562a&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F00%2F15%2F72%2F6556aebbdc6d4fc.jpg"),),
                      // 装饰
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              // 背景图片
                              image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555938544882&di=c9d516a41e08357a3040d80daff01f89&imgtype=0&src=http%3A%2F%2Fpic17.nipic.com%2F20111121%2F2377880_193254815351_2.jpg")))

                  )
                ],
                padding: EdgeInsets.all(0),
              ),
          ),
    );
    ;
  }

/*clickme() {
    print("click search");
  }*/

}

clickme() {
  print("click search");
}