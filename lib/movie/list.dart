import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class MovieList extends StatefulWidget {
  final String movieType;

  MovieList({Key key, @required this.movieType}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return new _MovieListState();
  }

}

class _MovieListState extends State<MovieList> {
  int page = 1;
  int pagesize = 10;

  int total = 0;
  // 用数组来表示列表
  var mlist = [];

  @override
  Widget build(BuildContext context) {
    return Text("内容"+widget.movieType + ' , total : ${total}');
  }

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  getMovieList() async{
    int offset = (page - 1) * pagesize;
    String url = 'http://www.liulongbin.top:3005/api/v2/movie/${widget.movieType}?start=$offset&count=${pagesize}';
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