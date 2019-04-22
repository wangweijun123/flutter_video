import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// 导入detail.dart
import './detail.dart';

Dio dio = new Dio();

class MovieList extends StatefulWidget {
  final String movieType;

  MovieList({Key key, @required this.movieType}) : super(key: key);

  @override
  _MovieListState createState() {
    return new _MovieListState();
  }
}

class _MovieListState extends State<MovieList> with AutomaticKeepAliveClientMixin{
  int page = 1;
  int pagesize = 10;

  int total = 0;

  // 用数组来表示列表
  var mlist = [];

  // 保存页面状态
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
//    return Text("内容"+widget.movieType + ' , total : ${total}');
    return ListView.builder(
        itemCount: mlist.length,
        itemBuilder: (BuildContext context, int index) {
          var item = mlist[index];
          return GestureDetector(
            // 点击事件
            onTap: () {
              print('xxxxxx');
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext ctx) {
                  return new MovieDetail(
                      id: item['id'],
                      title: item['title']);
                }
              ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              // 容器背景颜色与边框
              decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black))),
              // 整体横向排列
              child: Row(
                children: <Widget>[
                  Image.network(
                    item['images']['small'],
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    height: 150,
                    width: 300,
                    // 第二列是纵向排列
                    child: Column(
                      // 横向对齐模式
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // 纵向对齐方式
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('电影名称: ${item['title']}'),
                        Text('上映年份: ${item['year']}'),
                        Text('电影类型: ${item['genres'].join(', ')}'),
                        Text('豆瓣评分: ${item['rating']['average']}分'),
                        Text('主要演员: ${item['title']}'),
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  getMovieList() async {
    int offset = (page - 1) * pagesize;
    // http://www.liulongbin.top:3005/api/v2/movie/coming_soon?start=0&count=10
    String url =
        'http://www.liulongbin.top:3005/api/v2/movie/${widget.movieType}?start=$offset&count=${pagesize}';
    print(url);
    var response = await dio.get(url);
    var data = response.data;
    print(data);

    // 要想在界面上刷新total，必须卸载setstate之内
    setState(() {
      total = data['total'];
      mlist = data['subjects'];
      print(mlist.length);
      print(total);
    });
  }
}
