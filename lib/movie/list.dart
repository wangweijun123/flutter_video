import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  final String movieType;

  MovieList({Key key, @required this.movieType}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return new _MovieListState();
  }

}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Text("内容"+widget.movieType);
  }

}